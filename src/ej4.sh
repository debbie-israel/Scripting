#busque en todos directorios en la variable de entorno $PATH el nombre del archivo que se le pasa como parámetro, contiene una lsita separada por : de todos los directorios donde la shell busca ejecutables

if test $# -ne 1
then
	echo "Error. Uso: $0 nombre_archivo"
	exit 1
fi


FOUND=0
for DIRECTORIO in $(echo $PATH | tr ':' ' ')
do
	# El STRING lo hacemos puesto que si encuentra algo el find lo devolvería en forma de string, en caso contrario devolvería un string vacío
	STRING=$(find $DIRECTORIO -name $1)
	
	# z comprueba si el string está vacío
	if ! test -z $STRING
	then
		echo "$1 está en $STRING"
		FOUND=1

	fi
done

if test $FOUND -eq 0 
then
	echo "$1 no está en ningún directorio del PATH"
	exit 2
fi


