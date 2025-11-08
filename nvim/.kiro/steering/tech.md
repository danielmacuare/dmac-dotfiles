# Technology Stack

## Core Technologies

- **Editor**: Neovim (configured with Lua)
- **Plugin Manager**: lazy.nvim
- **Language**: Lua (for configuration)

## Key Dependencies

### LSP & Language Support
- `nvim-lspconfig` - LSP client configurations
- `mason.nvim` - LSP/tool installer
- `mason-lspconfig.nvim` - Bridge between Mason and lspconfig
- `nvim-cmp` - Auto-completion engine
- `conform.nvim` - Auto-formatting

### Navigation & Search
- `telescope.nvim` - Fuzzy finder
- `neo-tree.nvim` - File explorer
- `nvim-treesitter` - Syntax highlighting and parsing

### UI Components
- `catppuccin` - Color scheme
- `lualine.nvim` - Status line
- `bufferline.nvim` - Buffer/tab line
- `alpha.nvim` - Start screen
- `noice.nvim` - UI enhancements

### Git Integration
- `gitsigns.nvim` - Git decorations

### Other Tools
- `vim-tmux-navigator` - Tmux integration
- `trouble.nvim` - Diagnostics list
- `todo-comments.nvim` - TODO highlighting
- `zen-mode.nvim` - Distraction-free mode

## Supported Language Servers

Python (pylsp, ruff), Rust (rust-analyzer), Lua (lua_ls), HTML, CSS, Tailwind, JSON, SQL, Terraform, YAML, Bash, GraphQL, Docker, LaTeX

## Code Formatting

- **Tool**: StyLua (for Lua code)
- **Configuration**: `stylua.toml`
  - Column width: 160
  - Indent: 2 spaces
  - Quote style: Auto-prefer single quotes
  - Call parentheses: None (omit when possible)

## Common Commands

Since this is a Neovim configuration (not a standalone application), there are no build/test commands. The configuration is loaded when Neovim starts.

### Installation
Plugins are automatically installed via lazy.nvim on first launch.

### Plugin Management
- `:Lazy` - Open lazy.nvim plugin manager UI
- `:Lazy sync` - Install/update/clean plugins
- `:Mason` - Open Mason LSP installer UI
