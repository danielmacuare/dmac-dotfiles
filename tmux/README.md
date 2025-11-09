# TMUX Configuration

Personal tmux configuration with a custom Catppuccin Mocha themed status bar, vim-style keybindings, and enhanced functionality.

![TMUX Status Bar](./resources/tmux-bar.png)

## Features

- **Custom Status Bar**: Displays session info, current command, path, IP address, CPU, and memory usage
- **Catppuccin Mocha Theme**: Beautiful, consistent color scheme
- **Vim-style Navigation**: Seamless pane navigation with vim keybindings
- **Session Persistence**: Automatic session saving and restoration
- **Mouse Support**: Full mouse integration for pane/window management
- **System Clipboard Integration**: Copy/paste with system clipboard

## Installation

### Prerequisites

- tmux 1.9+
- git
- bash
- Python 3 (for cpu-mem-monitor plugin)
- Nerd Font (for icon display)

### Setup

1. Clone this repository:
```bash
git clone <repo-url> ~/.config/tmux
```

2. Install TPM (Tmux Plugin Manager):
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

3. Start tmux and install plugins:
```bash
tmux
# Press Ctrl+Space then I (capital i) to install plugins
```

## Keybindings

### Prefix Key
The prefix key is changed from default `Ctrl+b` to **`Ctrl+Space`**

### Pane Management

| Keybinding | Action |
|------------|--------|
| `Prefix + \` | Split pane horizontally |
| `Prefix + -` | Split pane vertically |
| `Ctrl+h/j/k/l` | Navigate panes (vim-style, no prefix needed) |
| `Prefix + h/j/k/l` | Resize pane (repeatable) |
| `Prefix + m` | Maximize/zoom current pane |

### Window Management

| Keybinding | Action |
|------------|--------|
| `Prefix + c` | Create new window (in current path) |
| `Prefix + p` | Previous window |
| `Prefix + n` | Next window |
| `Prefix + 0-9` | Switch to window by number |

### Copy Mode (Vi-style)

| Keybinding | Action |
|------------|--------|
| `Prefix + [` | Enter copy mode |
| `v` | Start selection (in copy mode) |
| `y` | Copy selection (stays in copy mode) |
| `Prefix + P` | Paste buffer |

### Session Management

| Keybinding | Action |
|------------|--------|
| `Prefix + d` | Detach from session |
| `Prefix + $` | Rename session |

### Other Useful Keybindings

| Keybinding | Action |
|------------|--------|
| `Prefix + r` | Reload tmux configuration |
| `Prefix + a` | Toggle synchronize-panes (send commands to all panes) |
| `Prefix + I` | Install plugins (TPM) |
| `Prefix + U` | Update plugins (TPM) |
| `Prefix + Alt+u` | Uninstall plugins (TPM) |

## Configuration

The main configuration file is `tmux.conf`. Key settings:

- **Prefix**: `Ctrl+Space`
- **Mouse**: Enabled
- **History**: 1,000,000 lines
- **Escape time**: 0ms (for Neovim compatibility)
- **Base index**: Windows and panes start at 1
- **Vi mode**: Enabled for copy mode

## Plugins

- **tpm**: Tmux Plugin Manager
- **vim-tmux-navigator**: Seamless vim/tmux pane navigation
- **tmux-primary-ip**: Display primary IP address
- **tmux-cpu-mem-monitor**: CPU and memory monitoring
- **tmux-resurrect**: Session persistence
- **tmux-continuum**: Automatic session saving (every 15 minutes)

## Common Commands

### Session Management
```bash
# Create new session
tmux new -s <session-name>

# Attach to session
tmux attach -t <session-name>

# List sessions
tmux ls

# Kill session
tmux kill-session -t <session-name>
```

### Reload Configuration
```bash
tmux source ~/.config/tmux/tmux.conf
```
Or use `Prefix + r` inside tmux.

## Customization

### Colors
Catppuccin Mocha colors are defined in the config (lines 107-125). Modify these to change the theme.

### Status Bar
The custom status bar configuration starts at line 130. Adjust segments, icons, and formatting as needed.

### Keybindings
All keybindings are in `tmux.conf`. Modify or add new bindings to suit your workflow.

## Troubleshooting

### Icons not displaying
Install a Nerd Font and configure your terminal to use it.

### Plugins not working
1. Ensure TPM is installed: `~/.config/tmux/plugins/tpm`
2. Press `Prefix + I` to install plugins
3. Restart tmux

### Colors look wrong
Ensure your terminal supports 256 colors and true color:
```bash
echo $TERM  # Should show tmux-256color when inside tmux
```

## License

Personal configuration - feel free to use and modify as needed.
