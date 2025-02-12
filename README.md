# Dotfiles

This repository contains my personal dotfiles and system configuration. I don't currently use a dotfiles manager to automate the process of deploying these dotfiles.

## Prerequisites

Before you begin, ensure you have the following installed:

- Git
- Python UV (for managing Python packages)

### 3. Install Pre-commit Hooks

1. Install pre-commit using UV:

```bash
uv venv
uv pip install pre-commit
```

2. Install the pre-commit hooks:

```bash
pre-commit install
```

## Usage

### Managing Dotfiles

1. Clone this repository:

```bash
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
```

2. (Optional) Create symlinks yourself or use something like GNU Stow

```
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc    # Symlinking a file
ln -sf ~/dotfiles/karabiner/ ~/.config/  # Symlinking a folder
```

The repository includes a `.pre-commit-config.yaml` file that checks for:

- Gitleaks - Secrets leaked before commit

### Notes

- For tmux, after creating the symlink, you need to open tmux and install its plugins using `tmux-prefix + r`
