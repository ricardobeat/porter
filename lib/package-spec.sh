#
# Definition must be given in this order
#

PACKAGE_NAME=
PACKAGE_VERSION=
PACKAGE_ID=
PACKAGE_DESCRIPTION=
PACKAGE_KEYWORDS=

name () {
  PACKAGE_NAME="$1"
}

version () {
  [[ $PACKAGE_NAME ]] || die "Missing package name."
  PACKAGE_VERSION="$1"
  PACKAGE_ID="$PACKAGE_NAME-$PACKAGE_VERSION"
}

describe () {
  [[ $PACKAGE_VERSION ]] || die "Missing package version."
  PACKAGE_DESCRIPTION="$@"
}

keywords () {
  PACKAGE_KEYWORDS="${@//,/ }" # turn all commas into spaces
}

# @path () {
#   [[ $PACKAGE_NAME ]] || die "Missing package name."
#   PACKAGE_URL="$1"
# }

# @sha1 () {
#   [[ $PACKAGE_URL ]] || die "Missing path URL."
#   PACKAGE_SHA1="$1"
#   data_end
# }

download_and_unpack () {
  local DEST="$PORTER_DIR/$PACKAGE_ID"
  local CACHE_DEST="$PORTER_CACHE_DIR/$PACKAGE_ID.tar.gz"
  curl -o "$CACHE_DEST" "$PACKAGE_URL"
  mkdir "$DEST"
  tar -C "$DEST" xzf "$CACHE_DEST"
}

install: () {
  [[ $PACKAGE_SHA1 ]] || die "Missing SHA1."
  download_and_unpack
}
