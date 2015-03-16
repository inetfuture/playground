<?php
// http://daylerees.com/php-namespaces-explained

namespace NS;

require 'aaron.php';

$aaron1 = new \NS\Aaron\AaronClass();
var_dump($aaron1);

$aaron2 = new Aaron\AaronClass();
var_dump($aaron2);

use NS\Aaron;
$aaron3 = new Aaron\AaronClass();
var_dump($aaron3);

use NS\Aaron\AaronClass;
$aaron4 = new AaronClass();
var_dump($aaron4);
?>
