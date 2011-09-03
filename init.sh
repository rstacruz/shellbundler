# Variable: $SHBUNDLER_HOME
# Your ~/.bash folder.
[ -z "$SHBUNDLER_HOME" ]        && SHBUNDLER_HOME="$HOME/.bash"

# Ensure it's available.
if [ ! -d "$SHBUNDLER_HOME" ]; then
  puts "The directory $SHBUNDLER_HOME does not exist."
  return 1
fi

# Variable: $SHBUNDLER_ROOT
# The root of the ShellBundler runtime.
[ -z "$SHBUNDLER_ROOT" ]        && SHBUNDLER_ROOT="$BUNDLE_ROOT"
[ -z "$SHBUNDLER_ROOT" ]        && SHBUNDLER_ROOT="$SHBUNDLER_HOME/bundle/shellbundler"

# Ensure it's available.
if [ ! -d "$SHBUNDLER_ROOT" ]; then
  puts  "Can't find the ShellBundler runtime files."
  puts  "Consider adding 'SHBUNDLER_ROOT=/path/to/shellbundler' in your profile file"
  puts  "Before loading ShellBundler."
  return 1
fi

[ -z "$SHBUNDLER_LOADED" ]      && SHBUNDLER_LOADED=":"
[ -z "$SHBUNDLER_CACHE_PATH" ]  && SHBUNDLER_CACHE_PATH="$HOME/.cache/shellbundler"
[ -e "$SHBUNDLER_HOME/.debug" ] && DEBUG=1

# Load stuff (these rely on $SHBUNDLER_ROOT.)
source "$SHBUNDLER_ROOT/lib/helpers.sh"
source "$SHBUNDLER_ROOT/lib/functions.sh"

# More variables (these rely on those functions.)
[ -z "$OSENV" ]                 && OSENV="`shbundler_osdetect`"

# Let's get it started!
shbundler_init $SHBUNDLER_HOME
