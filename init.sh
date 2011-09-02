# Variable: $SHBUNDLER_ROOT
# The root of the ShellBundler runtime.
SHBUNDLER_ROOT=$BUNDLE_ROOT
[ -z "$SHBUNDLER_ROOT" ] && SHBUNDLER_ROOT="$HOME/.bash/bundle/shellbundler"

# Load stuff
source $SHBUNDLER_ROOT/lib/helpers.sh
source $SHBUNDLER_ROOT/lib/functions.sh

# Set variables
RUNTIME_PATH=
SHBUNDLER_LOADED=:
OSENV="`shbundler_osdetect`"
[ -e "$HOME/.shbundler_debug" ] && DEBUG=1

# Let's get it started!
shbundler_rc $SHELLBUNDLER_HOME
