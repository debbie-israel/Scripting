# Script que muestre recursivamente todos los ficheros y directorios cuyo nombre empiece por a o por b y que no contenga el carácter ~, a partir de un directorio que recibe como argumento. Si no se le pasa argumento, buscará a partir del directorio de trabajo.

# ./ej3.sh [directorio]

if test $# -gt 1
then
	echo "Error. Uso: $0 [directorio]"
	exit 1

elif test $# -eq 1
then
	if test -d $1
	then
		directorio=$1
	else
		echo "el directorio $1 no existe o no es directorio"
		exit 2
	fi
else
	directorio=.
fi

for FILE in $(ls -R $directorio | grep ^[a-b] | grep -v '~')
do 
	echo $FILE
done




# find $directorio -name "[ab]*" | grep -v '~'
# el * en find significa que después de ab puede haber cualquier cosa
# solo tiene sentido poner el grep a la derecha que es de tipo filtro
