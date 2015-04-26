#!/usr/bin/env bats

source lib/package-reader.sh

@test "prints help text when invoked without arguments" {
  run ./porter
  [[ "$status" -eq 0 ]]
  [[ "$output" =~ Usage ]]
}

@test "reading metadata" {
  source test/package.sh
  [ "$PACKAGE_NAME" = 'my-thing' ]
  [ "$PACKAGE_VERSION" = '0.0.1' ]
  [ "$PACKAGE_DESCRIPTION" = "thingmator with support for stuff" ]
  [ "$PACKAGE_KEYWORDS" = "thing stuff watch" ]
}
