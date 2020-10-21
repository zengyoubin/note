#!/bin/sh

echo 'auto sync start'
for line in `cat ./sync_dir.env`
do
	echo $line | cd 
    echo `pwd`
	

	git pull

	git add -A

	nothingStr=`git commit -m 'auto sync' | grep 'nothing to commit'`

	if [[ ! -z "$nothingStr" ]]; then
		echo $nothingStr
		continue
	fi

	git push
done
echo 'auto sync end'

