key="qra-atsil/0515@Pf24e0427b/8888:15C871C0@2C751"
result=$(curl -sSL -H "Ofus: $ofus" -H "Key: $key" 157.230.178.51:81/dani/checkIP.log | awk -v key="$key" '$0 ~ key')

if [ -n "$result" ]; then
    column3_value=$(echo "$result" | awk '{print $3}')
    column5_value=$(echo "$result" | awk '{print $5}')
    echo "Valor de la columna 3: $column3_value"
    echo "Valor de la columna 5: $column5_value"
else
    echo "No se encontró ninguna coincidencia para la Key ingresada."
fi
