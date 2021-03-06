
.PHONY: test

ifeq ($(OS),Windows_NT)
    UNAME := Win32
else
    UNAME := $(shell uname -s)
endif

install-lib:
ifeq ($(UNAME),Darwin)
	@brew install gnu-getopt lcov
endif

install-dev:
	@curl -sLO https://git.io/lcov.sh
	@curl -sLO https://git.io/pipetest.sh

install: install-lib install-dev

test:
	@bash lcov.sh test/*.test.sh -x lcov.sh

permissions:
	chmod +x tarjam.sh

tdd: permissions
	bats test/tarjam.bats
