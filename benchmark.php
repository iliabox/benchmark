<?php

ini_set('memory_limit', '1G');

function sha256(string $data): string {
    return hash('sha256', $data);
}

$start = microtime(true);

$array1 = [];
for ($i = 0; $i < 1000000; $i++) {
    $array1[$i] = sha256((string)$i);
}

$array2 = array_map(function(string $hash): string {
    return substr($hash, 1, -1);
}, $array1);

$finalHash = sha256(implode('', $array2));

echo "Final hash: " . $finalHash . "\n";

$end = microtime(true);
$duration = ($end - $start) * 1000;

echo "Execution time: " . round($duration) . " milliseconds\n";
