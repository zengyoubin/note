#!/bin/sh

cd $1

echo `pwd`
echo 'auto sync start'

git pull

git add -A

nothingStr=`git commit -m 'auto sync' | grep 'nothing to commit'`

if [[ ! -z "$nothingStr" ]]; then
	echo $nothingStr
	exit 0 
fi

git push

echo 'auto sync end'