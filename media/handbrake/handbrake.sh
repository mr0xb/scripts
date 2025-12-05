#/bin/bash

file="$1"
if [ -f "$file" ];
then

	output="${file##*/}"
	/usr/bin/HandBrakeCLI \
		--preset-import-gui preset.json \
		-map-metadata 0 -E mp3 -B 128 -b 1600 -e x265 \
		-x vbv-maxrate=1600 -x vbv-bufsize=2200 \
		-X 1920 -Y 1080 \
		--audio-lang-list "eng" \
		--subtitle-lang-list "eng" \
		--all-subtitles \
		-i "${file}" \
		-o "${output%.*}.mkv"	
	if [ $? -eq 0 ]
	then
		echo "would have moved $file to $file.old" >> log.txt
		echo "would have moved $output to $file" >> log.txt
	else
		echo "error with $file" >> error.txt
	fi
else
	echo "$file not found!" >> error.log
fi
