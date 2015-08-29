#!/bin/bash

# This is the template of the HTML file
# EOF = End Of File

echo "<!doctype html>"
echo "<html>"
echo "<head>"
echo "<title>Top-level directory</title>"
echo "</head>"
echo "<body>"
for file in /home/user/*; do
  echo ${file##*/}
done
echo "</body>"
echo "</html>"
