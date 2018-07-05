#!/bin/bash

commitid=$(cat ~/.todogist)

cd /tmp
git clone git@gist.github.com:$commitid.git
cd $commitid
gedit todo-gist -s
git add .
git commit -m "cmd"
git push
cd ..
rm -rf $commitid
