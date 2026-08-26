# tmux-no-pane-cycle

Navigating between panes without cycle

## Installation with Tmux Plugin Manager (recommended)

Add plugin to the list of TPM plugins:

```
set -g @plugin 'tphiepbk/tmux-no-pane-cycle'
```

Use `prefix` + <kbd>I</kbd> to install it.

## Options

```
# Enable the popup whenever could not move (default value is 'no')
set-option -g @no-pane-cycle-popup 'yes'

# Set the timeout of the popup 
set-option -g @no-pane-cycle-popup-timeout '0.5'
```

## License

[MIT](LICENSE)
