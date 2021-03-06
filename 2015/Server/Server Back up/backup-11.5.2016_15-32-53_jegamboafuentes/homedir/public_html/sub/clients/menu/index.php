<?php
ob_start();
include('../session.php');
include('../configurations.php');
$idClient = $login_session;
error_reporting(E_ALL);
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
        <link href="css/scrolling-nav.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->

    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">NYFS-Client</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden">
                            <a class="page-scroll" href="#page-top"></a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#about">Progress</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#services"><?php echo $idClient; ?></a>
                        </li>
                        <li>
                            <a href="../logout.php"><span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span> logout</a>
                        </li>
                    </ul>
                    <div></div>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>        
        <!-- Intro Section -->
        <section id="intro" class="intro-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1><?php echo $idClient; ?></h1>
                        <p><strong>Progress: </strong> You can see the progress of your system right here: </p>
                        <?php
                        $urlProgressHTML = $clientsPath."/clients/" . $idClient . "/main/index.html";
                        $urlProgressPHP = $clientsPath."/clients/" . $idClient . "/main/index.php";
                        $file_headersHTML = @get_headers($urlProgressHTML);
                        $file_headersPHP = @get_headers($urlProgressPHP);
                        if ($file_headersHTML[0] == 'HTTP/1.1 404 Not Found' && $file_headersPHP[0] == 'HTTP/1.1 404 Not Found') {
                            $clientWebPage=$clientsPath."/clients/progressclient/index.html";
                        } else {
                            if($file_headersPHP[0] == 'HTTP/1.1 404 Not Found'){
                                $clientWebPage=$urlProgressHTML;
                            }else{
                                $clientWebPage=$urlProgressPHP;
                            }
                            
                        }
                        ?>
                        <a class="btn btn-default page-scroll" href="<?php echo $clientWebPage;?>" target="_blank">click me</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="about" class="about-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Progress</h1>
                        Working in this part
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section id="services" class="services-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1><?php echo $idClient; ?></h1>
                    </div>
                    <div class="col-lg-12">
                        <h4>Documents: </h4>               
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        Title
                                    </th>
                                    <th class="text-center">
                                        File
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $iteratorTable = 0;
                                for ($iteratorTable; $iteratorTable < $numberOfFiles; $iteratorTable++) {
                                    echo "<tr>";
                                    echo "
                                    <td>
                                        <p>" . mysql_result($sqlQueryTitles, $iteratorTable) . "</p>
                                    </td>
                                    <td>
                                        <a href=\"" . mysql_result($sqlQueryPaths, $iteratorTable) . "\"><span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\"></span></a>
                                    </td>";
                                    echo"</tr>";
                                }
                                ?>
                            <a ></a>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </section>

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
    </body>
</html>
