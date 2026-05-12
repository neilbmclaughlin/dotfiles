#!/bin/bash

# Configuration - USE FULL PATHS
WHISPER_EXE="/Users/neil/work/personal/whisper.cpp/build/bin/whisper-cli"
MODEL="/Users/neil/work/personal/whisper.cpp/models/ggml-small.en.bin"
FFMPEG="/usr/local/bin/ffmpeg" # Double check with 'which ffmpeg'
TEMP_WAV="/tmp/voice.wav"
PID_FILE="/tmp/whisper_v.pid"

# --- STOP & TRANSCRIBE ---
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    kill "$PID" 2>/dev/null
    rm "$PID_FILE"
    
    tmux display-message "Transcribing..."

    RESULT=$("$WHISPER_EXE" -m "$MODEL" -f "$TEMP_WAV" -nt -ng -t 8 -nth 0.1 -et 3.0 -ac 0 2>/dev/null)
    CLEAN_TEXT=$(echo "$RESULT" | tr -d '\n' | sed 's/\[.*\] //g' | xargs)
    
    if [[ ${#CLEAN_TEXT} -gt 1 ]]; then
        tmux set-buffer "$CLEAN_TEXT"
        # The 'i' helps Neovim, but works in raw terminal too
        # tmux send-keys "i" 
        tmux paste-buffer -p
    fi
    exit 0
fi

# --- START RECORDING ---
rm -f "$TEMP_WAV"
tmux display-message -d 0 "● RECORDING..."

# The magic line: redirect all output and background it
$FFMPEG -f avfoundation -thread_queue_size 4096 -i ":1" -ar 16000 -ac 1 -af "volume=1.5" "$TEMP_WAV" -y -loglevel quiet </dev/null >/dev/null 2>&1 &

echo $! > "$PID_FILE"

# Tell the shell to forget about this background task so it can exit
disown
exit 0
