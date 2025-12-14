# TARGET=~/.zshrc

# end-of-line Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---- FZF AUTO-COMPLETION ----
# Don;t move from here. It needs to be at the top
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

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh # This loads compinit

# ---- EXPORTS ----
source $XDG_CONFIG_HOME/zsh/exports.zsh


# ---- PLUGINS CONFIG ----

# ZSH Autosuggestions
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'

# Command-not-found plugin
# https://github.com/Homebrew/homebrew-command-not-found#install
HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
  source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
fi


# ---- SOURCING FILES ----

# ZSH Completions
if [ -f "$XDG_CONFIG_HOME/zsh/completion.zsh" ]; then
    source "$XDG_CONFIG_HOME/zsh/completion.zsh"
else
    echo "File $XDG_CONFIG_HOME/zsh/completion.zsh doesn't exist"
fi

# Custom Aliases
if [ -f "$XDG_CONFIG_HOME/zsh/custom_aliases.zsh" ]; then
    source "$XDG_CONFIG_HOME/zsh/custom_aliases.zsh"
else
    echo "File $XDG_CONFIG_HOME/zsh/custom_aliases.zsh doesn't exist"
fi

# Custom Functions
if [ -f "$XDG_CONFIG_HOME/zsh/custom_functions.zsh" ]; then
    source "$XDG_CONFIG_HOME/zsh/custom_functions.zsh"
else
    echo "File $XDG_CONFIG_HOME/zsh/custom_functions.zsh doesn't exists"
fi

# Sourcing Powerlevel 10K
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ---- CUSTOM_KEYBINDS ----

if [ -f "$XDG_CONFIG_HOME/zsh/custom_keybinds.zsh" ]; then
    source "$XDG_CONFIG_HOME/zsh/custom_keybinds.zsh"
else
    echo "File $XDG_CONFIG_HOME/zsh/custom_keybinds.zsh doesn't exists"
fi


# ---- OTHERS ----

# Ruby for Jekyll
eval "$(rbenv init - zsh)"

# History
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
