<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login SG-Rose</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="shortcut icon" href="images/icon/new.ico"/>
        <!--===============================================================================================-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="http://code.jquery.com/jquery-2.1.0.js"></script>

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
        <script>
            $(function () {
                $("#progressBar").css("visibility", "visible");
                $("#send_btn").attr("disabled", "disabled");




                setTimeout(function () {
                    $("#send_btn").removeAttr("disabled");
                    $("#send_btn").css("background-color", "#f22112");
                    $("#send_btn").css("cursor", "pointer");
                    $("#progressBar").css("visibility", "hidden");
                }, 60000);
                $("#send_btn").css("background-color", "gray");
                $("#send_btn").css("cursor", "default");



            });
            var timeleft = 60;
            var downloadTimer = setInterval(function () {
                if (timeleft <= 0) {
                    clearInterval(downloadTimer);
                }
                document.getElementById("progressBar").value = 60 - timeleft;
                timeleft -= 1;
            }, 1000);
        </script>
    </head>
    <body>
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

                    <form class="login100-form " action="confirmed-codeforgot" method="post">
                        <span class="login100-form-title">
                            STEP 2: Confirm Code
                        </span>
                        <span class="text-warning">Chúng tôi vừa gửi một mã xác minh đến hộp thư email <span class="text-primary">${emailforgotpass}</span>. Xin vui lòng kiểm tra hộp thư của bạn.</span>
                        <style>
                            .flexContainer {
                                display: flex;
                            }

                            .inputField {
                                flex: 1;
                            }
                            .input10 {
                                border-radius: 50px;
                                width: 100px;
                                background: #f22112;
                                color: #fff;
                                font-weight: bold;
                                cursor: pointer;
                            }

                        </style>
                        <div class="wrap-input100 validate-input flexContainer">
                            <input name="code" class="input100 inputField" placeholder="Mã xác nhận">

                            <input class="input10" type="submit" name="btnResend" id="send_btn" value="Gửi lại">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>
                        <progress value="0" max="60" id="progressBar"></progress>
                        <span class="text-danger">${message}</span>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" >
                                Tiếp tục
                            </button>
                        </div>
                        <div class="text-center p-t-136">
                            <a class="txt2" href="login">
                                Đăng nhập
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
