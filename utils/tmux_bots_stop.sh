#!/bin/bash
# this is simple stop-script for close multiple running Freq bot's in tmux
# if you have big db and still see panes, wait - db will close anyway

# set tmux session name
SESS_NAME='freqtrade_main'
# time in sec. for save&close database.
INTERVAL=25

PANES=$(tmux list-panes -t $SESS_NAME 2>/dev/null | wc -l)
tmux has-session -t $SESS_NAME 2>/dev/null
SESS_EXIST=$?

if [ $SESS_EXIST -eq 0 ]; then
    echo "$PANES - Total panes!"
    echo "Will be closed at intervals $INTERVAL sec"
    pane=0
    while [ $pane -lt "$PANES" ]; do
        tmux send-keys -t $SESS_NAME 'C-c' 'C-m'
        tmux send-keys -t $SESS_NAME 'exit' 'C-m'
        pane=$(("$pane" + 1))
        echo [$pane/"$PANES"] is closed...
        sleep $INTERVAL
    done
    echo "Freqtrade-bots in session $SESS_NAME are closed!"
else
    echo "Look's like you don't have running session with name $SESS_NAME"
    exit 0
fi
