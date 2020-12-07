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
                                <a href="home.htm"><img src="images/logo/new.png" alt="Logo_shop"
                                                        /></a>
                            </div>

                        </div>
                        <div class="col-md-8 clearfix">
                            <div class="shop-menu mainmenu clearfix pull-right">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li class="dropdown"><a href="user/profile/${user.id}.htm" name="user"><i class="fa fa-user"></i> ${user.name}</a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="user/profile/${user.id}.htm">Thông Tin Cá Nhân</a></li>
                                            <li><a href="user/purchased.htm">Lịch Sử Mua Hàng</a></li>
                                            <li><a href="#">Đổi Mật Khẩu</a></li>
                                            <li><a href="logoff.htm">Đăng Xuất</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="user/checkouts.htm"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="user/cart.htm?yeucau="><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="login.htm"><i class="fa fa-lock"></i> Login</a></li>
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
                                    <li><a href="home.htm">Home</a></li>
                                    <li><a href="home/5.htm">Hoa Sinh Nhật</a></li>
                                    <li><a href="home/4.htm">Hoa Khai Trương</a></li>
                                    <li class="dropdown"><a href="#">Chủ đề hoa<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <c:forEach var="type" items="${typef}">
                                                <li><a href="home/${type.id}.htm">${type.name}</a></li>
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

        <footer id="footer">
            <!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>SG</span>-Rose</h2>
                                <p>Đây là shop hoa tươi không cần tưới</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe1.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Doanh Ngọc Diễm</p>
                                    <h2>20/10/2020</h2>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/ceo/ctruyen.jpg" alt="" style="width: 40px;" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Trần Công Truyền</p>
                                    <h2>20/10/2020</h2>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe2.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Nguyễn Đức Hòa</p>
                                    <h2>20/10/2020</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe3.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Hồ Phi Long</p>
                                    <h2>20/10/2020</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe4.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Trần Đại Hưng</p>
                                    <h2>20/10/2020</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62706.19126010514!2d106.66183064710812!3d10.800821146647111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7649fa48af2a40ef!2zVlDEkEQgQ8O0bmcgdHkgUGjDoXQgdHJp4buDbiBQaOG6p24gbeG7gW0gUXVhbmcgVHJ1bmc!5e0!3m2!1svi!2s!4v1602660139339!5m2!1svi!2s"
                                    height="250px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                                    tabindex="0"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Dịch vụ</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Hỗ trợ trực tuyến</a></li>
                                    <li><a href="">Về chúng tôi</a></li>
                                    <li><a href="">Trạng thái đặt hàng</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Tiện ích </h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Các loại hoa</a></li>
                                    <li><a href="">Quà tặng</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Chính sách</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Điều khoản sử dụng</a></li>
                                    <li><a href="">Chính sách bảo mật</a></li>
                                    <li><a href="">Chính sách hoàn tiền</a></li>
                                    <li><a href="">Hệ thống thanh toán</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About SG-ROSE</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Thông tin về cửa hàng</a></li>
                                    <li><a href="">Việc làm</a></li>
                                    <li><a href="">Vị trí cửa hàngs</a></li>
                                    <li><a href="">Chương trình liên kết</a></li>
                                    <li><a href="">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="single-widget">
                                <h2>Liên hệ SG-Rose</h2>
                                <form action="#" class="searchform">
                                    <input type="text" placeholder="Your email address" />
                                    <button type="submit" class="btn btn-default"><i
                                            class="fa fa-arrow-circle-o-right"></i></button>
                                    <p>Hãy gửi mail để chúng tôi phản hồi <br> sớm nhất có thể</p>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container ">
                    <div class="text-center">

                        <p class="pull-left">Copyright © 2020 SG-ROSE Inc. All rights reserved.</p>

                    </div>
                </div>
            </div>

        </footer>

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

                            value: "user/product/${f.id}.htm",
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
