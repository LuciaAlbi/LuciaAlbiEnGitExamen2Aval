# Inicializar variables
consumo_previo=""
decreciente=true

# Recorrer las ciudades de Valencia, Madrid y Barcelona
for ciudad in "Valencia" "Madrid" "Barcelona"; do

  # Recorrer los archivos de consumo de la ciudad actual
  for archivo in $ciudad-*.txt; do

    # Extraer el mes y el año del nombre del archivo
    mes=$(echo $archivo | cut -d '.' -f 1 | cut -d '-' -f 2)
    anio=$(echo $archivo | cut -d '.' -f 1 | cut -d '-' -f 3)

    consumo=$(cat $archivo)

    # Comprobar si el consumo es menor o igual que el consumo anterior
    if [[ ! -z $consumo_previo && $(echo "$consumo > $consumo_previo" | bc -l) -eq 1 ]]; then
      decreciente=false
      break
    fi

    consumo_previo=$consumo

    # Si se ha llegado a diciembre y la ciudad sigue siendo decreciente, imprimir el resultado
    if [[ $mes -eq 12 && $anio -eq 2022 && $decreciente = true ]]; then
      echo "$ciudad tuvo un consumo decreciente a lo largo del año 2022."
    fi
  done

  # Reiniciar las variables
  consumo_previo=""
  decreciente=true
done
