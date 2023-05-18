#!/bin/sh

if [ "$1" = "-h" ]; then
    echo ""
    echo "t - the smart tmux session manager"
    echo "https://github.com/joshmedeski/t-smart-tmux-session-manager"
    echo ""
    echo "Run interactive mode"
    echo "  t"
    echo ""
    echo "Go to session"
    echo "  t {name}"
    echo ""
elif [ $# -eq 0 ]; then
    if [ -z "$TMUX" ]; then
        ZOXIDE_RESULT=$(echo "$HOME\n$(zoxide query -l)" | fzf)
    else
        ZOXIDE_RESULT=$(echo "$HOME\n$(zoxide query -l)" | fzf-tmux -p --reverse)
    fi
else
    ZOXIDE_RESULT=$(zoxide query $1)
fi

if [ -z "$ZOXIDE_RESULT" ]; then
    exit 0
fi

FOLDER=$(basename $ZOXIDE_RESULT)
SESSION_NAME=$(echo $FOLDER | tr ' ' '_' | tr '.' '_')

# lookup tmux session name
SESSION=$(tmux list-sessions | grep $SESSION_NAME | awk '{print $1}')
SESSION=${SESSION//:/}

# if not currently in tmux
if [ -z "$TMUX" ]; then
    # tmux is not active
    if [ -z "$SESSION" ]; then
        # session does not exist
        # create session
        tmux new-session -c $ZOXIDE_RESULT -s $SESSION_NAME
    else
        # session exists
        # attach to session
        tmux attach -t $SESSION
    fi
else
    # tmux is active
    if [ -z "$SESSION" ]; then
        # session does not exist
        # create session
        tmux new-session -d -c $ZOXIDE_RESULT -s $SESSION_NAME
        # attach to session
        tmux switch-client -t $SESSION_NAME
    else
        # session exists
        # attach to session
        # switch to tmux session
        tmux switch-client -t $SESSION
    fi
fi

