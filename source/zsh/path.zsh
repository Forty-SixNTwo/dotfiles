#!/usr/bin/env zsh

## '########:::::'###::::'########:'##::::'##:
##  ##.... ##:::'## ##:::... ##..:: ##:::: ##:
##  ##:::: ##::'##:. ##::::: ##:::: ##:::: ##:
##  ########::'##:::. ##:::: ##:::: #########:
##  ##.....::: #########:::: ##:::: ##.... ##:
##  ##:::::::: ##.... ##:::: ##:::: ##:::: ##:
##  ##:::::::: ##:::: ##:::: ##:::: ##:::: ##:
## ..:::::::::..:::::..:::::..:::::..:::::..::
##  ##########################################

typeset -U path

path=(
  $path
  $PNPM_HOME
  $CODE_HOME
  $PYTHON_HOME
  $PATH_HOME
  $PKL_HOME
)
