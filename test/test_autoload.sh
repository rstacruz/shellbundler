#!/usr/bin/env bash
source "`dirname $0`/helpers.sh"

(
  echo "TEST_HELLO=1"
) > "$TEST_PATH/autoload/hi.sh"

test_init_shbundler

assert [ $TEST_HELLO == 1 ]

test_teardown
