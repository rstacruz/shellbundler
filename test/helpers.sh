
test_setup() {
  TEST_RESULT=0
  TEST_PATH="/tmp/shellbundler.$$"

  SHBUNDLER_CACHE_PATH="/tmp/shellbundler.$$.cache"

  mkdir -p "$TEST_PATH"
  mkdir -p "$TEST_PATH/bundle"
  mkdir -p "$TEST_PATH/autoload"
  mkdir -p "$TEST_PATH/bin"
  ln -s "$SHBUNDLER_ROOT" "$TEST_PATH/bundle/shellbundler"

  source $SHBUNDLER_ROOT/lib/helpers.sh
}

test_teardown() {
  rm -rf $TEST_PATH

  if [ "$TEST_RESULT" != "0" ]; then
    exit 1
  fi
}

test_init_shbundler() {
  SHBUNDLER_HOME="$TEST_PATH"
  SHBUNDLER_ROOT="$TEST_PATH/bundle/shellbundler"
  source "$SHBUNDLER_ROOT/init.sh"
}

assert() {
  `$*`
  if [ $? != 0 ]; then
    TEST_RESULT=1
    err  "Failed assertion for $0:"
    err_ "assert $*"
  fi
}

test_setup
