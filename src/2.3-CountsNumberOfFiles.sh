#!/bin/bash

#################################################################
#	$./nFicheros.sh [directorio] 
# Cuenta nº de ficheros (recursivamente)
# con permiso de ejecución
#################################################################


echo $(find $1 -type f -executable| wc -l)

