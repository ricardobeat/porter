
name 'my-thing'
version '0.0.1'

describe 'thingmator with support for stuff'
keywords 'thing, stuff, watch'

install () {
  requires_bin 'fswatch' || requires_brew 'fswatch'
  install_bin 'bin/thing'
}
