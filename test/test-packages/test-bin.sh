
name 'test-bin'
version '0.0.0'

describe 'test bin'

install:bin '../bin/porter-test-bin1'

@install () {
  bin '../bin/porter-test-bin1'
}
