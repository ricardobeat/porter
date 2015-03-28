
install_bin () {
  echo "Symlinking $1 into /usr/local/bin..."
}

requires_bin () {
  local BIN="$1"
  if type $1 &> /dev/null; then
    return 0
  else
    return 1
  fi
}

requires_brew () {
  requires_bin 'brew' || die 'Homebrew is not installed. See http://brew.sh'
  if ! brew list -1 | grep -q $1; then
    brew install $1
    if [[ $? != 0 ]]; then
      die "Failed to install homebrew formula for $1"
    fi
  fi
}
