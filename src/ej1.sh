# Script que busque cuales de los ficheros del directorio /bin no  tienen pagina de manual en la seccion 1(/usr/share/man/man1/nombre.1.gz) sindo nombre el nombre del comando. Por ej para ls /usr/share/man/man1/ls.1.gz

# ./ej1.sh

if test $# -ne 0
then
	echo "Error. Uso:$0"
	exit 1
fi

for comando in $(ls /bin)
do
	if ! test -e "/usr/share/man/man1/$comando.1.gz"
	then
		echo "$comando no tiene entrada de manual de mandato 1"
	fi
done

