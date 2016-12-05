#!/bin/bash

x=0
y=0
dirX=1
dirY=1
tmpX=0;
tmpY=0;
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
positions=()

for dir in $directions
do
    side=`echo $dir | grep -o '[A-Z]'`
    blocks=`echo $dir | grep -o '[0-9]\+$'`
    
    mod=`expr $i % 2`

    tmpX=$x;
    tmpY=$y;

    find=0

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
    
        while [ $tmpX != $x ]; do
            tmpX=`expr $tmpX + $dirX`

            position=$tmpX+$y

            for pos in $positions
            do
                if [ $position == $pos ]; then
                    find=1
                    break
                fi
            done
            
            echo $find

            if [ $find = "1" ]; then
                positions=(${positions[@]} $position)
            fi
        done
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

        while [ $tmpY != $y ]; do
            tmpY=`expr $tmpY + $dirY`
            
            position=$x+$tmpY

            for pos in $positions
            do
                if [ "$position" == "$pos" ]; then
                    find="1"
                    break
                fi
            done

            if [ $find = "1" ]; then
                positions=(${positions[@]} $position)
            fi
        done
    fi

    i=`expr $i + 1`
done

echo $positions

abs $tmpX xFinal
abs $tmpY yFinal

answer=`expr $xFinal + $yFinal`

echo "Answer: " $answer;