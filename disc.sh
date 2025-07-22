#!/bin/bash

solve_quadratic() {
    a=$1
    b=$2
    c=$3
    expected="$4"

    echo "Տրված է a=$a, b=$b, c=$c"

    if [ "$a" == "0" ]; then
        result="Ապրոքսիմացիա քառակուսի չէ"
    else
        D=$(echo "$b * $b - 4 * $a * $c" | bc -l)
        cmp=$(echo "$D < 0" | bc)
        if [ "$cmp" -eq 1 ]; then
            result="Լուծում չկա"
        else
            zero=$(echo "$D == 0" | bc)
            if [ "$zero" -eq 1 ]; then
                x=$(echo "scale=5; -$b / (2 * $a)" | bc -l)
                result="$(printf "%.1f" $x)"
            else
                x1=$(echo "scale=5; (-$b - sqrt($D)) / (2 * $a)" | bc -l)
                x2=$(echo "scale=5; (-$b + sqrt($D)) / (2 * $a)" | bc -l)
                result="$(printf "%.1f" $x1), $(printf "%.1f" $x2)"
            fi
        fi
    fi

    echo "Արդյունք՝ $result"
    echo "Սպասված՝ $expected"

    if [ "$result" == "$expected" ]; then
        echo "Փորձն անցավ հաջողությամբ "
    else
        echo "Փորձն անցավ "
    fi
    echo "-----------------------------"
}

solve_quadratic 1 -3 2 "1.0, 2.0"
solve_quadratic 1 2 1 "-1.0"
solve_quadratic 1 0 1 "Լուծում չկա"
solve_quadratic 0 2 1 "Ապրոքսիմացիա քառակուսի չէ"
