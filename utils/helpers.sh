#!/usr/bin/env bash

function cmd_get_tmux_version() {
    echo "tmux -V | awk '{ print toupper(\$0) }'"
}

function get_tmux_option() {
    local option="$1"
    local default_value="$2"
    local option_value
    option_value=$(tmux show-option -gqv "$option")
    if [[ -z "$option_value" ]]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

function toggle_zoom() {
    tmux resize-pane -Z
}

function show_popup() {
    local message="$1"
    local popup_width="20%"
    local popup_height="5%"
    local popup_x_pos="R"
    local popup_y_pos="0%"

    local sleep_time
    sleep_time=$(get_tmux_option "@no-pane-cycle-popup-timeout" "0.5")

    local hide_cursor_cmd="tput civis"
    local disable_keyboard_cmd="stty -echo && exec < /dev/null"

    tmux display-popup -w ${popup_width} \
                        -h ${popup_height} \
                        -x ${popup_x_pos} \
                        -y ${popup_y_pos} \
                        -b "rounded" \
                        -s "fg=color11" \
                        -S "fg=color9" \
                        -NE \
                        "${hide_cursor_cmd} &&
                        ${disable_keyboard_cmd} &&
                        echo \"${message}\" && sleep ${sleep_time}"
}

