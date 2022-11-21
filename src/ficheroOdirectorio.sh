#!/bin/bash

########################################################################
#	./ficheroOdirectorio febrero /home/fichero.txt
#	3
#
#	./ficheroOdirectorio febrero /home/midirectorio
#	-rw-rw-r-- 1 debbie debbie 3490 jun 17 13:53 ./febrero.sh
#
#	./ficheroOdirectorio febrero
#	-rw-rw-r-- 1 debbie debbie 3490 jun 17 13:53 ./febrero.sh
#	-rw-rw-r-- 1 debbie debbie 30239 jun 17 13:54 ./febreroOtro.txt~
#	-rw-rw-r-- 1 debbie debbie 30239 jun 17 13:54 ./febreroOtro.txt
#	-rw-rw-r-- 1 debbie debbie 9305 jun 17 13:53 ./febrerolargo.txt
#
#
########################################################################

if test $# -gt 2 || test $# -lt 1
then
	echo "Error. Uso: $0 palabra_a_buscar [fichero ó directorio]"
	exit 1
fi

if test $# -eq 1
then
	DIR=.
	for FILE in $(find $DIR -type f -size +1k -name "$1*")
		do
			if test -n $FILE
			then
				echo $(ls -l $FILE)
			fi
			
		done
fi

if test $# -eq 2
then
	if ! (test -f $2)&& ! (test -d $2)
	then
		echo "Error, $2 no es ni fichero ni directorio. Uso: $0 palabra_a_buscar [fichero ó directorio]"
		exit 1
	fi
	
	if test -f $2 
	then
		grep $1 $2 | wc -l
	fi
	
	if test -d $2 
	then
		DIR=$2
		for FILE in $(find $DIR -type f -size +1k -name "$1*")
		do
			if test -n $FILE
			then
				echo $(ls -l $FILE)
			fi
			
		done
	fi
fi


