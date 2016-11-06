<?php
$dev=true;
ob_start();
if ($dev) {
    define('DB_SERVER', 'localhost:3307');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', '1234');
    define('DB_DATABASE', 'NYFS_SALES');
} else {
    define('DB_SERVER', 'localhost');
    define('DB_USERNAME', 'snake2209');
    define('DB_PASSWORD', 'pumas2209');
    define('DB_DATABASE', 'nyfs_sales');
}
$db = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}
?>