<?php

$input = file_get_contents('inputs/day2.txt');
$lines = explode("\n", $input);

$matrix = [
    ["*", "*", "1", "*", "*"],
    ["*", "2", "3", "4", "*"],
    ["5", "6", "7", "8", "9"],
    ["*", "A", "B", "C", "*"],
    ["*", "*", "D", "*", "*"],
];

// On se positionne sur le numéro 5
$x_pos = 0;
$y_pos = 2;

$min_x = $min_y = 0;
$max_x = $max_y = 2;

$answer = "";

foreach ($lines as $line) {
    foreach (str_split($line) as $char) {

        $tmpX = $x_pos;
        $tmpY = $y_pos;

        switch ($char) {
            case "U":
                $tmpY--;
                break;

            case "L":
                $tmpX--;
                break;

            case "D":
                $tmpY++;
                break;

            case "R":
                $tmpX++;
                break;
        }

        if (isset($matrix[$tmpY]) && isset($matrix[$tmpY][$tmpX]) && $matrix[$tmpY][$tmpX] !== "*") {
            $x_pos = $tmpX;
            $y_pos = $tmpY;
        }

    }
    $answer .= $matrix[$y_pos][$x_pos];
}

echo "Answer : {$answer}";
