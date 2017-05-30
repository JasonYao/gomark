#!/usr/bin/env bash

###
# Helper functions
##
function info () {
	printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

function success () {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

function warn () {
  printf "\r\033[2K  [\033[0;31mWARN\033[0m] %s\n" "$1"
}

# Some source used from the sample .pre-commit files by the golang team,
# at https://tip.golang.org/misc/git/pre-commit

# Testing: Exits with an error code if the tests fail
info "Pre-push: Running through all tests"
if go test ./...; then
    success "Pre-push: All tests have passed!"
else
    warn "Pre-push: Some tests failed, or have not been updated. To override this (please don't do this), use \"git push --no-verify\""
    exit 1
fi