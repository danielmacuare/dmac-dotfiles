mkd () {
    mkdir "$1"
    cd "$1"
}

gacp () {
    git add .
    git commit -a -m "$1"
    git push
}

gac () {
    git add .
    git commit -a -m "$1"
}

gcmp () {
    git commit -a -m "$1"
    git push
}

# Chromaterm
ssh() { /usr/bin/ssh "$@" | ct; }


# FZF xp
funct xp () {
    if [ ! -z $1 ]; then
        current_directory=$1
    else
        current_directory='.'
    fi
    source $HOME/custom_scripts/fzf_explorer.sh
}

# To bypass ZSHR intial log message about this
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# UV Python auto-completion
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# History setup
HISTSIZE=10000 # Commands to be saved in our history
SAVEHIST=$HISTSIZE
HISTDUP=erase # Will delete any duplicate entry
HISTFILE=$HOME/.zhistory

# https://linux.die.net/man/1/zshoptions
setopt append_history
setopt share_history
setopt hist_ignore_space # Will not add any command that is prefixed with space to the history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt hist_verify

# TMUX
# Tmux https://github.com/zsh-users/zsh-autosuggestions/issues/229
export TERM=xterm-256color

# ---- CUSTOM KEYBINDS ----
# history
bindkey '^[[A' history-search-backward # Escape Sequence for UP Arrow
bindkey '^[[B' history-search-forward # Escape Sequence for Down Arrow

# zsh-autosuggestions
#bindkey '`' autosuggest-execute # Tick to accept zsh suggestions
#bindkey '\t\t' forward-word	# Double tap to accept word forward zsh auto-suggestions

# Zoxide
eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-07-24 12:13:39
export PATH="$PATH:/Users/dmac/.local/bin"

# [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# https://github.com/kirodotdev/Kiro/issues/1393# 
if [[ $TERM_PROGRAM == "kiro" ]]; then
  source "$(kiro --locate-shell-integration-path zsh)"
else
  :   # Placeholder empty command, maintain exit status as 0.
fi



# FZF SSH with improved UI
fssh() {
    local host
    host=$(awk '
        /^Host / {host=$2}
        /HostName/ {hostname=$2}
        /Port/ {port=$2}
        /User/ {user=$2}
        /^$/ {
            if (host && host != "*") {
                printf "%-15s %-20s %-15s %s\n", host, hostname, user, port
                host=""; hostname=""; user=""; port="22"
            }
        }
        END {
            if (host && host != "*") {
                printf "%-15s %-20s %-15s %s\n", host, hostname, user, port
            }
        }
    ' ~/.ssh/config | \
    fzf --prompt="🔍 SSH > " \
        --header="HOST            HOSTNAME             USER            PORT" \
        --header-lines=0 \
        --height=60% \
        --border=rounded \
        --border-label=" 🌐 SSH Connections " \
        --border-label-pos=2 \
        --color="header:bold:underline:cyan,border:cyan,label:green:bold,prompt:cyan:bold" \
        --preview="echo '\033[1;36m📋 Connection Details:\033[0m\n'; grep -A 10 '^Host {1}' ~/.ssh/config | sed 's/^/  /' | sed 's/Host /\x1b[1;32mHost:\x1b[0m /; s/HostName /\x1b[1;33mHostName:\x1b[0m /; s/Port /\x1b[1;35mPort:\x1b[0m /; s/User /\x1b[1;34mUser:\x1b[0m /'" \
        --preview-window=right:40%:wrap \
        --info=inline \
        --pointer="▶" \
        --marker="✓" | \
    awk '{print $1}')
    
    if [ -n "$host" ]; then
        echo "🚀 Connecting to $host..."
        ssh "$host"
    else
        echo "❌ Connection cancelled"
    fi
}
