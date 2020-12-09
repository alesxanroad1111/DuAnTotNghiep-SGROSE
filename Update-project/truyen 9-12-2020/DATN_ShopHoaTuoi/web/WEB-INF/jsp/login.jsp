<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login SG-Rose</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="shortcut icon" href="images/icon/new.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="csslogin/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="csslogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="csslogin/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="csslogin/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="csslogin/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="csslogin/css/util.css">
        <link rel="stylesheet" type="text/css" href="csslogin/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <a href="home"><img src="csslogin/images/img-01.png" alt="IMG" height="200"/></a>
                    </div>
                    <form class="login100-form " action="login" method="post">
                        <span class="login100-form-title">
                            Member SG-ROSE Login
                        </span>
                        
                        <div class="wrap-input100 validate-input" data-validate = "Email is required">
                            <input class="input100"  name="id" type="text" id="inputEmail" placeholder="Email" autofocus required>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" name="password" type="password" id="inputPassword"  placeholder="Password" required>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <span class="text-danger">${message}</span>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" >
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Forgot
                            </span>
                            <a class="txt2" href="#">
                                Username / Password?
                            </a>
                        </div>

                        <div class="text-center p-t-136">
                            <a class="txt2" href="register">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>




        <!--===============================================================================================-->	
        <script src="csslogin/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="csslogin/vendor/bootstrap/js/popper.js"></script>
        <script src="csslogin/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="csslogin/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="csslogin/vendor/tilt/tilt.jquery.min.js"></script>
        <script >
            $('.js-tilt').tilt({
                scale: 1.1
            })
        </script>
        <!--===============================================================================================-->
        <script src="csslogin/js/main.js"></script>

    </body>
</html>