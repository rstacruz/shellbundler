#!/usr/bin/env bash
source "`dirname $0`/helpers.sh"

mkdir -p "$TEST_PATH/bundle/x/autoload"

(
  echo "TEST_HELLO=1"
) > "$TEST_PATH/bundle/x/autoload/hi.sh"

test_init_shbundler

assert [ $TEST_HELLO == 1 ]

test_teardown
