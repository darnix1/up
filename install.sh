#!/bin/sh

Key="qraLatsil/05@536f?9e09?7b/8888:@5v87@v03?v75@"
result=$(curl -sSL -H "Ofus: $ofus" -H "Key: $Key" 157.230.178.51:81/dani/checkIP.log | grep "$Key")

if [ -n "$result" ]; then
    columna_3=$(echo "$result" | awk '{print $3}')
    echo "Valor de la columna 3: $columna_3"
else
    echo "No se encontró ninguna coincidencia para la Key ingresada."
fi
