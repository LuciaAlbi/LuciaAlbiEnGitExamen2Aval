# Función para encontrar el mes y año de consumo máximo y mínimo
function buscar_max_y_min() {
  ciudad=$1
  max_consumo=0
  min_consumo=99999999
  max_mes=0
  min_mes=0
  max_anio=0
  min_anio=0

  # Recorrer todos los archivos de la ciudad
  for archivo in $ciudad*.txt; do
    # Extraer el mes y el año del archivo
    mes=$(echo $archivo | sed 's/.*_\(.*\)-\(.*\)\.txt/\1/')
    anio=$(echo $archivo | sed 's/.*_\(.*\)-\(.*\)\.txt/\2/')

    consumo=$(cat $archivo)

    if [ $consumo -gt $max_consumo ]; then
      max_consumo=$consumo
      max_mes=$mes
      max_anio=$anio
    fi

    if [ $consumo -lt $min_consumo ]; then
      min_consumo=$consumo
      min_mes=$mes
      min_anio=$anio
    fi
  done

  echo "El máximo consumo de la ciudad $ciudad fue en $max_mes/$max_anio con un total de $max_consumo kWh."
  echo "El mínimo consumo de la ciudad $ciudad fue en $min_mes/$min_anio con un total de $min_consumo kWh."
}

echo "Introduzca el nombre de la ciudad:"
read ciudad

# Verificar si la ciudad existe
while [[ ! -f "$ciudad.txt" ]]; do
  echo "La ciudad ingresada no existe, por favor introduzca una ciudad válida:"
  read ciudad
done

# Buscar el mes y año de consumo máximo y mínimo
buscar_max_y_min $ciudad
