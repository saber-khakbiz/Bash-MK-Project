#!/bin/usr/env bash

files=$(eval ls -AF) 

for file in $files;do

	if [ "${file}" == "${0##*/}" ];then
		continue
	fi
	
	if [[  "$file" =~ .*[\.].* ]];then	
		suffix="$(echo ${file} |grep -Pow '[\w\.]*[\.]{1}\K[\w]*' \
			|tr [:lower:] [:upper:])""_FILE"
	fi
	
	if [[ "$file" =~ .*[\.].* ]];then
		if [ -d "$suffix" ];then
			mv $file "$suffix"
		else
	
			mkdir "$suffix"
			mv $file "$suffix"
		
		fi
	fi
	
done