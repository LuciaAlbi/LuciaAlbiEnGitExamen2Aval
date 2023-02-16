# Obtener la media de consumo de la ciudad
media=$(./cmedia.sh $1 | grep -o "[0-9]*\.[0-9]*")

# Determinar la calificación ecológica
if (( $(echo "$media < 400" | bc -l) )); then
  eco="ECO"
else
  eco="NO ECO"
fi

echo "La calificación ecológica de la ciudad $1 es $eco."
