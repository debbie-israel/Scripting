#!/bin/bash
############################################################################
#		$./examen10.sh nombre_fichero [d]

#		Cuenta los bytes de todos los archivos por separado con este formato(txt,pdf,ods)
#		comienza AóBóC ->nombre->[0-9]->.txt ó .pdf ó .ods
############################################################################


if test $# -gt 2
then
	echo error "Error.Uso: $0 nombre_fichero [directorio]"
	exit 1
fi

if test $# -eq 1
then
	if ! test -e $1 
	then
		echo "$1 no es fichero o no existe"
		exit 1
	fi
	dir=.
fi

if test $# -eq 2
then
	if ! test -e $1 
	then
		echo "$1 no es fichero o no existe"
		exit 1
	fi
	
	if ! test -d $2 
	then
		echo "$1 no es directorio o no existe"
		exit 1
	else
		dir=$2
	fi
fi


txt=$(find $dir -type f -regex ".*/[ABC]$1[0-9]+\.txt$")
pdf=$(find $dir -type f -regex ".*/[ABC]$1[0-9]+\.pdf$")
ods=$(find $dir -type f -regex ".*/[ABC]$1[0-9]+\.ods$")

cont=0
suma=0
for FILE in $txt
do
	cont=$(ls -l $FILE |cut -d " " -f5)
	suma=$(($suma+$cont))
done
echo txt:$suma

cont=0
suma=0
for FILE in $pdf
do
	cont=$(ls -l $FILE |cut -d " " -f5)
	suma=$(($suma+$cont))
done
echo pdf:$suma

cont=0
suma=0
for FILE in $ods
do
	cont=$(ls -l $FILE |cut -d " " -f5)
	suma=$(($suma+$cont))
done
echo ods:$suma


