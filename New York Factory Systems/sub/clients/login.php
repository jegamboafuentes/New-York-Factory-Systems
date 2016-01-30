<?php 
    session_start(); 
    error_reporting(E_ALL);
    require_once '../clients/bdconexion/sqlConnection.php'; //Requiere el archivo 'SqlConnection.php require_once 'SqlConnection.php'; //Requiere el archivo 'SqlConnection.php 
    class login //Crea la clase 'login' 
    { 
        public function __construct($usr,$inUsr,$inPss) //Crea la función '__construct' con el las tres variables.
        { 
            $this->Username=$usr; 
            $this->PostUser=$inUsr; 
            $this->PostPass=$inPss; 
        } 
        public function checkSession() //Crea la función 'checkSession()' 
        { 
            if(isset($this->Username)) //Si existe la variable 'Username': 
            { 
                header("Location: index.php"); //Redirige una carpeta atrás. O sea al index.php 
            } 
        } 
        public function checkForm() //Crea la función 'checkForm()' 
        { 
            if(!isset($this->PostUser)) //Si NO existe la variable 'PostUser': 
            { 
                header("Location: ../"); 
            } 
            if(!isset($this->PostPass)) 
            { 
                header("Location: ../"); 
            }    
        } 
    } 
    $check= new login($_SESSION['user'],$_POST['inUser'],$_POST['inPass']); //Se crea una nueva clase 'login' con los valores 'Username'=$_SESSION['user'] ; 'PostUser'=$_SESSION['inUser'] ; 'PostPass'=$_SESSION['inPass']
    $check-> checkSession(); //Se ejecuta la función 'checkSession()' 
    $check-> checkForm(); //Se ejecuta la función 'checkForm() 
    $link = mysql_connect("localhost", "snake22099", "pumas2209");
        if (!$link) {
            echo "<p>Could not connect to the server '" . "localhost" . "'</p>\n";
            echo mysql_error();
        }else{
            echo "<p>Successfully connected to the server '" . "localhost" . "'</p>\n";
        }
    $sqlSyntax= 'SELECT ID_CLIENT_CONTACT,PASSWORD FROM CLIENT_SECURITY WHERE ID_CLIENT_CONTACT = "'.$_POST['inUser'].'" AND PASSWORD = "'.$_POST['inPass'].'"'; //Se crea la sintaxis para la base de datos$sqlSyntax= 'SELECT user_username,user_password FROM users WHERE user_username = "'.$_POST['inUser'].'" AND user_password = "'.$_POST['inPass'].'"'; //Se crea la sintaxis para la base de datos
    $sqlQuery= mysql_query($sqlSyntax); //Se ejecuta el query de $sqlSyntax 
    $sqlSyntax2= 'SELECT ID_CLIENT FROM CLIENT_SECURITY WHERE ID_CLIENT_CONTACT = "'.$_POST['inUser'].'"';  //Se crea la siguiente sintaxis
    $sqlQuery2= mysql_query($sqlSyntax2); //Se ejecuta el segundo query 
    $sqlRow= mysql_num_rows($sqlQuery); //Se verifica el total de filas devueltas de $sqlQuery
    if($sqlRow==1) //Si el valor devuelto por $sqlRow es igual a 1: 
    { 
        while($resQry2= mysql_fetch_array($sqlQuery2)) //Mientras se lee el array y lo guarda en $resQry2 ejecutando el segundo query:
        { 
            $_SESSION['user']= $resQry2[0]; //Le asigna el valor contenido en la posición 0 del arrray a la variable de sesión 'user'
        } 
        header('Location: menu/index.php'); 
        $_SESSION['error']= 'Bienvenid@ '.$_SESSION['user'].''; //Le asigna a la variable de sesión un mensaje de bienvenida con el nombre del usuario
        $_SESSION['time']= time(); //Asigna el valor time() a la variable de sesión 'time' 
         
    } 
    else //Si el valor de filas devuelto es distinto de 1: 
    { 
        $_SESSION['error']= 'Usuario o contraseña incorrectos'; //Se le asigna un mensaje de error a la variable de sesión 'error'
        header('Location: ../../'); 
    } 

?>
