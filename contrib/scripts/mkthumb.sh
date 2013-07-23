#!/bin/bash
FILES="$@"
for i in $FILES
do
	j=`echo $i | cut -d . -f 1`
	s=`identify -format "%[fx:w]" $i`
        if (( $(echo "$s > 401" | bc -l ) ))
        then
          echo "Processing $i with size $s ..."
          /usr/bin/convert -thumbnail 800 $i ${j}_thumb.png
        else
          echo "Skipping $i with size $s ."
        fi
done
