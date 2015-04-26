
do_install () {
  source $LIB/package-reader.sh
  source $LIB/package-methods.sh
  # Execute package formula
  source $PACKAGE.sh
}
