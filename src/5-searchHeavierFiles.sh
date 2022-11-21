#!/bin/bash

########################################################################
# A partir de directorio
# Buscar 2 archivos con mayor tamaño mostrando nombre y tamaño
# Si no recibe dir, a partir del dir actual
# ls, du, sort, head
#
# 		$./ej5.sh [directorio]
########################################################################

if test $# -gt 1
then
	echo "Error. Uso: $0 [directorio]"
	exit 1
fi
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

du -b $(ls $dir) | sort -n -r | head -n 2
