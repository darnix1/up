Key"qra-atsil/0515@Pf24e0427b/8888:15C871C0@2C751"
result=$(curl -sSL -H "Ofus: $ofus" -H "Key: $key" 157.230.178.51:81/dani/checkIP.log | grep "$key")

if [ -n "$result" ]; then
    column_value=$(echo "$result" | awk 'NR==1{print $3}')
    echo "Valor de la columna 2: $column_value"
else
    echo "No se encontró ninguna coincidencia para la Key ingresada."
fi
