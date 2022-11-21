#!/bin/bash

########################################################################
# Buscar en todos los directorios de $PATH 
# el nombre de un archivo que se le pasa como parámetro
#/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
#
# 		$./ej4.sh archivo
# pd: an example of file could be zip, you do: touch zip; and then; ./ej4.sh zip
########################################################################

if test $# -ne 1
then
	echo "Error. Uso: $0 nombre_archivo"
	exit 1
else
	if ! test -e $1
	then
		echo "Error. No existe $1"
		exit 1
	else
		FILE=$1
	fi
	
	FOUND=0
	for DIR in $(echo $PATH | tr ':' '\n')
	do
		STRING=$(find $DIR -name $FILE)
		if ! test -z $STRING
		then
			echo "$FILE está en $DIR con ruta $STRING"
			FOUND=1
		fi
	done
	
	if test $FOUND -eq 0
	then
		echo "$FILE no se encuentra en ningún directorio de \$PATH"
		exit 1
	fi
fi
