#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

UTILS_DIR="${CURRENT_DIR}/utils"

tmux bind-key h run-shell "${UTILS_DIR}/navigate_pane_no_cycle.sh -L"
tmux bind-key j run-shell "${UTILS_DIR}/navigate_pane_no_cycle.sh -D"
tmux bind-key k run-shell "${UTILS_DIR}/navigate_pane_no_cycle.sh -U"
tmux bind-key l run-shell "${UTILS_DIR}/navigate_pane_no_cycle.sh -R"
