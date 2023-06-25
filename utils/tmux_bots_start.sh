#!/bin/bash
# example script for start multiple Freqtrade bot's

export WORK_DIR=/home/mikedigriz/github/freqtrade
export FREQTRADE_VENV=/home/mikedigriz/github/freqtrade/venv/bin/activate

# PANE 0
tmux new-sess -d -s freqtrade_main -c $WORK_DIR
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
