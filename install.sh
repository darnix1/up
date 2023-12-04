#!/bin/sh
Key"qraLatsil/05@536f?9e09?7b/8888:@5v87@v03?v75@"
result=$(curl -sSL -H "Ofus: $ofus" -H "Key: $Key" 157.230.178.51:81/dani/checkIP.log | grep "$Key")

if [ -n "$result" ]; then
    column_value=$(echo "$result" | awk '{print $2}')
    echo "Valor de la columna 2: $column_value"
else
    echo "No se encontró ninguna coincidencia para la Key ingresada."
fi
