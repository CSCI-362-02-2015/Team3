#!/bin/bash

# This is the template of the HTML file
# EOF = End Of File

echo "<!doctype html>"
echo "<html>"
echo "<head>"
echo "<title>Top-level directory</title>"
echo "</head>"
echo "<body>"
echo "<h5>List of all items of the current folder</h5>"
echo "<ul>"
for file in *
  do
    echo "<li>$file"
  done
echo "</ul>"
echo "</body>"
echo "</html>"
