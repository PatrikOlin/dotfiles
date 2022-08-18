#!/bin/bash
config="/usr/bin/git --git-dir=/home/olin/.cfg --work-tree=/home/olin"

echo "Enter commit message"
read message

cd $HOME
$config add -u
$config commit -m "${message}"
echo "Pushing to remote master"
$config push -u origin master
cd -
