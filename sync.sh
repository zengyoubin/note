#!/bin/sh


cd $1

echo `pwd`
echo 'auto sync start'

git add -A
nothingStr=`git commit -m 'auto sync' | grep 'nothing to commit'`

echo $nothingStr

if [[ ! -z "$nothingStr" ]]; then
	echo $nothingStr
	exit 0 
fi

echo '1111'