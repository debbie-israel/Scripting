#!/bin/bash

########################################################################
# Dado directorio
# añadir permisos de ejecución a todos sus .sh
# Si no se da directorio, hacerlo sobre el dir actual
#
# 		$./ej2.sh [directorio]
########################################################################

if test $# -eq 0
then
	dir=.
fi

if test $# -eq 1
then
	if ! test -d $1
	then
		echo "Error. $1 no existe o no es directorio"
	exit 1
	else
		dir=$1
	fi
fi

if test $# -gt 1
then
	echo "Error. Uso $0 [directorio]"
	exit 1
fi

for FILE in $(find $dir -name "*.sh")
do
	chmod u+x $FILE
done
