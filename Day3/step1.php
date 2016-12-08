<?php

$input        = file_get_contents('inputs/day3.txt');
$lines        = explode("\n", $input);
$nb_triangles = 0;

foreach ($lines as $triangle) {
    preg_match_all("(\d+)", $triangle, $numbers);

    $values = $numbers[0];
    sort($values);

    if ((int) $values[0] + (int) $values[1] > (int) $values[2]) {
        $nb_triangles++;
    }
}

echo "Answer : {$nb_triangles}";