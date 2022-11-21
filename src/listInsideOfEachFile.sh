#!/bin/bash

touch listOfEverythingInEachFle.txt
for FILE in $(ls -R .)
do
  cat $FILE >> listOfEverythingInEachFle.txt
done
