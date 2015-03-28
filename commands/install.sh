
do_install () {
  source $LIB/package-spec.sh
  source $LIB/package-actions.sh
  # Execute package formula
  source $PACKAGE.sh
}
