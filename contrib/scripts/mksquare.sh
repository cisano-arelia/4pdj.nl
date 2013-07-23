#!/bin/bash
FILES="$@"
for i in $FILES
do
	j=`echo $i | cut -d . -f 1`
        echo "Processing $i ..."
        /usr/bin/convert $i -set option:size '%[fx:min(w,h)]x%[fx:min(w,h)]' \
          xc:none +swap -gravity center -composite ${j}_squarebig.png
done
