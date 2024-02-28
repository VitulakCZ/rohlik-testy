<?php

start:
$x = readline("Kolik rohlíků: ");
if (!is_numeric($x)) {
    echo "Jsi kokot!\n";
    goto start;
}

middle:
$y = readline("Kolik zaplatíš: ");
if (!is_numeric($y)) {
    echo "Jsi kokot!\n";
    goto middle;
}

if ($y >= $x * 3) {
    echo $x . "\n";
    goto end;
}

ende:
$z = strtoupper(readline("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: "));
if ($z == "Z")
    goto start;
elseif ($z == "C")
    goto middle;
elseif ($z == "E")
    goto end;
else {
    echo "Jsi kokot!\n";
    goto ende;
}
echo $line . "\n";
end: