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
  PACKAGE_VERSION="$1"
  PACKAGE_ID="$PACKAGE_NAME-$PACKAGE_VERSION"
}

describe () {
  PACKAGE_DESCRIPTION="$@"
}

keywords () {
  PACKAGE_KEYWORDS=$(echo "$@" | sed -e 's/,/ /g' -e 's/  */ /g')
}

download_and_unpack () {
  local DEST="$PORTER_DIR/$PACKAGE_ID"
  local CACHE_DEST="$PORTER_CACHE_DIR/$PACKAGE_ID.tar.gz"
  curl -o "$CACHE_DEST" "$PACKAGE_URL"
  mkdir "$DEST"
  tar -C "$DEST" xzf "$CACHE_DEST"
}

validate_package () {
  if [ -z "$PACKAGE_NAME" ]; then die_with 101 "Missing package name"; fi
  if [ -z "$PACKAGE_VERSION" ]; then die_with 102 "Missing package version"; fi
  if [ -z "$PACKAGE_DESCRIPTION" ]; then die_with 103 "Missing package description"; fi
  # PACKAGE_KEYWORDS is optional
  if ! type @install &> /dev/null; then die_with 104 ":install method missing"; fi
  return 0
}
