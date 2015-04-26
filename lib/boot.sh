
PORTER_DIR="${PORTER_DIR:-HOME/.porter}"
PORTER_BIN_DIR="${PORTER_BIN_DIR:-HOME/bin}"

PORTER_CACHE_DIR="$PORTER_DIR/.cache"

mkdir -p "$PORTER_DIR"
mkdir -p "$PORTER_CACHE_DIR"

touch "$PORTER_DIR/porter.conf"

# Disable colors if not a terminal
if [ ! -t 0 -o ! -t 1 ]; then NO_COLOR="1"; fi
