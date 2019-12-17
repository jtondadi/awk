# Autor: jt (diciembre 2019)
# Motivo: preparar oposición
# 
# Variables (directorio, usuario, uso, mayor y menor)
# Nos proporciona directorio, usuario, uso del disco, mayor y menor tamaño
# del uso en disco de un usuario (id=1000)
# hay que tratar el script.2 de awk para su mantenimiento y puesta en marcha
#
# Utilizacion awk
# F: limitador de campos, -f pasar script , archivo a tratar
# cut (para extraer lo que necesitamos)
# Utilizacion du
# -s (directorio) -S (archivos) h (forma legible de la capacidad)
# uso de sort, head y tail para extracción concreta 
#
directorio=`awk -F: -f script.2 passwd | cut -f3`
usuario=`awk -F: -f script.2 passwd | cut -f2`
uso=`du -sh $directorio`
mayor=`du -Sh $directorio | sort -rh | head -n1`
menor=`du -Sh /home/juan | sort -rh | tail -n1`
echo " Resumen del usuario: $usuario "
echo " Directorio: $directorio "
echo " Fichero de mayor tamaño: $mayor"
echo " Ficheor de menor tamaño: $menor"
echo " Uso del disco: $uso" 
echo "---"
