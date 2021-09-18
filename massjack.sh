#! /bin/bash
# this code is to create many html files for checking clickjacking 
# useful when we have to check many urls like when testing blackbox
# Usage
# give the file execute permission before running , and run the file like ./clickjac.sh
# the program will ask for path of file 
# then creates a folder with name "clickjack" in which ever path the tool is executed
# and stores the all html files in that folder
# simple time saving tool by Rb4Cybersec
mkdir /root/clickjack
sleep 1
read -p "enter file name with absolute path   " filepath
input="$filepath"
while IFS= read -r line
do
  var=$(echo  "$line" | sed -e 's|^[^/]//||' -e 's|/.$||')
  echo "<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>click jack</title>
</head>
<body>
<iframe src="$line" width="700" height="700"></iframe>
</body>
</html>" > /root/clickjack/$var.html 
done < "$input"