#!/bin/bash

FILES="./wrong_tests_files/*"

rm -rf ./wrong_tests_files/*.cor
rm -rf results_wrong_tests.txt

for f in $FILES ; do
	name=$(echo $f | cut -f 3 -d "/")
	printf "%s :\n" $name >> results_wrong_tests.txt
	printf "%-20s\t\t" $name
	../asm/asm $f >>results_wrong_tests.txt 2>&1
	if (( $? == 0 )) ; then
		printf '❌\n'
	else
		printf '✅\n'
	fi
	printf "\n" >> results_wrong_tests.txt
done

rm -rf ./wrong_tests_files/*.cor

printf "\nSee the file results_wrong_tests.txt for stdout and stderr outputs\n"
