#!/usr/bin/env zsh

##  '##::::'##::::'###::::'########::'####::::'###::::'########::'##:::::::'########:
##   ##:::: ##:::'## ##::: ##.... ##:. ##::::'## ##::: ##.... ##: ##::::::: ##.....::
##   ##:::: ##::'##:. ##:: ##:::: ##:: ##:::'##:. ##:: ##:::: ##: ##::::::: ##:::::::
##   ##:::: ##:'##:::. ##: ########::: ##::'##:::. ##: ########:: ##::::::: ######:::
##  . ##:: ##:: #########: ##.. ##:::: ##:: #########: ##.... ##: ##::::::: ##...::::
##  :. ## ##::: ##.... ##: ##::. ##::: ##:: ##.... ##: ##:::: ##: ##::::::: ##:::::::
##  ::. ###:::: ##:::: ##: ##:::. ##:'####: ##:::: ##: ########:: ########: ########:
##  :::...:::::..:::::..::..:::::..::....::..:::::..::........:::........::........::
##  #################################################################################

export ALIAS_ZSH=$DOTFILES/source/zsh/alias.zsh
export PATH_ZSH=$DOTFILES/source/zsh/path.zsh
export FUNCTION_ZSH=$DOTFILES/source/zsh/function.zsh

export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

export HOMEBREW_NO_ENV_HINTS=true

export NULLCMD=bat

export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=4000

export ZSH=$HOME/.oh-my-zsh
export ZSH_SH=$ZSH/oh-my-zsh.sh
export ZSH_SYNTAX_HIGHLIGHTING=$HOME/.themes/zsh-syntax-highlighting.sh

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .cache'

export RUST_CARGO=$HOME/.cargo/env

export COLORLS=$(dirname $(gem which colorls))/tab_complete.sh
