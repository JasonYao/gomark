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

function sub_warn () {
  printf "\r\033[2K  [\033[0;31mWARN\033[0m] \t%s\n" "$1"
}

function stash_pop () {
	# Puts back the stuff that wasn't committed
	info "Git stashing: Putting back temporarily stashed files"
	git stash pop -q
}

function stash_push () {
    info "Git stashing: Stashing non-committed files temporarily"
    if git stash -q --keep-index ; then
        success "Git stashing: All non-committed files have been temporarily stashed"
    else
        warn "Git stashing: An error occurred trying to stash non-relevant files, please check for any merge conflicts"
        exit 1
    fi
}

# Some source used from the sample .pre-commit files by the golang team,
# at https://tip.golang.org/misc/git/pre-commit

# Makes sure that the script doesn't run on stuff outside of the committed repo
stash_push

# Sanity check: Exits cleanly if there isn't any gofiles to deal with
go_files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.go$')
info "Pre-commit: Checking for golang source existence"
if [ -z "$go_files" ]; then
    success "Pre-commit: No golang source files found requiring formatting"
    stash_pop
    exit 0
else
    info "Pre-commit: Golang source files found, checking for formatting"
fi

# Formatting: Exits with an error code if gofmt finds differences in the source files
unformatted=$(gofmt -l $go_files)
info "Pre-commit: Checking golang source formatting"
if [ -z "$unformatted" ]; then
    success "Pre-commit: All golang source files are correctly formatted"
    stash_pop
else
    warn "Pre-commit: Some golang source files need formatting, please run:"
    for unformatted_file in $unformatted; do
        sub_warn "gofmt -w $PWD/$unformatted_file"
    done
    stash_pop
    exit 1
fi
