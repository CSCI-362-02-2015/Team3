#Team3
#!/bin/bash

#Usage: myList.sh <MAX_DEEP>
#eg: myList.sh 4


if [ -z "$1" ]; then #if no parameter, set 3 as default
	MAX_DEEP=3
else
	MAX_DEEP=$[$1]
fi
DEEP=0
listSubDirectories() {
	DEEP=$[DEEP + 1]
	echo "<ul>"
	for file in *; do
		echo "<li>$file"
		if [[ -d $file ]]; then
			if [[ $DEEP -lt $MAX_DEEP ]]; then
				cd "$file"
				listSubDirectories
				cd ..
			fi
		fi
		echo "</li>"
	done
	echo "</ul>"
	DEEP=$[DEEP - 1]
}

getHTML() {
	ACTUAL_DIR=${PWD##*/} 
	echo "<!doctype html>"
	echo "<html>"
	echo "<head>"
	echo "<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">"
	echo "<title>MyList Script</title>"
	echo "</head>"
	echo "<body>"
	echo "<div style='margin-left:15px' class='page-header'>
		<h1>International Team 3</h1>
		<h2>Files at directory <font color='red'>$ACTUAL_DIR</font> with max deep <font color='red'>$MAX_DEEP</font></h2>
		</div>"

	listSubDirectories

	echo "</body>"
	echo "</html>"
}

getHTML > test.html
firefox test.html
