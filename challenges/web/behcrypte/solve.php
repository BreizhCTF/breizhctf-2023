<?php

$i = 0;
$prefix = 'BreizhCTF-2023-pwd-702';
$flag;
while (!isset($flag)) {
    $try = $prefix . strval($i);
    $h = hash('gost', $try);
    if (substr($h, 0, 4) === "d400") {
        $flag = $try;
    }
    $i++;
}

echo $flag . PHP_EOL; 

echo file_get_contents('https://behcrypte.ctf.bzh', false, stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/x-www-form-urlencoded',
        'content' => "flag=$try"
    ]
])) . PHP_EOL;
