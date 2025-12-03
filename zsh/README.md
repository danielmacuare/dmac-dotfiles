# ZSH Configuration

Modular ZSH configuration using oh-my-zsh, Powerlevel10k, and various plugins.

## Structure

```
zsh/
├── .zshrc                  # Main configuration file (symlink to ~/.zshrc)
├── exports.zsh             # Environment variables and PATH configuration
├── completion.zsh          # Custom completion styling
├── custom_aliases.zsh      # Custom command aliases
├── custom_functions.zsh    # Custom shell functions
└── custom_keybinds.zsh     # Custom key bindings
```

## Installation

1. Ensure `$XDG_CONFIG_HOME` is set (typically `~/.config`)
2. Symlink `.zshrc` to your home directory:
   ```bash
   ln -sf $XDG_CONFIG_HOME/zsh/.zshrc ~/.zshrc
   ```
3. Restart your shell or run `source ~/.zshrc`

## Dependencies

- [oh-my-zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) - fzf integration for tab completion
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [Homebrew command-not-found](https://github.com/Homebrew/homebrew-command-not-found)
- rbenv (for Ruby/Jekyll)

## Loading Order

The configuration loads in this specific order:

1. **Powerlevel10k instant prompt** - Must be at the top for fast startup
2. **FZF** - Loaded early for Ctrl+r and Ctrl+t
3. **oh-my-zsh plugins** - Core functionality
4. **oh-my-zsh initialization** - Loads compinit
5. **exports.zsh** - Environment variables
6. **Plugin configurations** - Autosuggestions, command-not-found
7. **completion.zsh** - Completion styling
8. **custom_aliases.zsh** - Command aliases
9. **custom_functions.zsh** - Shell functions
10. **Powerlevel10k config** - Theme customization
11. **custom_keybinds.zsh** - Key bindings
12. **rbenv** - Ruby environment

## Important Notes

- FZF must be sourced before fzf-tab plugin loads
- Exports and sourcing must come after oh-my-zsh initialization
- `$XDG_CONFIG_HOME` must be set before loading this config
- Missing optional files will print a warning but won't break the shell

## Customization

Edit the modular files instead of `.zshrc`:

- **Aliases**: Edit `custom_aliases.zsh`
- **Functions**: Edit `custom_functions.zsh`
- **Environment variables**: Edit `exports.zsh`
- **Key bindings**: Edit `custom_keybinds.zsh`
- **Completions**: Edit `completion.zsh`

To customize the Powerlevel10k prompt, run:
```bash
p10k configure
```
