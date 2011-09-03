#!/usr/bin/env bash
source "`dirname $0`/helpers.sh"

mkdir -p "$TEST_PATH/bundle/x/bin"

(
  echo "echo OK"
) > "$TEST_PATH/bundle/x/bin/snickersnack"

chmod +x "$TEST_PATH/bundle/x/bin/snickersnack"

test_init_shbundler

which snickersnack >/dev/null

assert [ "$?" == "0" ]
assert [ "`snickersnack`" == "OK" ]

test_teardown
