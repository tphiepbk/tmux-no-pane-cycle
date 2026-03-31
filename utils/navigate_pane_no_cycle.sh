#!/usr/bin/env bash

DIRECTION=$1

case $DIRECTION in
    -U)  target_pane=pane_top   ;;
    -D)  target_pane=pane_bottom;;
    -L)  target_pane=pane_left  ;;
    -R)  target_pane=pane_right ;;
    *)  exit 1 ;;
esac

# Get the window size
window_width=$(tmux display -p "#{window_width}")
window_height=$(tmux display -p "#{window_height}")

# Get the limit position
right_most=$(( window_width - 1 ))
left_most=0
bottom_most=$(( window_height - 1 ))
top_most=0

# Get the position of target pane
target_pane_position=$(tmux display -p "#{$target_pane}")

switchable=0

case $DIRECTION in
    -U)
        if [[ "${target_pane_position}" -gt "${top_most}" ]]; then
            switchable=1
        fi
    ;;
    -D)
        if [[ "${target_pane_position}" -lt "${bottom_most}" ]]; then
            switchable=1
        fi
    ;;
    -L)
        if [[ "${target_pane_position}" -gt "${left_most}" ]]; then
            switchable=1
        fi
    ;;
    -R)
        if [[ "${target_pane_position}" -lt "${right_most}" ]]; then
            switchable=1
        fi
    ;;
    *)  exit 1 ;;
esac;

if [[ "$switchable" -eq 1 ]]; then
    tmux select-pane "$DIRECTION"
fi

