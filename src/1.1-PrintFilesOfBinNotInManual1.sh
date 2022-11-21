#!/bin/bash
########################################################################
# Imprimir ficheros de
# /bin que no tienen ficheros en pag de manual 1
# el formato de fichero en manual 1: /usr/share/man/man1/nombre.1.gz
#
# 		$./ej1.sh
########################################################################

if test $# -ne 0
then
	echo "Error. Uso: $0"
	exit 1
fi
 
for FILE in $(ls /bin)
do
	if ! test -e "/usr/share/man/man1/FILE.1.gz"
	then
		echo "El fichero $FILE no se encuentra en /bin"
	fi
done

