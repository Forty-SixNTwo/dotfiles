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

export DOTFILES=$HOME/.dotfiles

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

export COLORLS=$(dirname $(gem which colorls))/tab_complete.sh

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/sqlite/lib"

export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/sqlite/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:/usr/local/opt/bzip2/lib/pkgconfig:/usr/local/opt/sqlite/lib/pkgconfig"

export PNPM_HOME="/Users/fortysix-ntwo/Library/pnpm"

export CODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PYTHON_HOME="/Users/fortysix-ntwo/Library/Python/3.9/bin"

export PATH_HOME="/usr/local/sbin:$PATH"

export PKL_HOME="/usr/local/bin/pkl"
