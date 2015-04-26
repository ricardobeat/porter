
do_install () {
  source $LIB/package-reader.sh
  
  # Source package formula to fetch metadata and install method
  source $PACKAGE.sh

  # Load package helpers
  source $LIB/package-methods.sh

  # Run install() as defined by the package
  install
}
