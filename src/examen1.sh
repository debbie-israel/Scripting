#!/bin/bash

#################################################################
#	$./hash.sh directorio fichero
# Comprueba argumentos
# Busca(no rec) todos los ficheros que tengan permiso de lectura
# Poner en fichero de salida el 
#	- hash
#	- fichero
#	- propietario
#################################################################
if test $# -gt 2
then
	echo "Error. Uso: $0 directorio fichero"
	exit 1
else
	if test -d $1
	then
		dir=$1
	else
		echo "Error. $1 no es directorio o no existe"
		exit 2
	fi
	if test -e $2
	then
		fich=$2
	else
		echo "Error. $2 no es fichero o no existe"
		exit 3
	fi
fi

for FILE in $(ls $dir)
do
	if test -r $FILE && test -f $FILE
	then
		hash=$(sha256sum $FILE)
		propietario=$(ls -l $FILE| cut -d ' ' -f3)
		echo $hash $propietario >> $fich
	fi
done
