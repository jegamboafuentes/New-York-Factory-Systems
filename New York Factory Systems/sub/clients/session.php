<?php
    ob_start();
   include('/bdconexion/sqlConnection.php');
   session_start();
   $user_check = $_SESSION['login_user'];
   $sql = "select id_client from client_security where id_client_contact = '$user_check'";
   $ses_sql = mysqli_query($db,$sql);
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   $login_session = $row['id_client'];
   if(!isset($_SESSION['login_user'])){
      header("location:index.php");
   }
?>