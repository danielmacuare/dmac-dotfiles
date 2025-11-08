# Project Structure

## Directory Layout

```
.
├── init.lua                 # Main entry point - loads core config and plugins
├── lua/
│   ├── core/               # Core Neovim configuration
│   │   ├── keymaps.lua    # Key mappings and shortcuts
│   │   └── options.lua    # Neovim options and settings
│   └── plugins/           # Plugin configurations (one file per plugin)
│       ├── lsp.lua        # LSP configuration with Mason
│       ├── telescope.lua  # Fuzzy finder setup
│       ├── neo-tree.lua   # File explorer
│       ├── catpuccin.lua  # Color scheme
│       ├── lualine.lua    # Status line
│       ├── bufferline.lua # Buffer/tab line
│       ├── treesitter.lua # Syntax highlighting
│       ├── autocompletion.lua
│       ├── autoformatting.lua
│       ├── signsgit.lua   # Git integration
│       ├── alpha.lua      # Start screen
│       ├── noice.lua      # UI enhancements
│       ├── trouble.lua    # Diagnostics
│       ├── todo-comments.lua
│       ├── zen-mode.lua
│       ├── vim-tmux-navigator.lua
│       ├── indent-blanklines.lua
│       ├── render-markdown.lua
│       └── misc.lua       # Miscellaneous plugins
├── stylua.toml            # Lua formatter configuration
├── lazy-lock.json         # Plugin version lock file
└── lazyvim.json          # LazyVim metadata
```

## Architecture Patterns

### Plugin Configuration Pattern
Each plugin is configured in its own file under `lua/plugins/`. Plugin files follow this structure:

```lua
-- Purpose: Brief description
-- Link: GitHub URL

return {
  'author/plugin-name',
  dependencies = { ... },
  config = function()
    -- Plugin setup and configuration
    -- Keymaps specific to this plugin
  end,
}
```

### Configuration Loading
1. `init.lua` loads core configuration first (`core.options`, `core.keymaps`)
2. Then initializes lazy.nvim plugin manager
3. Finally loads all plugin configurations from `lua/plugins/`

### Keymap Conventions
- Leader key: `<Space>`
- Local leader: `<Space>`
- Keymaps are defined either in:
  - `lua/core/keymaps.lua` for general editor keymaps
  - Individual plugin files for plugin-specific keymaps

### Code Style
- Indentation: 2 spaces
- Line length: 160 characters max
- Quote style: Single quotes preferred
- Function calls: Omit parentheses when possible (Lua style)
- Comments: Include purpose and link at top of plugin files

## File Naming
- Lua files: lowercase with hyphens (e.g., `neo-tree.lua`, `todo-comments.lua`)
- Configuration files: lowercase (e.g., `keymaps.lua`, `options.lua`)
