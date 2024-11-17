#!/bin/bash
# This is simple stop-script for closing multiple running Freq bot's in tmux
# if you have a big db and still see panes, wait - db will close anyway

# Set tmux session name
SESS_NAME='freqtrade_main'
# Time in seconds to save & close the database
INTERVAL=25

# Define function to send commands
send_commands() {
    tmux send-keys -t "$SESS_NAME" 'C-c' 'C-m'
    tmux send-keys -t "$SESS_NAME" 'exit' 'C-m'
}

# Check if session exists
tmux has-session -t $SESS_NAME >/dev/null 2>&1
SESS_EXIST=$?

if [ $SESS_EXIST -eq 0 ]; then
    # Get initial count of panes
    PANES=$(tmux list-panes -t $SESS_NAME 2>/dev/null | grep -c .)
    echo "$PANES - Total panes!"
    echo "Will be closed at intervals $INTERVAL sec"
    # Close each pane one by one
    pane=0
    while true; do
        # Check if there are any open panes left
        OPEN_PANES=$(tmux list-panes -t $SESS_NAME 2>/dev/null | grep -c .)    
        if [ $OPEN_PANES -eq 0 ]; then
            break
        fi
        send_commands
        echo "[$((pane+1))/$PANES] is closed..."
        sleep $INTERVAL
        ((pane++))
    done
    echo "All Freqtrade-bots in session $SESS_NAME are closed!"
else
    echo "Looks like you don't have a running session with name $SESS_NAME"
    exit 0
fi
