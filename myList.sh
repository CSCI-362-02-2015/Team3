#!/bin/bash
rm test.html
sh ./html-template.sh >> test.html
firefox test.html
