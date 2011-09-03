# Helpers
status()     { echo -e "\033[0;34m==>\033[0;32m $*\033[0;m"; }
status_()    { echo -e "\033[0;32m    $*\033[0;m"; }
err()        { echo -e "\033[0;31m==> \033[0;33mERROR: \033[0;31m$*\033[0;m"; }
err_()       { echo -e "\033[0;31m    $*\033[0;m"; }
log()        { test -n "$DEBUG" && echo -e "\033[0;34m==>\033[0;$2m $1\033[0;m"; }

# Returns the current ShellBundler version to STDOUT.
shbundler_version() {
  cat $BUNDLE_ROOT/VERSION
}
