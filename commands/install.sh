
do_install () {
  local PACKAGE_NAME="$1"
  local PACKAGE_PATH=$(get_package_path $PACKAGE_NAME)

  # Source package formula to fetch metadata and install method
  source $LIB/package-reader.sh
  source "$PACKAGE_PATH"
  validate_package

  # Load package helpers and run install() as defined by the package
  source $LIB/package-methods.sh
  cd "$(dirname $PACKAGE_PATH)" && @install
}
