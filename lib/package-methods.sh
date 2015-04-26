
install_bin () {
  if [[ ! -d "$PORTER_BIN_DIR" ]]; then die "$PORTER_BIN_DIR/bin directory does not exist"; fi
  if [[ ! -f "$1" ]]; then die_with 201 "install_bin: file '$1' not found"; fi
  
  local source_path="$(get_absolute_path $1)"
  local dest_path="$PORTER_BIN_DIR/$(basename $1)"

  _echo cyan "Symlinking $1 into /usr/local/bin..."
  ln -s "$source_path" "$dest_path"
}

requires_bin () {
  local BIN="$1"
  if type $1 &> /dev/null; then
    _echo green "requires $1: ok"
    return 0
  else
    return 1
  fi
}

requires_brew () {
  # Check if homebrew is installed
  if ! type brew &> /dev/null; then
    die "Homebrew is not available in this system (http://brew.sh)"
  fi

  # Install formula (if not already installed)
  if ! brew list -1 | grep -q $1; then
    brew install $1
    if [[ $? != 0 ]]; then
      die "Failed to install homebrew formula for $1"
    fi
  fi

  _echo green "requires brew formula $1: ok"
  return 0
}

requires_yum () {
  die "not implemented"
}
