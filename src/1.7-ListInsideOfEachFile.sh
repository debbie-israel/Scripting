#!/bin/bash
# if you want to do ctrl+F of certain content of lots of files
# this is another option for a grep

touch listOfEverythingInEachFle.txt
for FILE in $(ls -R .)
do
  cat $FILE >> listOfEverythingInEachFle.txt
done
