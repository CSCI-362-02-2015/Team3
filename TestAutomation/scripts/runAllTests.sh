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
        echo "<tr>
          <th scope='row'>$ID</th>
          <td>$MODULE</td>
          <td>$FUNCTION</td>
          <td>$REQUIREMENT</td>
          <td>$ARGUMENTS</td>
          <td>$EXPECTED</td>
          <td>$result</td>
          <td style='background-color:#26A65B; color:#fff'>PASSED</td>
        </tr>" >> "$ROOT/temp/output.html"
    else
        N_FAILS=$((N_FAILS+1))
        echo -e "$ID: $REQUIREMENT ==> ${RED}FAIL${NC}"
        echo "<tr class='danger'>
          <th scope='row'>$ID</th>
          <td>$MODULE</td>
          <td>$FUNCTION</td>
          <td>$REQUIREMENT</td>
          <td>$ARGUMENTS</td>
          <td>$EXPECTED</td>
          <td>$result</td>
          <td><code><b>FAILED</b></code></td>
        </tr>" >> "$ROOT/temp/output.html"
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

echo "<table class='table table-bordered'><thead><tr>
      <th>ID</th>
      <th>Module</th>
      <th>Function</th>
      <th>Requirement</th>
      <th>Arguments</th>
      <th>Expected</th>
      <th>Result</th>
      <th></th>
    </tr>
  </thead>
  <tbody>" >> "$ROOT/temp/output.html"
for testCaseFile in "${testCasesFiles[@]}"; do #iterate over the test cases
    executeTestCase "$testCaseFile"
done
echo "</tbody></table>" >> "$ROOT/temp/output.html"

if [ $N_FAILS -gt 0 ]; then
   echo "<br><br>" >> "$ROOT/temp/output.html"
   echo "<h4>$N_FAILS test(s) failed.</h4><br>" >> "$ROOT/temp/output.html"
   cat "$ROOT/temp/fails.txt" >> "$ROOT/temp/output.html"
fi

echo "</div></body></html>" >> "$ROOT/temp/output.html"

firefox "$ROOT/temp/output.html" &> /dev/null
