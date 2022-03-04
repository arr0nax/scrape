#!/bin/bash

read -p "enter a collection name: " name
read -p "enter a url: " url
mkdir $name
curl $url > $name/page;
grep -oh 'https:\/\/[a-zA-Z0-9/.]*\.jpg' $name/page > $name/srcs 
grep -oh 'http:\/\/[a-zA-Z0-9/.]*\.jpg' $name/page >> $name/srcs 
grep -oh 'https:\/\/[a-zA-Z0-9/.]*\.png' $name/page >> $name/srcs 
grep -oh 'http:\/\/[a-zA-Z0-9/.]*\.png' $name/page >> $name/srcs 
cat $name/srcs | xargs wget -P $name
#rm $name/page $name/srcs
