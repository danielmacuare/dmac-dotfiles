# ~/dotfiles/zsh/completion.zsh

# ---- COMPLETION STYLES CONFIG ----

# Disable sorting for git checkout (show recent branches first)
zstyle ':completion:*:git-checkout:*' sort false

# Show descriptions for options
zstyle ':completion:*:descriptions' format '[%d]'

# Enable coloring in the menu (uses LS_COLORS)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Prevent standard Zsh menu from showing (fzf-tab takes over)
zstyle ':completion:*' menu no

# Preview directory content when completing 'cd'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Switch groups using comma and dot
zstyle ':fzf-tab:*' switch-group ',' '.'

# Pop up feature for tmux> 3.2
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
