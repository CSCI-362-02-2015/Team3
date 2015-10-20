#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function executeTestCase() {
# it goes through every line of a test case, get the executable, the parameters,
# runs it, and compares the result with the expected outcome
    while read line; do
        var=$(echo "$line" | awk '{print $1;}')
        arg=$(echo "$line" | awk -F\" '{print $2}')
        case $var in
            module ) echo "MODULE" $arg ;;
            function ) echo "FUNCTION" $arg ;;
            it ) echo "IT" $arg ;;
            driver )
                echo "DRIVER" $arg ;;
                # for word in $arg; do
                #     if [ ${word: -2} == ".c" ]
                #         then files+=($word)
                #     fi
                # done
                # for file in $files; do
                #     # filename without extension
                #     filename=(${file//./ })
                #     gcc -o "../temp/$filename" "../testCasesExecutables/$file"
                # done
                # echo -e "===> ${GREEN}All files compiled${NC}" ;;
            arguments )
                echo "ARGUMENTS" $arg
                for word in $arg; do
                    if [ ${word: -2} == ".c" ]
                        then arguments+=($word)
                    fi
                done ;;
            expected )
                echo "EXPECTED" $arg ;;
        esac
    done <"$1" #file named passed as argument
    echo -e "###################################\n"
}

ROOT="$(dirname `pwd`)" #get project top-level folder full path
echo $ROOT
testCasesFiles=("$ROOT/testCases/"*.txt) #get test cases files

cp "$ROOT/testCasesExecutables/"*.c "$ROOT/project/git" #copy drivers to git repository

cd "$ROOT/project/git"
echo "Compiling files.. (it will take around 2 minutes if it is your first compilation)"
make &> /dev/null #redirect the output to not spam the terminal
echo -e "Finished.\n"

echo -e "Number of test cases: ${#testCasesFiles[@]} \n"

for testCaseFile in "${testCasesFiles[@]}"; do #iterate over the test cases
    executeTestCase "$testCaseFile"
done
