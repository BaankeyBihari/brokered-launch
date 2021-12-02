#!/usr/bin/env bash

# bash-yaml is released under MIT License
# LICENSE https://github.com/jasperes/bash-yaml/blob/master/LICENSE
source <(curl -s https://raw.githubusercontent.com/jasperes/bash-yaml/master/script/yaml.sh)

# Locate (and create if not present) brokeredLauncher.yml
# locations:
# - ~/.brokeredLauncher.yml
# - scripts current directory
# if not found in HOME folder, it will create one there
# if not found in both locations, then it will exit with error
CONFIG=~/.brokeredLauncher.yml
if [ -f ${CONFIG} ]; then
    CONFIGD=$(dirname $0)/brokeredLauncher.yml
    if [ -f "${CONFIGD}" ]; then
        cp ${CONFIGD} ${CONFIG}
    else
        echo "Could not locate ${CONFIG} or ${CONFIGD}"
        exit 1
    fi
fi

parse_yaml ${CONFIGD} && echo
create_variables ${CONFIGD}
