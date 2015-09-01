#Team3
#!/bin/bash

getHTML() {
	echo "<!doctype html>"
	echo "<html>"
	echo "<head>"
	echo "<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">"
	echo "<title>Top-level directory</title>"
	echo "</head>"
	echo "<body>"
	echo "<div style='margin-left:15px' class='page-header'>
 		<h1>List of all items of the currend folder <small>International Team 3</small></h1>
		</div>"
	echo "<ul style='margin-left:15px; float: left; width: auto' class='list-group'>"
	for file in *
	do
		if [ -d "$file" ] 
			then 
				cd $file
				echo "<div class='list-group-item'><b>$file ($(ls -1 | wc -l) files)</b>"
				if [ "$(ls -A *)" ]
					then for insideFile in *
						do echo "<li style='margin: 0 0 0 50px'>$insideFile"
					done
				fi
				echo "</div>"
				cd ..
			else echo "<div class='list-group-item'>$file <span style='margin-left:15px;' class="badge">$(stat -c%s "$file") bytes</span></div>"
		fi
	done
	echo "</ul>"
	echo "</body>"
	echo "</html>"
}

getHTML > test.html
firefox -url test.html 2>/dev/null
