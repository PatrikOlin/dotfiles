#!/bin/bash

echo "Enter commit message"
read message

cd $HOME/zettelkasten
git add .
git commit -m "${message}"
echo "Pushing to remote"
git push -u origin master
cd -
