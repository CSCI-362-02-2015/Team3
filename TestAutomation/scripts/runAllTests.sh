#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

function executeTestCase() {
# it goes through every line of a test case, get the executable, the parameters,
# runs it, and compares the result with the expected outcome
    ID=''
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
            id ) ID=$arg ;;
            module ) MODULE=$arg ;;
            function ) FUNCTION=$arg ;;
            it ) IT=$arg ;;
            driver ) DRIVER=$arg ;;
            arguments ) ARGUMENTS=$arg ;;
            expected ) EXPECTED=$arg ;;
        esac
    done <"$1" #file named passed as argument

    result=$(./$DRIVER $ARGUMENTS)
    if [ $result == $EXPECTED ]; then
        pass_fail="PASSED"
        color="green"
        class="success"
        echo -e "$IT ==> ${GREEN}PASSED${NC}"
    else
        pass_fail="FAILED"
        color="red"
        class="danger"
        echo -e "$IT ==> ${RED}FAIL${NC}"
    fi
    echo $MODULE
    echo "<tbody><tr class='active'><th scope='row'>ID</th><td>$ID</td></tr>
        <tr><th scope='row'>MODULE</th><td>$MODULE</td></tr>
        <tr><th scope='row'>FUNCTION</th><td>$FUNCTION</td></tr>
        <tr><th scope='row'>IT</th><td>$IT</td></tr>
        <tr><th scope='row'>ARGUMENTS</th><td>$ARGUMENTS</td></tr>
        <tr><th scope='row'>EXPECTED</th><td>$EXPECTED</td></tr>
        <tr><th scope='row'>RESULT</th><td>$result</td></tr>
        <tr class='$class'><th scope='row'>OUTPUT</th><td><b style='color:$color;'>$pass_fail</b></td></tr>
      </tbody>" >> "$ROOT/temp/output.html"
}


ROOT=$(pwd) #get project top-level folder full path
testCasesFiles=("$ROOT/testCases/"*.txt) #get test cases files

cp "$ROOT/testCasesExecutables/"*.c "$ROOT/project/git" #copy drivers to git repository

cd "$ROOT/project/git"
echo "Compiling files.. (it will take around 2 minutes if it is your first compilation)"
make &> /dev/null #redirect the output to not spam the terminal
echo -e "Finished.\n"

echo -e "Number of test cases: ${#testCasesFiles[@]} \n"

rm "$ROOT/temp/output.html"

echo "<!doctype html><html><head><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
      <title>MyList Script</title></head><body><div class='container'><h3>Tests Result</h3><br>" >> "$ROOT/temp/output.html"

for testCaseFile in "${testCasesFiles[@]}"; do #iterate over the test cases
    echo "<div class='row' style='border: 1px solid #E1E1E8; border-radius:4px;'><table style='margin-bottom:0;' class='table'>" >> "$ROOT/temp/output.html"
    executeTestCase "$testCaseFile"
    echo "</table></div><br>" >> "$ROOT/temp/output.html"
done
echo "</div></body></html>" >> "$ROOT/temp/output.html"

firefox "$ROOT/temp/output.html" &> /dev/null
