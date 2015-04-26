
die () {
  _echo red $@; exit 1
}

die_with () {
  local exitcode=$1
  shift
 _echo red $@; exit $exitcode
}
