#!/usr/bin/env bash
source "`dirname $0`/helpers.sh"

(
  echo "echo OK"
) > "$TEST_PATH/bin/baarquux"

chmod +x "$TEST_PATH/bin/baarquux"

test_init_shbundler

which baarquux >/dev/null

assert [ "$?" == "0" ]
assert [ "`baarquux`" == "OK" ]

test_teardown
