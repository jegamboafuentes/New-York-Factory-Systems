<?php
ob_start();
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'snake2209');
define('DB_PASSWORD', 'pumas2209');
define('DB_DATABASE', 'nyfs_sales');
$db = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if (!$db) {
    die("sqlConnection.php Said: Connection failed: " . mysqli_connect_error());
}
echo "sqlConnection.php Said: Connected successfully:";
?>