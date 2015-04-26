
die () {
  _echo red $@; exit 1
}

die_with () {
  local exitcode=$1
  shift
 _echo red $@; exit $exitcode
}

get_absolute_path () {
  local filename=$(basename "$1")
  local path=$(cd "$(dirname $1)"; pwd)
  echo "$path/$filename"
}
