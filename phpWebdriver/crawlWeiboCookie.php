<?php
require 'vendor/autoload.php';

require './secrets.php';

$driver = RemoteWebDriver::create('http://localhost:4444/wd/hub', DesiredCapabilities::chrome());
$driver->get('http://weibo.com/login');

$inputUsername = WebDriverBy::cssSelector('[node-type="username"]');
$inputPassword = WebDriverBy::cssSelector('[node-type="password"]');
$btnSubmit = WebDriverBy::cssSelector('.W_login_form [node-type="submitBtn"]');
$divHomeTabs = WebDriverBy::cssSelector('.tab_wrap');

$driver->wait(30, 500)->until(WebDriverExpectedCondition::elementToBeClickable($inputUsername));
$driver->findElement($inputUsername)->sendKeys($secrets['username']);
$driver->findElement($inputPassword)->sendKeys($secrets['password']);

$driver->wait(30, 500)->until(WebDriverExpectedCondition::elementToBeClickable($btnSubmit));
$driver->findElement($btnSubmit)->click();

$driver->wait(30, 500)->until(WebDriverExpectedCondition::presenceOfElementLocated($divHomeTabs));
$cookies = $driver->manage()->getCookies();

$cookieKVPairs = array();
foreach ($cookies as $cookie) {
  array_push($cookieKVPairs, $cookie['name'] . '=' . $cookie['value']);
}

$cookiesStr = join('; ', $cookieKVPairs);
echo $cookiesStr;
?>
