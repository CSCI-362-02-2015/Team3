#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
N_FAILS=0
function executeTestCase() {
# it goes through every line of a test case, get the executable, the parameters,
# runs it, and compares the result with the expected outcome
    ID=''
    MODULE=''
    FUNCTION=''
    REQUIREMENT=''
    DRIVER=''
    ARGUMENTS=''
    EXPECTED=''
    while read line; do
        var=$(echo "$line" | awk '{print $1;}')
        arg=$(echo "$line" | awk -F\" '{print $2}')
        case $var in
            id ) ID=$arg ;;
            module ) MODULE=$arg ;;
            function ) FUNCTION=$arg ;;
            requirement ) REQUIREMENT=$arg ;;
            driver ) DRIVER=$arg ;;
            arguments ) ARGUMENTS=$arg ;;
            expected ) EXPECTED=$arg ;;
        esac
    done <"$1" #file named passed as argument

    result=$(./$DRIVER $ARGUMENTS)
    if [ $result == $EXPECTED ]; then
        echo -e "$ID: $REQUIREMENT ==> ${GREEN}PASSED${NC}"
        echo "<font color='green'>P &nbsp;</font>" >> "$ROOT/temp/output.html"
    else
        N_FAILS=$((N_FAILS+1))
        echo -e "$ID: $REQUIREMENT ==> ${RED}FAIL${NC}"
        echo "<font color='red'>FAILED &nbsp;</font>" >> "$ROOT/temp/output.html"
        echo "<p><font color='red'>
                ID: $ID<br>
                MODULE: $MODULE<br>
                FUNCTION: $FUNCTION<br>
                REQUIREMENT: $REQUIREMENT<br>
                ARGUMENTS: $ARGUMENTS<br>
                EXPECTED: $EXPECTED<br>
                RESULT: $result<br><br>
             </font></p>" >> "$ROOT/temp/fails.txt"
    fi
}


ROOT=$(pwd) #get project top-level folder full path
rm "$ROOT/temp/"* #remove temp files
testCasesFiles=("$ROOT/testCases/"*.txt) #get test cases files

cp "$ROOT/testCasesExecutables/"*.c "$ROOT/project/git" #copy drivers to git repository

cd "$ROOT/project/git"
echo "Compiling files.. (it will take around 2 minutes if it is your first compilation)"
make &> /dev/null #redirect the output to not spam the terminal
echo -e "Finished.\n"

echo -e "Number of test cases: ${#testCasesFiles[@]} \n"


echo "<!doctype html><html><head><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
      <title>MyList Script</title></head><body><div class='container'><h1>Tests Result</h1><br>" >> "$ROOT/temp/output.html"
echo "<h3>Number of test cases: ${#testCasesFiles[@]}</h3>" >> "$ROOT/temp/output.html"

for testCaseFile in "${testCasesFiles[@]}"; do #iterate over the test cases
    executeTestCase "$testCaseFile"
done

if [ $N_FAILS -gt 0 ]; then
   echo "<br><br>" >> "$ROOT/temp/output.html"
   echo "<h4>$N_FAILS test(s) failed.</h4><br>" >> "$ROOT/temp/output.html"
   cat "$ROOT/temp/fails.txt" >> "$ROOT/temp/output.html"
fi

echo "</div></body></html>" >> "$ROOT/temp/output.html"

# firefox "$ROOT/temp/output.html" &> /dev/null
