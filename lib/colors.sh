#
# https://github.com/ricardobeat/colors.sh
# ricardo.mit-license.org
#

function _echo () {
  local color
  local style
  local escape
  local nobreak

  local NO_COLOR=${NO_COLOR:-0}

  if [[ $1 == "-n" ]]; then
    nobreak="n"; shift
  fi

  case $1 in
    red    ) color=31 ;;
    green  ) color=32 ;;
    yellow ) color=33 ;;
    blue   ) color=34 ;;
    purple ) color=35 ;;
    cyan   ) color=36 ;;
    white  ) color=37 ;;
    gray   ) color=90 ;;
  esac
  [[ ! -z "$color" ]] && shift

  case $1 in
    bold      ) style=01; ;;
    blink     ) style=05; ;;
    reverse   ) style=07; ;;
    underline ) style=04; ;;
  esac
  [[ ! -z "$style" ]] && shift

  if [[ $NO_COLOR == 1 ]]; then
    echo -e$nobreak "$@"
    return
  fi
  
  escape="\x1b["
  echo -e$nobreak $escape"$color;${style:-02}m$@${escape}0m"
}