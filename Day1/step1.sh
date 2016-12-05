#!/bin/bash

x=0
y=0
dirX=1
dirY=1
i=0
debug=$1
filename="Inputs/day1.txt"

function abs {
    local  a=$1
    local  result=$2
    if [ $a -lt 0 ]; then
        a=$((-$a));
    fi
    eval $result="'$a'"
}

function log {
    if [ $debug ]; then
        echo $1
    fi
}

while read -r line
do
    name="$line"
done < "$filename"

directions=$(echo $name | tr ", " "\n")

for dir in $directions
do
    side=`echo $dir | grep -o '[A-Z]'`
    blocks=`echo $dir | grep -o '[0-9]\+$'`
    
    mod=`expr $i % 2`
    if [ $mod = 0 ]; then
        log "Move on X"

        if [ $side = "L" ]; then
            dirX=$((-1 * $dirY))
            log "-- Left to $blocks"
        else
            dirX=$((1 * $dirY))
            log "-- Right to $blocks"
        fi

        x=$(($x + ($dirX * $blocks)))
    else
        log "Move on Y"

        if [ $side = "L" ]; then
            dirY=$((1 * $dirX))
            log "-- Down to $blocks"
        else
            dirY=$((-1 * $dirX))
            log "-- Up to $blocks"
        fi
        y=$(($y + ($dirY * $blocks)))
        exit
    fi

    i=`expr $i + 1`
done

abs $x xFinal
abs $y yFinal

answer=`expr $xFinal + $yFinal`

echo "Answer: " $answer;