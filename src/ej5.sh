#Script de shell que a partir de un directorio que recibe como argumento, busque los dos archivos de más tamaño y muestre su nombre y tamaño. Si norecibe ningún argumento busca a partir del directorio actual.

# ./ej5.sh [directorio]

if test $# -gt 1
then
	echo "Error. Uso: $0 [directorio]"
	exit 1

elif test $# -eq 1
then
	if ! test -d $1
	then
		echo "$1 no es directorio o no existe"
		exit 2
	else
		directorio=$1
	fi
else
	directorio=.
fi

# primera versiób hecha por mí
#STRING=$(ls $directorio | du -h| sort -n -r| head -n 2)
#echo "$STRING"

# solución profes
#cd $directorio
#du -b $(ls)| sort -n -r| head -2

# fusión entre mi solución y solucion profes
du -b $(ls $directorio) | sort -n -r | head -n 2

#duda si le pongo -h sale una solución totalmente distinta, estaría mal? (-h muestra tamaños en forma legible mientras que -b para bytes)




		
