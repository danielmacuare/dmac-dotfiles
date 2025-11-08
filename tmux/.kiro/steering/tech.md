# Technology Stack

## Core Technology

- **tmux**: Terminal multiplexer (requires version 1.9+)
- **Shell**: zsh (macOS)
- **Configuration Format**: tmux.conf (shell-like syntax)

## Plugin Manager

- **TPM (Tmux Plugin Manager)**: Manages tmux plugins
- Installation location: `~/.config/tmux/plugins/tpm/`

## Plugins Used

1. **catppuccin/tmux** - Mocha flavor theme
2. **christoomey/vim-tmux-navigator** - Seamless vim/tmux pane navigation
3. **dreknix/tmux-primary-ip** - Display primary IP address
4. **hendrikmi/tmux-cpu-mem-monitor** - CPU and memory monitoring (Python-based)
5. **tmux-plugins/tmux-resurrect** - Session persistence
6. **tmux-plugins/tmux-continuum** - Automatic session saving
7. **tmux-plugins/tmux-battery** - Battery status display
8. **tmux-plugins/tmux-online-status** - Network connectivity status

## Dependencies

- git (for plugin management)
- bash (for plugin scripts)
- Python 3 (for cpu-mem-monitor plugin)
- pbcopy (macOS clipboard utility)
- Nerd Fonts (for icon display)

## Common Commands

### Reload Configuration
```bash
tmux source ~/.config/tmux/tmux.conf
```
Or use the keybinding: `Prefix + r`

### Plugin Management
- Install plugins: `Prefix + I` (capital I)
- Update plugins: `Prefix + U` (capital U)
- Uninstall plugins: `Prefix + Alt + u`

### Session Management
- New session: `tmux new -s <session-name>`
- Attach to session: `tmux attach -t <session-name>`
- List sessions: `tmux ls`
- Detach: `Prefix + d`

## Configuration Location

Primary config file: `~/.config/tmux/tmux.conf`
Target deployment location specified in config: `TARGET=~/.config/tmux/tmux.conf`
