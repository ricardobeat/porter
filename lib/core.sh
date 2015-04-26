
get_package_path () {
  local PACKAGE_NAME="$1"
  local PACKAGE_PATH="$PORTER_DIR/$PACKAGE_NAME.sh"
  # Accept absolute path to package file
  if [[ -f "$PACKAGE_NAME" ]]; then
    PACKAGE_PATH=$PACKAGE_NAME
  # Otherwise verify that package exists in $PORTER_DIR
  elif [[ ! -f "$PACKAGE_PATH" ]]; then
    die "Package $1 not found"
  fi
  echo $PACKAGE_PATH
}
