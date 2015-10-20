#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

function executeTestCase() {
# it goes through every line of a test case, get the executable, the parameters,
# runs it, and compares the result with the expected outcome
    MODULE=''
    FUNCTION=''
    IT=''
    DRIVER=''
    ARGUMENTS=''
    EXPECTED=''
    while read line; do
        var=$(echo "$line" | awk '{print $1;}')
        arg=$(echo "$line" | awk -F\" '{print $2}')
        case $var in
            module ) MODULE=$arg ;;
            function ) FUNCTION=$arg ;;
            it ) IT=$arg ;;
            driver ) DRIVER=$arg ;;
            arguments ) ARGUMENTS=$arg ;;
            expected ) EXPECTED=$arg ;;
        esac
    done <"$1" #file named passed as argument

    result=$(./$DRIVER $ARGUMENTS)
    echo "MODULE $MODULE" >> "$ROOT/temp/output.txt"
    echo "FUNCTION $FUNCTION" >> "$ROOT/temp/output.txt"
    echo "IT $IT" >> "$ROOT/temp/output.txt"
    if [ $result == $EXPECTED ]; then
        echo "passed" >> "$ROOT/temp/output.txt"
        echo -e "$IT ==> ${GREEN}PASSED${NC}"
    else
        echo "failed" >> "$ROOT/temp/output.txt"
        echo -e "\tEXPECTED $EXPECTED" >> "$ROOT/temp/output.txt"
        echo -e "\tOUTPUT $result" >> "$ROOT/temp/output.txt"
        echo -e "$IT ==> ${RED}FAIL${NC}"
    fi
    echo -e "###################################\n" >> "$ROOT/temp/output.txt"
}


ROOT=$(pwd) #get project top-level folder full path
testCasesFiles=("$ROOT/testCases/"*.txt) #get test cases files

cp "$ROOT/testCasesExecutables/"*.c "$ROOT/project/git" #copy drivers to git repository

cd "$ROOT/project/git"
echo "Compiling files.. (it will take around 2 minutes if it is your first compilation)"
make &> /dev/null #redirect the output to not spam the terminal
echo -e "Finished.\n"

echo -e "Number of test cases: ${testCasesFiles[@]} \n"

rm "$ROOT/temp/output.txt"

for testCaseFile in "${testCasesFiles[@]}"; do #iterate over the test cases
    executeTestCase "$testCaseFile"
done
echo
firefox "$ROOT/temp/output.txt" &> /dev/null
