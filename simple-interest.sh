#!/usr/bin/env bash
set -eu

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual interest rate (%): " rate
read -r -p "Enter the time period in years: " years

number_pattern='^[0-9]+([.][0-9]+)?$'
for value in "$principal" "$rate" "$years"; do
    if [[ ! "$value" =~ $number_pattern ]]; then
        printf '%s\n' "Please enter non-negative numbers." >&2
        exit 1
    fi
done

LC_ALL=C awk -v principal="$principal" -v rate="$rate" -v years="$years" \
    'BEGIN { printf "Simple interest: %.2f\n", principal * rate * years / 100 }'
