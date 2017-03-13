<?php
  $uri = $_SERVER["REQUEST_URI"];

  if (strstr($uri, "fast")) {
    fast();
  } else if (strstr($uri, "slow")) {
    $sec = 30;
    $uriEnd = strchr($uri, '/');
    if ($uriEnd != '/slow') {
      $sec = (int) substr($uriEnd, 6);
    }
    slow($sec);
  } else {
    echo "<p>Welcome to PHP</p>";
  }

  function fast() {
    echo "<p>fast</p>";
  }

  function slow($sec) {
    busy($sec);
    echo "<p>slow $sec s</p>";
  }

  function busy($sec) {
    $deadline = time() + $sec;
    $now = time();
    while ($now < $deadline) {
      $now = time();
    }
  }
?>
