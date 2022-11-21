#!/bin/bash

########################################################################
# Dado fichero comprimido tgz
# elimine de interior todos os ficheros de tamaño superior a 8Kb
# tar, mktemp
#
# 		$./ej6.sh nombre_archivo.tgxz
########################################################################

if test $# -gt 1
then
	echo "Error. Uso: $0 nombre_archivo.tgxz"
	exit 1
fi
else
	if test $1 == "*.tgz"
	then
		tgzFILE=$1
	else
		echo "Error. $1 no es un archivo tgz"
		exit 1
	fi
fi

DIRTEMPORAL=$(mktemp -d) # se crea dir temp
DIRSCRIPT=$(pwd)
tar -xvzf $tgzFILE -C $DIRTEMPORAL # descomprimimos en dir temp

for FILE in $(find $DIRTEMPORAL -type f -size +8k) # borramos de dirtemp
do
	rm $FILE
done

cd $DIRTEMPORAL
tar -cvzf copy.tgz * # comprimimos todo lo de dirtemp en copy.tgz
mv copy.tgz $DIRSCRIPT # movemos copy en ruta donde se encontraba el comprimido
