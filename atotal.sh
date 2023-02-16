# Función para calcular el total de consumo de una ciudad
function calcular_total_consumo() {
  ciudad=$1
  total=0


  echo $total
}

echo "Introduzca el nombre de la ciudad:"
read ciudad

# Verificar si la ciudad existe
while [[ ! -f "$ciudad.txt" ]]; do
  echo "La ciudad ingresada no existe, por favor introduzca una ciudad válida:"
  read ciudad
done

# Calcular el total de consumo de la ciudad
total_consumo=$(calcular_total_consumo $ciudad)

# Imprimir el resultado
echo "El total de consumo de la ciudad $ciudad es: $total_consumo"


