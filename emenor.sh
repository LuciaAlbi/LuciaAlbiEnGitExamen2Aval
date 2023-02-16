# Inicializar variables
ciudad_min=""
media_min=""

# Recorrer todas las ciudades
for archivo in *.txt; do
  ciudad=$(echo "$archivo" | cut -d '.' -f 1)
  media=$(./cmedia.sh $ciudad | grep -o "[0-9]*\.[0-9]*")
  
  # Actualizar la ciudad con la media de consumo más baja
  if [[ -z $media_min ]] || (( $(echo "$media < $media_min" | bc -l) )); then
    ciudad_min=$ciudad
    media_min=$media
  fi
done

# Imprimir la ciudad con la media de consumo más baja
echo "La ciudad con la media de consumo más baja es $ciudad_min con una media de $media_min kWh."
