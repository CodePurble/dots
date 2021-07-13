#!/bin/zsh
# Found here- https://www.pedaldrivenprogramming.com/2018/09/simple-virtualenv-auto-activation-zsh/
# Edited by- C. Ramprakash @CodePurble
#
# Auto activate a python virtualenv when entering the project directory.
# Installation:
#   source <name-of-script>
#
# Usage:
#   Function `venvconnect`:
#       Connect the currently activated virtualenv to the current directory.
#
# If creating a new environment, set it up like this-
#   First create the venv using python -m venv in VENV_HOME and activate it manually
#   Then cd into the project root directory and run venvconnect <env name>

VENV_HOME=$HOME/.virtualenvs

function _virtualenv_auto_activate() {
    if [[ -f ".venv" ]]; then
        _VENV_PATH=$VENV_HOME/$(cat .venv)

        # Check to see if already activated to avoid redundant activating
        if [[ "$VIRTUAL_ENV" != $_VENV_PATH ]]; then
            source $_VENV_PATH/bin/activate
        fi
    else
        if [[ $VIRTUAL_ENV ]]; then
            deactivate
        fi
    fi
}

function activateVenv() {
    echo Activating $1
    source $VENV_HOME/$1/bin/activate
    echo $(basename $VIRTUAL_ENV) > .venv
}

function venvconnect () {
    if [ $# -eq 1 ]; then
        if [[ -n $VIRTUAL_ENV ]]; then
            echo $(basename $VIRTUAL_ENV) > .venv
        else
            if [[ -d $VENV_HOME/$1 ]]; then
                activateVenv $1
            else
                echo No environment found in $VENV_HOME called $1
                while true; do
                    read "REPLY?Do you want to create one (yes/no)? "
                    case $REPLY in
                        [Yy]* )
                            if [[ ! -d $VENV_HOME ]]; then
                                mkdir -vp $VENV_HOME
                            fi
                            python -m venv $VENV_HOME/$1
                            activateVenv $1
                            return
                            ;;
                        [Nn]* )
                            return
                            ;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done
            fi
        fi
    else
        echo "Usage: venvconnect <env name>"
        echo
        echo "Setting up a NEW ENVIRONMENT:"
        echo
        echo "1. First create the venv using python3 -m venv <env name> in VENV_HOME"
        echo "   and activate it manually"
        echo
        echo "2. Then cd into the project root directory and run venvconnect <env name>"
    fi
}

chpwd_functions+=(_virtualenv_auto_activate)
precmd_functions=(_virtualenv_auto_activate $precmd_functions)
