# Script que a partir de un directorio que recibe como argumento añada permisos de ejecución de forma recursiva a todos los archivos de extensión .sh. Si no recibe argumento, lo hará a partir del directorio actual.

# ./ej2.sh dir (1)
# ./ej2.sh	(0)

if test $# -gt 1
then
	echo "Error. Uso: $0 [directorio]"
	exit 1


elif test $# -eq 1
then
	#comprobamos si es un directorio
	if test -d $1
	then
		directorio=$1
	else
		echo "$1 no existe o no es un directorio"
		exit 2
	fi
else
	directorio=.
fi

for FILE in $(find $directorio *.sh)
do
	chmod u+x $FILE
done


