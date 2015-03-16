<?php
function __autoload($className) {
  include $className . 'Class.php';
}

$test = new Test();
var_dump($test);

// hell();
?>
