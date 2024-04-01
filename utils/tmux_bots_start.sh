#!/bin/bash

export WORK_DIR=/home/digriz/github/freqtrade
export FREQTRADE_VENV=/home/digriz/github/freqtrade/.env/bin/activate
SESS_NAME='freqtrade_main'

# Check if we already started
tmux has-session -t $SESS_NAME 2>/dev/null
SESS_EXIST=$?

if [ $SESS_EXIST -eq 0 ]
then
   echo "Look's like you already have running session with name $SESS_NAME"
   exit 0
fi

# PANE 0
tmux new-sess -d -s $SESS_NAME -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
tmux send-keys 'freqtrade trade -s HMA_val_down4_cci -c HMA_val_down4_cci_okx_config.json' 'C-m'

# PANE 1
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
tmux send-keys 'freqtrade trade -s HMA_val_down4_cci -c HMA_val_down4_cci_config.json' 'C-m'

# PANE 2
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
tmux send-keys 'freqtrade trade -s bbrsi_new_optimize -c bbrsi_new_optimize_config.json' 'C-m'

# PANE 3
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
tmux send-keys 'freqtrade trade -s HMA_val_fast -c HMA_val_fast_config.json' 'C-m'

# PANE 4
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
tmux send-keys 'freqtrade trade -s HMA_val_down4_cci_okx_hodl -c HMA_val_down4_cci_okx_config_hodl.json' 'C-m'

# PANE 5
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
tmux send-keys 'freqtrade trade -s HMA_val_fast -c okx_luna_config.json' 'C-m'

# PANE 6 - RESERVED
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
#tmux send-keys 'freqtrade trade -s HMA_val_down4_cci -c HMA_val_down4_cci_okx_config.json' 'C-m'

# PANE 7 - RESERVED
tmux split-window -v -c $WORK_DIR
tmux send-keys "source $FREQTRADE_VENV" 'C-m'
tmux resize-pane -U 10
#tmux send-keys 'freqtrade trade -s HMA_val_down4_cci -c HMA_val_down4_cci_okx_config.json' 'C-m'
