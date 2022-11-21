#!/bin/bash

#############################################################################

#	$./myscript.sh borrar/permisoW nombre_fichero

#	Borrar f comprobando valor devuelto al borrar

#############################################################################

if test $# -ne 2
then
	echo "Error. Uso: $0 borrar/permisoW nombre_fichero" 
	exit 1
else
	if test -e $2
	then
		fich=$2
	else
		echo "Error. El fichero $2 no existe o no es fichero"
		exit 1 
	fi
fi

if test $1 =="borrar"
then
	rm $fich 
	if test $? -ne 0
	then
		echo "Ha habido un error a la hora de borrar el fichero"
		exit 1
	fi
fi

if test $1 =="permisoW"
then
	chmod ug+w $fich
fi
