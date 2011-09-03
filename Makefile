.PHONY: test

test:
	@for i in ./test/test_*.sh; do \
	  SHBUNDLER_ROOT="`pwd -LP`" sh $$i; \
	  SHBUNDLER_ROOT="`pwd -LP`" bash $$i; \
	done
	@echo "\033[0;32mOkay! All tests pass.\033[0;m"

