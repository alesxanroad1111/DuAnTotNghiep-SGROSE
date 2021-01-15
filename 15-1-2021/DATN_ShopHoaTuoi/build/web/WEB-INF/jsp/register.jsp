
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
<style type="text/css">
            .snow-container{position:fixed;width:100%;max-width:100%;z-index:99999;pointer-events:none;overflow:hidden;top:0;height:100%}
            .snow{display:block;position:absolute;z-index:2;top:0;right:0;bottom:0;left:0;pointer-events:none;-webkit-transform:translate3d(0,-100%,0);transform:translate3d(0,-100%,0);-webkit-animation:snow linear infinite;animation:snow linear infinite}
            .snow.foreground{background-image:url("https://dl6rt3mwcjzxg.cloudfront.net/assets/snow/snow-large-075d267ecbc42e3564c8ed43516dd557.png");-webkit-animation-duration:15s;animation-duration:10s}
            .snow.foreground.layered{-webkit-animation-delay:7.5s;animation-delay:7.5s}
            .snow.middleground{background-image:url(https://dl6rt3mwcjzxg.cloudfront.net/assets/snow/snow-medium-0b8a5e0732315b68e1f54185be7a1ad9.png);-webkit-animation-duration:20s;animation-duration:15s}
            .snow.middleground.layered{-webkit-animation-delay:10s;animation-delay:10s}
            .snow.background{background-image:url(https://dl6rt3mwcjzxg.cloudfront.net/assets/snow/snow-small-1ecd03b1fce08c24e064ff8c0a72c519.png);-webkit-animation-duration:25s;animation-duration:20s}
            .snow.background.layered{-webkit-animation-delay:12.5s;animation-delay:12.5s}
            @-webkit-keyframes snow{0%{-webkit-transform:translate3d(0,-100%,0);transform:translate3d(0,-100%,0)}100%{-webkit-transform:translate3d(5%,100%,0);transform:translate3d(5%,100%,0)}}
            @keyframes snow{0%{-webkit-transform:translate3d(0,-100%,0);transform:translate3d(0,-100%,0)}100%{-webkit-transform:translate3d(5%,100%,0);transform:translate3d(5%,100%,0)}}
        </style>
        <div class='snow-container'>
            <div class='snow foreground'></div>
            <div class='snow foreground layered'></div>
            <div class='snow middleground'></div>
            <div class='snow middleground layered'></div>
            <div class='snow background'></div>
            <div class='snow background layered'></div>
        </div>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <a href="home"><img src="csslogin/images/img-01.png" alt="IMG" height="200"/></a>
                    </div>
                    
                    <form:form class="form-horizontal" action="reg" modelAttribute="user" method="POST">
                        <span class="login100-form-title">
                            STEP 1: REGISTER
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

