#!/bin/bash

is_prime() {
    num=$1

    if [ $num -lt 2 ]; then
        return
    fi

    for ((i=2; i<num; i++))
    do
        if [ $((num%i)) -eq 0 ]; then
            return
        fi
    done

    echo "$num is Prime"
}

for ((n=1; n<=50; n++))
do
    is_prime $n
done
