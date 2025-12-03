# TARGET=~/.zshrc

# end-of-line Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---- FZF AUTO-COMPLETION ----
# This allows to use fzf for Ctrl+r and Ctrl+t but lets fzf-tab take over the TAB key later.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ---- PLUGINS & THEMES ----

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf-tab # Shows you the fzf results of the completion syste
)

# Add zsh-completions to fpath - This loads the completions data
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# IMPORTANT: Source and export should always go after the plugins section
# Link: https://stackoverflow.com/questions/15682456/oh-my-zsh-config-file-not-loading/15882090#15882090

# Wezterm
export TERM="wezterm"
export DMAC="wezterm"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh # This loads compinit


## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## ---- PLUGINS CONFIG ----

# For zsh-autosuggestion
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=#000000,bold,underline"


# ZSH Autosuggestions
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'


# --- SOURCE STYLING FOR ZSH COMPLETIONS ---
source ~/.config/zsh/completion.zsh


# Command-not-found plugin
# https://github.com/Homebrew/homebrew-command-not-found#install
HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
  source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
fi


### Sourcing files
source $XDG_CONFIG_HOME/others/.aliases

if [ -f "$HOME/.custom_functions" ]; then
    source "$HOME/.custom_functions"
else
    echo "File $HOME/.custom_functions doesn't exists"
fi


# ---- CUSTOM KEYBINDS ----
# Load keybindings from separate file
if [ -f "$HOME/.config/zsh/custom-keybinds.zsh" ]; then
    source "$HOME/.config/zsh/custom-keybinds.zsh"
fi

# Man pages with bat
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# VSCode points to /opt/homebrew/ instead of /usr/local/bin
export PATH=/usr/local/bin:${PATH}


# Ruby for Jekyll
eval "$(rbenv init - zsh)"

# Chromaterm
ssh() { /usr/bin/ssh "$@" | ct; }
