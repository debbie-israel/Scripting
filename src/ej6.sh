# Script de shell que dado un archivo tgz, elimine de su interior todos los archivos de tamaño superior a 8 kbytes. (tar, mktemp)

# ./ej6.sh [archivo tgz]

if test $# -gt 1 || test $# -lt 1
then
	echo "Error. Uso: $0 archivo tgz"
	exit 1
else
	FILE= $1
fi
	
	
