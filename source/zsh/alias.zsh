#!/usr/bin/env zsh

##  :::'###::::'##:::::::'####::::'###:::::'######::
##  ::'## ##::: ##:::::::. ##::::'## ##:::'##... ##:
##  :'##:. ##:: ##:::::::: ##:::'##:. ##:: ##:::..::
##  '##:::. ##: ##:::::::: ##::'##:::. ##:. ######::
##   #########: ##:::::::: ##:: #########::..... ##:
##   ##.... ##: ##:::::::: ##:: ##.... ##:'##::: ##:
##   ##:::: ##: ########:'####: ##:::: ##:. ######::
##  ..:::::..::........::....::..:::::..:::......:::
##  ###############################################

alias lc='colorls -lA --sd --dark'

alias ls='eza'

alias eza='eza -laFh --git'

alias trail='<<<${(F)path}'

alias ftrail='<<<${(F)fpath}'

alias rm=trash

alias man=batman

alias bbd="brew bundle dump --force --describe"

alias lh='fc -RI; echo "loaded and showing..."; history;'

alias twm_on='yabai --start-service'

alias twm_off='yabai --stop-service'

alias kl_on='skhd --start-service'

alias kl_off='skhd --stop-service'
