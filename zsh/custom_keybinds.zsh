# ---- HISTORY NAVIGATION ----
# Use Up/Down arrows to search history based on what you already typed
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- ZSH AUTOSUGGESTIONS ----
# ` (Backtick) to execute the suggestion immediately
bindkey '`' autosuggest-execute

# Alt + l to accept the suggestion (like pressing Right Arrow)
bindkey '\el' autosuggest-accept

# Alt + h to accept just the next word
bindkey '\eh' forward-word

# ---- FZF RESTORATION ----
# Force Ctrl+R to use FZF (fixes conflict with Oh My Zsh)
bindkey '^R' fzf-history-widget
