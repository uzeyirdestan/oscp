#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
for username in $(ls /home)
do
	echo -e "${RED}Searching for username => $username"
	find / -type f -readable -not -path "/proc*" -not -path "/sys*" 2>/dev/null | while read files;
	do
		if grep -qia $username $files; then
			echo -e "${GREEN}File path => $files"
			echo -e "${NC}"
			grep -nai $username $files -C 1
		fi
	done
done

