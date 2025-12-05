#/bin/bash

file=$1
if [ -f "$file" ]; then
	while read -r line;
	do
		echo "" | ./handbrake.sh "$line"
	done < "$file"
else
	echo "$file does not exist or is not a file!"
fi
