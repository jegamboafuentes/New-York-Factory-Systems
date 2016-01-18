<?php
    session_abort();
    $_SESSION['logout'] = 'logout';
    header('Location: index.php');
?>