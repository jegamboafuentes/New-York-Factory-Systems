<?php
   include('/bdconexion/sqlConnection.php');
   session_start();
   
   $user_check = $_SESSION['login_user'];
   
   $sql = "SELECT ID_CLIENT FROM CLIENT_SECURITY WHERE ID_CLIENT_CONTACT = '$user_check'";
   $ses_sql = mysqli_query($db,$sql);
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['ID_CLIENT'];
   
   $enrque = "Enrique";
   
   if(!isset($_SESSION['login_user'])){
      header("location:index.php");
   }
?>