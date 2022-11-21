#!/bin/bash

########################################################################
# Mostrar recursivamente todos los directorios y ficheros cuyo nombre
# empiece por a o b y que no contenga el caracter virgulilla
# dado un directorio
# Si no se da directorio, hacerlo sobre el dir actual
#
# 		$./ej3.sh [directorio]
########################################################################

if test $# -eq 0
then 
	dir=.
fi
if test $# -eq 1
then 
	if test -d $1
	then 
		dir=$1
	else
		echo "Error. $1 no es directorio o no existe"
		exit 1
	fi
fi
if test $# -gt 1
then
	echo "Error. Uso $0 [directorio]"
	exit 1
fi

for FILE in $(find $dir -name "[ab]*" | grep -v "~")
do
	echo $FILE
done
