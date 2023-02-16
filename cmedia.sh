# Pedir al usuario el nombre de la ciudad
echo "Introduzca el nombre de la ciudad:"
read ciudad

while [[ ! -f "$ciudad.txt" ]]; do
  echo "La ciudad ingresada no existe, por favor introduzca una ciudad válida:"
  read ciudad
done

total_consumo=0
num_archivos=0
for archivo in $ciudad*.txt; do
  consumo=$(cat $archivo)
  total_consumo=$((total_consumo + consumo))
  num_archivos=$((num_archivos + 1))
done

media=$(echo "scale=2; $total_consumo / $num_archivos" | bc)

echo "La media de consumo de la ciudad $ciudad es de $media kWh."
