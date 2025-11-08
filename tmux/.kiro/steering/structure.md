# Project Structure

## Root Level

```
.
├── tmux.conf              # Main tmux configuration file
├── README.md              # Project documentation
├── plugins/               # All tmux plugins (git submodules)
└── resources/             # Assets (screenshots, images)
```

## Configuration File

- **tmux.conf**: Single monolithic configuration file containing:
  - General settings (clipboard, history, escape time)
  - Custom keybindings (prefix: Ctrl+Space)
  - Pane and window management
  - Plugin declarations
  - Custom status bar configuration
  - Theme settings (Catppuccin Mocha)

## Plugins Directory

Each plugin is a separate git repository cloned into `plugins/`:

- **plugins/tmux/** - Catppuccin theme
- **plugins/tpm/** - Tmux Plugin Manager
- **plugins/vim-tmux-navigator/** - Vim integration
- **plugins/tmux-primary-ip/** - IP display
- **plugins/tmux-cpu-mem-monitor/** - System monitoring (Python)
- **plugins/tmux-resurrect/** - Session persistence
- **plugins/tmux-continuum/** - Auto-save sessions
- **plugins/tmux-battery/** - Battery status
- **plugins/tmux-online-status/** - Network status

### Plugin Structure Pattern

Most plugins follow this structure:
```
plugin-name/
├── README.md
├── plugin-name.tmux       # Main plugin entry point
├── scripts/               # Shell scripts for functionality
├── docs/                  # Documentation
└── tests/                 # Test files
```

## Resources

- **resources/tmux-bar.png**: Screenshot of the configured status bar

## Configuration Conventions

1. **Prefix Key**: Changed from default `Ctrl+b` to `Ctrl+Space`
2. **Split Keybindings**: `\` for horizontal, `-` for vertical
3. **Pane Navigation**: Vim-style (`Ctrl+h/j/k/l`)
4. **Window Indexing**: Starts at 1 (not 0)
5. **Color Scheme**: Catppuccin Mocha with custom status bar colors
6. **Status Bar**: Custom left/right segments with system info

## Deployment

The configuration is designed to be deployed to `~/.config/tmux/tmux.conf` as indicated by the TARGET comment in the main config file.
