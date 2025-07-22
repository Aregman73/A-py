#!/bin/bash

calculate_discriminant() {
  echo "scale=5; ($2 * $2) - 4 * $1 * $3" | bc
}

solve_quadratic() {
  a=$1
  b=$2
  c=$3

  echo "== Հավասարում՝ $a*x^2 + $b*x + $c = 0"

  if [[ "$a" == "0" ]]; then
    if [[ "$b" == "0" ]]; then
      if [[ "$c" == "0" ]]; then
        echo "→ Անվերջ լուծում (0 = 0)"
      else
        echo "→ Լուծում չկա"
      fi
    else
      x=$(echo "scale=5; -$c / $b" | bc 2>/dev/null)
      echo "→ Մեկ լուծում (գծային)՝ x = $x"
    fi
  else
    D=$(calculate_discriminant "$a" "$b" "$c")
    comp=$(echo "$D > 0" | bc)
    if [[ "$comp" == "1" ]]; then
      sqrtD=$(echo "scale=10; sqrt($D)" | bc -l 2>/dev/null)
      x1=$(echo "scale=5; (-1 * $b + $sqrtD) / (2 * $a)" | bc -l 2>/dev/null)
      x2=$(echo "scale=5; (-1 * $b - $sqrtD) / (2 * $a)" | bc -l 2>/dev/null)
      echo "Դիսկրիմինանտ D = $D"
      echo "→ Երկու լուծում՝ x1 = $x1, x2 = $x2"
    elif [[ "$D" == "0" ]]; then
      x=$(echo "scale=5; -1 * $b / (2 * $a)" | bc -l 2>/dev/null)
      echo "Դիսկրիմինանտ D = $D"
      echo "→ Մեկ կրկնվող լուծում՝ x = $x"
    else
      echo "Դիսկրիմինանտ D = $D"
      echo "→ Լուծում չկա (D < 0)"
    fi
  fi
  echo
}

main() {
  cases=(
    "1 2 1"       # մեկ լուծում
    "1 -3 2"      # երկու լուծում
    "1 4 5"       # լուծում չկա
    "2 5 -3"      # երկու լուծում
    "1 0 1"       # լուծում չկա
    "0 0 0"       # անվերջ լուծում
    "0 0 5"       # լուծում չկա
    "0 2 4"       # մեկ լուծում (գծային)
  )

  echo "=== ԻՆՔՆԱՇԽԱՏ ԹԵՍՏԱՎՈՐՈՒՄ ==="
  for triple in "${cases[@]}"; do
    set -- $triple
    solve_quadratic "$1" "$2" "$3"
  done
}

main

