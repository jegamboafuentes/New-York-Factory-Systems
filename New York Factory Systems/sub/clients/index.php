<?php
session_start(); //Esto inicia la sesión 
if (isset($_SESSION['user'])) { //Si existe la variable de sesión 'user': 
    $_SESSION['time'] = time(); //Se crea la variable de sesión 'time' con el valor de time() (ejemplo: 1339168896)
    if (isset($_SESSION['time'])) { //Si existe la variable de sesión 'time': 
        $timeNow = time(); //Se asigna el valor de time() (ejemplo: 1339168963) a la variable timeNow
        $timeCount = $timeNow - $_SESSION['time']; //Se le asigna a la variable timeCount el valor de la variable timeNow menos la variable de sesión 'time' (1339168963 - 1339168896 = 67 segundos)

        if ($timeCount > 1200) { //Si el valor de la variable timeCount es superior a 1200 (segundos, 20 minutos): 
            unset($_SESSION['user']); //Se destruye el valor de la variable de sesión 'user'
            $_SESSION['error'] = 'Su sesion ha expirado. Ingrese nuevamente.'; //Se le asigna un mensaje de error a la variable de sesión 'error'
        }
    }
}
if (isset($_SESSION['error'])) { //Si existe la variable de sesión 'error': 
    if ($_SESSION['error'] != 'Bienvenid@ '.$_SESSION['user'].'') {
        echo '<div class="alert alert-danger text-center" role="alert">' . $_SESSION['error'] . '</div>';
    }
    unset($_SESSION['error']); //Destruye la variable de sesión 'error' 
}
$_SESSION['logout'];
if ( isset($_SESSION['user']) && $_SESSION['logout']=="logout" ) { //Si existe la variable de sesión 'user' 
    $_SESSION['time'] = time(); //Se establece el valor time() de la variable de sesión 'time'. 
    header('Location: menu/index.php'); //Redirecciona a la carpeta 'home' 
} else { //si no existe la variable de sesión 'user' muestra el html siguiente: 
    ?> 
    <!DOCTYPE html>
    <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>NYFS - Clients</title>

            <!-- Bootstrap Core CSS -->
            <link href="css/bootstrap.min.css" rel="stylesheet">

            <!-- Custom CSS -->
            <style>
                body {
                    padding-top: 70px;
                }
            </style>

            <script type="text/javascript" src="menu/js/loginValidation.jss"></script> 
        </head>

        <body>

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Login</a>
                    </div>
                </div>
                <!-- /.container -->
            </nav>

            <!-- Page Content -->
            <div class="container">

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>New York Factory Systems</h1>
                        <p class="lead">If you started the process as a client please login.</p>
                        <p>NYFS sent you an email with the data for login.</p>
                        <ul class="list-unstyled">
                            <form action="login.php" method="POST" id="loginForm" data-toggle="validator" role="form">
                                <div class="form-group">
                                    <label for="inputEmail" class="control-label">Email</label>
                                    <input type="email" class="form-control" id="inUser" name="inUser" placeholder="Email" data-error="Email address is invalid" required>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="control-label">Password</label>
                                    <input type="password" class="form-control" id="inPass" name="inPass" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>

                        </ul>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->

            <!-- jQuery Version 1.11.1 -->
            <script src="js/jquery.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>

        </body>

    </html>

<?php } ?> 
