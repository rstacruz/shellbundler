# Variable: $SHBUNDLER_HOME
# Your ~/.bash folder.

[ -z "$SHBUNDLER_HOME" ] && SHBUNDLER_HOME="$HOME/.bash"
# Variable: $SHBUNDLER_ROOT
# The root of the ShellBundler runtime.
SHBUNDLER_ROOT=$BUNDLE_ROOT
[ -z "$SHBUNDLER_ROOT" ] && SHBUNDLER_ROOT="$SHBUNDLER_HOME/bundle/shellbundler"

# Load stuff
source $SHBUNDLER_ROOT/lib/helpers.sh
source $SHBUNDLER_ROOT/lib/functions.sh

# Set variables
RUNTIME_PATH=
SHBUNDLER_LOADED=:
OSENV="`shbundler_osdetect`"
[ -e "$SHBUNDLER_HOME/.debug" ] && DEBUG=1

# Let's get it started!
shbundler_rc $SHBUNDLER_HOME
