<?php

$input = file_get_contents('inputs/day2.txt');
$lines = explode("\n", $input);

$matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
];

// On se positionne sur le numéro 5
$x_pos = 1;
$y_pos = 1;

$min_x = $min_y = 0;
$max_x = $max_y = 2;

$answer = "";

foreach ($lines as $line) {
    foreach (str_split($line) as $char) {

        switch ($char) {
            case "U":
                $y_pos = max($y_pos - 1, $min_y);
                break;

            case "L":
                $x_pos = max($x_pos - 1, $min_x);
                break;

            case "D":
                $y_pos = min($y_pos + 1, $max_y);
                break;

            case "R":
                $x_pos = min($x_pos + 1, $max_x);
                break;
        }
    }
    $answer .= $matrix[$y_pos][$x_pos];
}

echo "Answer : {$answer}";
