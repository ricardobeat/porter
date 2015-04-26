
PORTER_DIR="$HOME/.porter"
PORTER_BIN_DIR="$HOME/bin"
PORTER_CACHE_DIR="$HOME/.porter/.cache"

mkdir -p "$PORTER_DIR"
mkdir -p "$PORTER_CACHE_DIR"

touch "$PORTER_DIR/porter.conf"

# 
if [ ! -t 0 -o ! -t 1 ]; then
  NO_COLOR="1"
fi
