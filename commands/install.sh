
do_install () {
  local PACKAGE_NAME="$1"
  local PACKAGE_PATH="$PORTER_DIR/$PACKAGE_NAME.sh"

  # Accept absolute path to package file
  if [[ -f "$PACKAGE_NAME" ]]; then
    PACKAGE_PATH=$PACKAGE_NAME
  # Otherwise verify that package exists in $PORTER_DIR
  elif [[ ! -f "$PACKAGE_PATH" ]]; then
    die "Package $1 not found"
  fi

  # Source package formula to fetch metadata and install method
  source $LIB/package-reader.sh
  source "$PACKAGE_PATH"
  validate_package

  # Load package helpers and run install() as defined by the package
  source $LIB/package-methods.sh
  cd "$(dirname $PACKAGE_PATH)" && @install
}
