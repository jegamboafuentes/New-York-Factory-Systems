<?php
include("./sqlConnection.php");
error_reporting(E_ALL);
echo "TEST CONNECION - ";
echo "HOLA - ";
if($db){
    echo " testCOnnection.php sayd: Yes i have the connection";
}else{
    echo " testCOnnection.php sayd: I do NOT have the connection";
}
$myusername = mysqli_real_escape_string($db,"danielle_ettl@yahoo.com");
$mypassword = mysqli_real_escape_string($db,"12345"); 
$sqlLow="select id_client from client_security where id_client_contact = '$myusername' AND PASSWORD = '$mypassword';";
$sqlGood="SELECT ID_CLIENT FROM CLIENT_SECURITY WHERE ID_CLIENT_CONTACT = '$myusername' AND PASSWORD = '$mypassword';";
echo "Query: ".$sqlLow;
$result = mysqli_query($db, $sqlLow);
$row = mysqli_fetch_assoc($result);
//$result = mysql_query($db,$sqlGood);
echo "Result: ".$row['id_client'];
echo " - - - ";
?>

