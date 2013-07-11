#!/bin/bash
FILES="$@"
for i in $FILES
do
	j=`echo $i | cut -d . -f 1`
        echo "Processing $i ..."
        /usr/bin/convert -define jpeg:size=256x256 $i -thumbnail 64x64^ \
          -gravity center -extent 64x64 ${j}_square.png
done
