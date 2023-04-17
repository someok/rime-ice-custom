#!/usr/bin/env bash


usage() {
cat <<EOF
Usage: ./update.sh [-h] -p param_value

Update plum, rime-ice or someok.

Available options:

-p, --param     plum, ice, custom
-v, --verbose   Output detailed information
-h, --help      Print this help and exit

EOF
    exit
}

setup_colors() {
    if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
        NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
    else
        NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
    fi
}

msg() {
    echo >&2 -e ">> ${1-}"
}


parse_params() {
    param=''
    verbose=false

    while :; do
        case "${1-}" in
        -h | --help) usage ;;
        -v | --verbose)
            # set -x
            verbose=true
            ;;
        --no-color) NO_COLOR=1 ;;
        -p | --param) # example named parameter
            param="${2-}"
            shift
            ;;
        -?*) echo "Unknown option: $1" ;;
        *) break ;;
        esac
        shift
    done

    # check required params and arguments
    [[ -z "${param-}" ]] && msg "${RED}Missing required parameter: -p or --param${NOFORMAT}" && exit
    [[ "${param}" != "plum" && "${param}" != "ice" && "${param}" != "custom" ]] && msg "${RED}param MUST be plum, ice or custom${NOFORMAT}" && exit

    return 0
}

setup_colors
parse_params "$@"


SHELL_DIR=$(dirname $(readlink -f "$0"))

PLUM_DIR=$(dirname $SHELL_DIR)/plum

if [ -d $PLUM_DIR ]; then
    cd $PLUM_DIR
    msg "${CYAN}Current plum dir:${NOFORMAT} ${ORANGE}$(pwd)${NOFORMAT}"

    if [ "${param}" == "plum" ]; then
        msg "${YELLOW}Update plum itself${NOFORMAT}"
        bash rime-install plum
    elif [ "${param}" == "ice" ]; then
        msg "${YELLOW}Update rime-ice${NOFORMAT}"
        bash rime-install iDvel/rime-ice:others/recipes/full
    elif [ "${param}" == "custom" ]; then
        msg "${YELLOW}Update rime-ice someok custom config${NOFORMAT}"
        bash rime-install someok/rime-ice-custom
    fi

    msg "${YELLOW}Reload RIME${NOFORMAT}"
    "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel" --reload
else
    msg "${RED}plum dir not exist${NOFORMAT}"
fi
