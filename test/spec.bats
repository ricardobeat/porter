#!/usr/bin/env bats

source lib/package-reader.sh

teardown () {
  unset PACKAGE_NAME
  unset PACKAGE_VERSION
  unset PACKAGE_DESCRIPTION
  unset PACKAGE_KEYWORDS
  unset PACKAGE_ID
}

@test "prints help text when invoked without arguments" {
  run ./porter
  [[ "$status" -eq 0 ]]
  [[ "$output" =~ Usage ]]
}

@test "missing package name" {
  run porter install test/test-packages/missing-name.sh
  [ "$status" -eq 101 ]
}

@test "missing package version" {
  run porter install test/test-packages/missing-version.sh
  [ "$status" -eq 102 ]
}

@test "missing package description" {
  run porter install test/test-packages/missing-description.sh
  [ "$status" -eq 103 ]
}

@test "missing @install method" {
  run porter install test/test-packages/missing-install.sh
  [ "$status" -eq 104 ]
}

@test "reading metadata" {
  source test/test-packages/metadata.sh
  [ "$PACKAGE_NAME" = 'my-thing' ]
  [ "$PACKAGE_VERSION" = '0.0.1' ]
  [ "$PACKAGE_DESCRIPTION" = "thingmator with support for stuff" ]
  [ "$PACKAGE_KEYWORDS" = "thing stuff watch" ]
}

@test "hello world package install" {
  run porter install test/test-packages/hello-world.sh
  [ "$status" -eq 0 ]
  [ "$output" = "hello world!" ]
}

@test "package with an install error" {
  run porter install test/test-packages/install-error.sh
  [ "$status" -ne 0 ]
}
