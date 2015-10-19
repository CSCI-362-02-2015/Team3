#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo -e "\n\n###################################"

# this while loop goes through every line of every 
# testCase file, compiles the selected files, it 
# provides the arguments and checks the result

while read line; do    
    var=$(echo "$line" | awk '{print $1;}')
    arg=$(echo "$line" | awk -F\" '{print $2}')
    case $var in
        module ) echo "MODULE" $arg ;;
        function ) echo "FUNCTION" $arg ;;
        it ) echo "IT" $arg ;;
        files ) 
            echo "FILES" $arg
            for word in $arg; do
                if [ ${word: -2} == ".c" ]
                    then files+=($word)
                fi
            done 
            for file in $files; do
                # filename without extension
                filename=(${file//./ })
                gcc -o "../temp/$filename" "../testCasesExecutables/$file"
            done
            echo -e "===> ${GREEN}All files compiled${NC}" ;;
        arguments ) 
            echo "ARGUMENTS" $arg
            for word in $arg; do
                if [ ${word: -2} == ".c" ]
                    then arguments+=($word)
                fi
            done ;;
        expected )
            echo "EXPECTED" $arg
            for word in $arg; do
                if [ ${word: -2} == ".c" ]
                    then expected+=($word)
                fi
            done ;;
    esac
done <../testCases/testCase1.txt

for

echo -e "###################################\n\n"