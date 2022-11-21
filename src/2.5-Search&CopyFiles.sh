#!/bin/bash

#####################################################################
#
#
#		$./ copiamp3.sh directiorio1 [directorio2]
#
#	
#		En d1 se deben buscar los .mp3 de forma recursiva
#		En d2 copiar todos los .mp3
#		En caso de no haber d2 en dir actual
#
#####################################################################

dirOrigen=$1
dirDestino=$2

for FILE in $(find $dirOrigen -name "*.mp3" -fype f )
do	
	cp $FILE $dirDestino
done
