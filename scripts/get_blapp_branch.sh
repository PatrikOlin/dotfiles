#!/usr/bin/env bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

pushd /home/olin/code/bl/blapp-front
res=$(parse_git_branch)
popd
