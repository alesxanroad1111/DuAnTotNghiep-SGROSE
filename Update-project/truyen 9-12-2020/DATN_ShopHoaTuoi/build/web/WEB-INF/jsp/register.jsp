
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <a href="user/home"><img src="csslogin/images/img-01.png" alt="IMG" height="200"/></a>
                    </div>
                    
                    <form:form class="form-horizontal" action="reg" modelAttribute="user" method="POST">
                        <span class="login100-form-title">
                            SG-ROSÉ REGISTER
                        </span>
                        ${message}
                        <div class="wrap-input100 validate-input" data-validate = "Email is required">
                            <form:input path="email" type="email" id="email" class="input100" name="email" placeholder="Email" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Number is required">
                            <form:input path="phone" type="text" id="phoneNumber" placeholder="Phone Number" class="input100"/>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <form:input path="password" type="password" id="password" class="input100" placeholder="Password" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input type="password" id="password" class="input100" name="repassword" placeholder="Enter the Password" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="btn-success btn" >
                                Register
                            </button>
                            <a class=" btn" href="login">Cancel</a> 
                        </div>
                    </form:form>
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

