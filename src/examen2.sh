#!/bin/bash

#################################################################
#	$./iguales.sh fichero salida [directorio]
# a)	Comprueba argumentos
# b)	Busca(rec) todos los archivos que sean iguales en contenido
#	al fichero dado, en dir dado
# c) 	Escribir apartado anterior en fichero salida
#################################################################

if test $# -gt 3
then
	echo "Error. Uso: $0 fichero salida [directorio]"
	exit 1
fi
	
if test $# -eq 2 
then
	if test -e $1
	then
		ficheroAComparar=$1
	else
		echo "Error. $1 no existe o no es fichero"
		exit 1
	fi
	if test -e $2
	then
		ficheroSalida=$2
	else
		echo "Error. $2 no existe o no es fichero"
		exit 1
	fi
	dir=.
fi

if test $# -eq 3
then
	if test -e $1
	then
		ficheroAComparar=$1
	else
		echo "Error. $1 no existe o no es fichero"
		exit 1
	fi
	if test -e $2
	then
		ficheroSalida=$2
	else
		echo "Error. $2 no existe o no es fichero"
		exit 1
	fi
	if test -d $3
	then
		dir=$3
	else
		echo "Error. $3 no existe o no es directorio"
		exit 1
	fi
fi

for FILE in $(find $dir -type f)
do
	STRING=$(diff $FILE $ficheroAComparar)
	if ! test -z $STRING # man test==> -z the length of STRING is zero # -n the length of STRING is nonzero
	then
		echo $STRING
		echo $FILE >> salida
	fi
done


