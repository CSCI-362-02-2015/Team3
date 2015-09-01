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
		echo "<li class='list-group-item'>$file"
	done
	echo "</ul>"
	echo "</body>"
	echo "</html>"
}

getHTML > test.html
firefox test.html
