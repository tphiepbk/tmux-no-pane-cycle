#!/usr/bin/env bash

DIRECTION=$1

case $DIRECTION in
    -U)  target_pane=pane_top   ;;
    -D)  target_pane=pane_bottom;;
    -L)  target_pane=pane_left  ;;
    -R)  target_pane=pane_right ;;
    *)  exit 1 ;;
esac

current_pane=$(tmux display -p "#{$target_pane}")

tmux select-pane "$DIRECTION"

new_pane=$(tmux display -p "#{$target_pane}")

case $DIRECTION in
    -U|-L)
        if [[ "$new_pane" -gt "$current_pane" ]]; then
            tmux select-pane -l
        fi
    ;;
    -D|-R)
        if [[ "$new_pane" -lt "$current_pane" ]]; then
            tmux select-pane -l
        fi
    ;;
    *)  exit 1 ;;
esac;
