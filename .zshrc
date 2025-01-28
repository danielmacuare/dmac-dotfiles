# TARGET=~/.zshrc            

# end-of-line Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---- PLUGINS & THEMES ----

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	#autojump
	#copypath
	#git
	#terraform
	#thefuck
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# IMPORTANT: Source and export should always go after the plugins section
# Link: https://stackoverflow.com/questions/15682456/oh-my-zsh-config-file-not-loading/15882090#15882090

# Wezterm
export TERM="wezterm"
export DMAC="wezterm"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## ---- PLUGINS CONFIG ----

# For zsh-autosuggestion
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=#000000,bold,underline"

# Command-not-found plugin
# https://github.com/Homebrew/homebrew-command-not-found#install
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

# fzf auto-completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Sourcing files
source $HOME/.aliases

if [ -f "$HOME/.custom_functions" ]; then
    source "$HOME/.custom_functions"
else
    echo "File $HOME/.custom_functions doesn't exists"
fi

# Man pages with bat
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# VSCode points to /opt/homebrew/ instead of /usr/local/bin
export PATH=/usr/local/bin:${PATH}

# Ruby for Jekyll
eval "$(rbenv init - zsh)"

# Custom Functions (To be taken out of here)
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
bindkey '`' autosuggest-execute # Tick to accept zsh suggestions
bindkey '\t\t' forward-word	# Double tap to accept word forward zsh auto-suggestions
