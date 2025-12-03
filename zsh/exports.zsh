# TARGET=~/.config/zsh/exports.zsh
# Environment variables and exports
# ---- TERMINAL ----
export TERM="wezterm"

# ---- MAN PAGES ----
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# ---- PATH ----
# VSCode points to /opt/homebrew/ instead of /usr/local/bin
export PATH=/usr/local/bin:${PATH}
