#!/usr/bin/env bash


#Read All of files in current Directory
files=$(eval ls -AF) 


for file in $files;do

#	ignore this file {app.sh}

	if [ "${file}" == "${0##*/}" ];then
		continue
	fi
	
#	check if that is a file {not a directory or file with no Extension}
#	then grep suffix and upper and add {_FILES} to it!

	if [[  "$file" =~ .*[\.].*[^/]$ ]];then	
		suffix="$(echo ${file} |grep -Pow '[\w\.]*[\.]{1}\K[\w]*' \
			|tr [:lower:] [:upper:])""_FILES"
	fi
	

	if [[ "$file" =~ .*[\.].*[^/]$ ]];then

		if [ -d "$suffix" ];then
			mv $file "$suffix"
		else
			mkdir "$suffix"
			mv $file "$suffix"
		fi
	fi
	
done