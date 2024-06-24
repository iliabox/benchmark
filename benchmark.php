<?php

$start = microtime(true);

$array = [];
for ($i = 0; $i < 1000000; $i++) {
    $array[$i] = hash('sha256', strval($i));
}

$end = microtime(true);
echo "Execution time: " . (($end - $start) * 1000) . " milliseconds\n";
