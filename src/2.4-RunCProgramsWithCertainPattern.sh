#!/bin/bash

########################################################################
#
#
#		$./corregir.sh directorio practicaXX.c
#
#
########################################################################

if test $# -ne 2
then
	echo "Error. Uso $0 nombrePractica directorio"
	exit 1
else
	if test -e $2
	then
		fich=$2
	else
		echo "Error. $1 no existe o no es fichero"
		exit 1
	fi
	
	if test -d $1
	then
		dir=$1
	else
		echo "Error. $2 no existe o no es directorio"
		exit 1
	fi
fi

cd $dir
for i in $(seq 1 100)
do
	gcc -o practica$i practica$i.c
	if test $? -eq 0
	then
		./practica$i <$dir >practica$i.c.salida 2> practica$i.c.errores
		rm practica$i
	else
		echo "Error compilando practica$i.c"
		exit 1
	fi
done
