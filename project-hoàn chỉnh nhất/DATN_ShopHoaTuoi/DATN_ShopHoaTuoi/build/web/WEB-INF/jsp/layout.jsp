<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SG-Rose</title>
        <link rel="shortcut icon" href="images/icon/new.ico"/>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
        <script href="http://code.jquery.com/jquery-1.11.1.min.js"></script>

        <link href = "css/jquery-ui.css" rel = "stylesheet">

    </head>
    <body>
        <header id="header">
            <!--header-->
            <div class="header_top">
                <!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href=""><i class="fa fa-phone"></i> +84 829 069 648</a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> sgrose@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
                                    <li><a href="https://google.com/"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/header_top-->

            <div class="header-middle">
                <!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 clearfix">
                            <div class="logo pull-left">
                                <a href="home"><img src="images/logo/new.png" alt="Logo_shop"
                                                        /></a>
                            </div>

                        </div>
                        <div class="col-md-8 clearfix">
                            <div class="shop-menu mainmenu clearfix pull-right">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li class="dropdown"><a href="user/profile/${user.id}" name="user"><i class="fa fa-user"></i> ${user.name}</a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="user/profile/${user.id}">Thông Tin Cá Nhân</a></li>
                                            <li><a href="user/purchased">Lịch Sử Mua Hàng</a></li>
                                            <li><a href="#">Đổi Mật Khẩu</a></li>
                                            <li><a href="logoff">Đăng Xuất</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="user/checkouts"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="user/cart?yeucau="><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="login"><i class="fa fa-lock"></i> Login</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/header-middle-->

            <div class="header-bottom">
                <!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse"
                                        data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="home">Home</a></li>
                                    <li><a href="home/5">Hoa Sinh Nhật</a></li>
                                    <li><a href="home/4">Hoa Khai Trương</a></li>
                                    <li class="dropdown"><a href="#">Chủ đề hoa<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <c:forEach var="type" items="${typef}">
                                                <li><a href="home/${type.id}">${type.name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="ui-widget search_box pull-right">
                                <input id="tags" type="text" style="width: 355px; background-position: 330px;" placeholder="Search">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/header-bottom-->
        </header>
        <!--/header-->


        <jsp:include page="${param.view}"/>

        <footer class="new_footer_area bg_color">
            <div class="new_footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="f_widget company_widget wow fadeInLeft" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                                <h3 class="f-title f_600 t_color f_size_18">SG-Rose</h3>
                                <p>Hãy liên hệ với chúng tôi qua mail:</p>
                                <form action="#" class="f_subscribe_two mailchimp" method="post" novalidate="true" _lpchecked="1">
                                    <input type="text" name="EMAIL" class="form-control memail" placeholder="Email">
                                    <button class="btn btn_get btn_get_two" type="submit">Liên hệ</button>
                                    <p class="mchimp-errmessage" style="display: none;"></p>
                                    <p class="mchimp-sucmessage" style="display: none;"></p>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInLeft;">
                                <h3 class="f-title f_600 t_color f_size_18">Chính sách</h3>
                                <ul class="list-unstyled f_list">
                                    <li><a href="">Điều khoản sử dụng</a></li>
                                    <li><a href="">Chính sách bảo mật</a></li>
                                    <li><a href="">Chính sách hoàn tiền</a></li>
                                    <li><a href="">Hệ thống thanh toán</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInLeft;">
                                <h3 class="f-title f_600 t_color f_size_18">About</h3>
                                <ul class="list-unstyled f_list">
                                    <li><a href="">Thông tin về cửa hàng</a></li>
                                    <li><a href="">Việc làm</a></li>
                                    <li><a href="">Vị trí cửa hàng</a></li>
                                    <li><a href="">Chương trình liên kết</a></li>
                                    <li><a href="">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="f_widget social-widget pl_70 wow fadeInLeft" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInLeft;">
                                <h3 class="f-title f_600 t_color f_size_18">Team work</h3>
                                <div class="f_social_icon">
                                    <a href="#" class="fa fa-facebook-square"></a>
                                    <a href="#" class="fa fa-instagram"></a>
                                    <a href="#" class="fa fa-youtube-play"></a>
                                    <a href="#" class="fa fa-pinterest"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer_bg">
                    <div class="footer_bg_one"></div>
                    <div class="footer_bg_two"></div>
                </div>
            </div>
            <div class="footer_bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-sm-7">
                            <p class="mb-0 f_400">© SG-Rose Inc.. 2020 All rights reserved.</p>
                        </div>
                        <div class="col-lg-6 col-sm-5 text-right">
                            <p>Made with <i class="icon_heart"></i> in <a href="#">SG-ROSE</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <style>
            body {
                background: #fbfbfd;
            }

            .new_footer_area {
                background: #fbfbfd;
            }


            .new_footer_top {
                padding: 120px 0px 270px;
                position: relative;
                overflow-x: hidden;
            }
            .new_footer_area .footer_bottom {
                padding-top: 5px;
                padding-bottom: 50px;
            }
            .footer_bottom {
                font-size: 14px;
                font-weight: 300;
                line-height: 20px;
                color: #7f88a6;
                padding: 27px 0px;
            }
            .new_footer_top .company_widget p {
                font-size: 16px;
                font-weight: 300;
                line-height: 28px;
                color: #6a7695;
                margin-bottom: 20px;
            }
            .new_footer_top .company_widget .f_subscribe_two .btn_get {
                border-width: 1px;
                margin-top: 20px;
            }
            .btn_get_two:hover {
                background: transparent;
                color: #5e2ced;
            }
            .btn_get:hover {
                color: #fff;
                background: #6754e2;
                border-color: #6754e2;
                -webkit-box-shadow: none;
                box-shadow: none;
            }
            a:hover, a:focus, .btn:hover, .btn:focus, button:hover, button:focus {
                text-decoration: none;
                outline: none;
            }



            .new_footer_top .f_widget.about-widget .f_list li a:hover {
                color: #5e2ced;
            }
            .new_footer_top .f_widget.about-widget .f_list li {
                margin-bottom: 11px;
            }
            .f_widget.about-widget .f_list li:last-child {
                margin-bottom: 0px;
            }
            .f_widget.about-widget .f_list li {
                margin-bottom: 15px;
            }
            .f_widget.about-widget .f_list {
                margin-bottom: 0px;
            }
            .new_footer_top .f_social_icon a {
                width: 44px;
                height: 44px;
                line-height: 43px;
                background: transparent;
                border: 1px solid #e2e2eb;
                font-size: 24px;
            }
            .f_social_icon a {
                width: 46px;
                height: 46px;
                border-radius: 50%;
                font-size: 14px;
                line-height: 45px;
                color: #858da8;
                display: inline-block;
                background: #ebeef5;
                text-align: center;
                -webkit-transition: all 0.2s linear;
                -o-transition: all 0.2s linear;
                transition: all 0.2s linear;
            }
            .ti-facebook:before {
                content: "\e741";
            }
            .ti-twitter-alt:before {
                content: "\e74b";
            }
            .ti-vimeo-alt:before {
                content: "\e74a";
            }
            .ti-pinterest:before {
                content: "\e731";
            }

            .btn_get_two {
                -webkit-box-shadow: none;
                box-shadow: none;
                background: #5e2ced;
                border-color: #5e2ced;
                color: #fff;
            }

            .btn_get_two:hover {
                background: transparent;
                color: #5e2ced;
            }

            .new_footer_top .f_social_icon a:hover {
                background: #5e2ced;
                border-color: #5e2ced;
                color:white;
            }
            .new_footer_top .f_social_icon a + a {
                margin-left: 4px;
            }
            .new_footer_top .f-title {
                margin-bottom: 30px;
                color: #263b5e;
            }
            .f_600 {
                font-weight: 600;
            }
            .f_size_18 {
                font-size: 18px;
            }
            h1, h2, h3, h4, h5, h6 {
                color: #4b505e;
            }
            .new_footer_top .f_widget.about-widget .f_list li a {
                color: #6a7695;
            }


            .new_footer_top .footer_bg {
                position: absolute;
                bottom: 0;
                background: url("http://droitthemes.com/html/saasland/img/seo/footer_bg.png") no-repeat scroll center 0;
                width: 100%;
                height: 266px;
            }

            .new_footer_top .footer_bg .footer_bg_one {
                background: url("https://1.bp.blogspot.com/-mvKUJFGEc-k/XclCOUSvCnI/AAAAAAAAUAE/jnBSf6Fe5_8tjjlKrunLBXwceSNvPcp3wCLcBGAsYHQ/s1600/volks.gif") no-repeat center center;
                width: 330px;
                height: 105px;
                background-size:100%;
                position: absolute;
                bottom: 0;
                left: 30%;
                -webkit-animation: myfirst 22s linear infinite;
                animation: myfirst 22s linear infinite;
            }

            .new_footer_top .footer_bg .footer_bg_two {
                background: url("https://1.bp.blogspot.com/-hjgfxUW1o1g/Xck--XOdlxI/AAAAAAAAT_4/JWYFJl83usgRFMvRfoKkSDGd--_Sv04UQCLcBGAsYHQ/s1600/cyclist.gif") no-repeat center center;
                width: 88px;
                height: 100px;
                background-size:100%;
                bottom: 0;
                left: 38%;
                position: absolute;
                -webkit-animation: myfirst 30s linear infinite;
                animation: myfirst 30s linear infinite;
            }



            @-moz-keyframes myfirst {
                0% {
                    left: -25%;
                }
                100% {
                    left: 100%;
                }
            }

            @-webkit-keyframes myfirst {
                0% {
                    left: -25%;
                }
                100% {
                    left: 100%;
                }
            }

            @keyframes myfirst {
                0% {
                    left: -25%;
                }
                100% {
                    left: 100%;
                }
            }

            /*************footer End*****************/


        </style>

        <script src="js/jquery.js"></script>
        <script src="js/pagination.js"></script>
        <script src="js/pagination.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#tags").autocomplete({
                    source: [
            <c:forEach var="f" items="${httpflower}">
                        {

                            value: "user/product/${f.id}",
                            label: "${f.name}",
                            img: "images/hoa/${f.image}",
                            label2: "Giá: <fmt:setLocale value = 'en_US'/><fmt:formatNumber value = '${f.price}' type = 'number'/>₫"
                        },
            </c:forEach>
                    ],
                    select: function (event, ui) {
                        window.location.href = ui.item.value;
                    }

                }).autocomplete("instance")._renderItem = function (ul, item) {
                    return $("<li><div class='row' style='transition: 0.3s;'><div class='col-sm-2'><img src='" + item.img + "'></div><span class='col-sm-10 ten' style='font-weight: bold; font-size: 15px;' >" + item.label + "</span><span class='col-sm-10'>" + item.label2 + "</span></div></li>").appendTo(ul);
                };

            });
        </script>
    </body>
</html>
