#!/bin/bash

FILES=$(find . -name "*.s" -type f)
COR_FILES=$(find . -name "*.cor" -type f)

rm -rf $COR_FILES &> /dev/null
rm test* &> /dev/null

for f in $FILES ;
do
	path=$(echo $f | sed 's/\.\/comparison_tests_files\///')
	name_cor=$(echo $f | rev | sed 's/s\./roc\./' | rev)
	printf "%-50s : " $path
	./42_asm $f &>/dev/null
	[[ -f $name_cor ]]
	ret_42_asm=$?
#printf "ret_42_asm = %d " $ret_42_asm
	if (( ret_42_asm == 0 )); then
		hexdump -C $name_cor > test1
	fi
	rm $name_cor &>/dev/null
	../asm/asm $f &>/dev/null
	[[ -f $name_cor ]]
	ret_my_asm=$?
#printf "ret_my_asm = %d " $ret_my_asm
	if (( ret_my_asm == 0 )) ; then
		hexdump -C $name_cor > test2
	fi
	rm $name_cor &>/dev/null
	if (( ret_42_asm != ret_my_asm )) ; then
		printf "%-20s ❌\n" "parsing difference"
	else
		if (( ret_42_asm == 1 )) ; then
			printf "%-20s ✅\n" "wrong .s file"
		else
			diff_ret=$(diff test1 test2 &> /dev/null)
			if (( diff_ret == 0 )) ; then
				printf "%-20s ✅\n" "diff .cor OK"
			else
				printf "%-20s ❌\n" "diff .cor KO"
			fi
		fi
	fi
done

COR_FILES=$(find . -name "*.cor" -type f)
rm -rf $COR_FILES &> /dev/null

rm test* &>/dev/null
