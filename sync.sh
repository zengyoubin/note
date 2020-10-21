#!/bin/sh

echo 'auto sync start'
for line in `cat ./sync_dir.env`
do
    cd $line
    echo `pwd`
	

	git pull

	git add -A

	nothingStr=`git commit -m 'auto sync' | grep 'nothing to commit'`

	if [[ ! -z "$nothingStr" ]]; then
		echo $nothingStr
		exit 0 
	fi

	git push
done
echo 'auto sync end'

