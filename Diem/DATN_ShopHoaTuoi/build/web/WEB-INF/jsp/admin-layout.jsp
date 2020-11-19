
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    <head>
        
        <title> Admin SG-Rose</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <link rel="shortcut icon" href="assets/img/new.ico"/>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <!--     Fonts and icons     -->
        <script src="assets/js/page.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css"
              href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <!-- Material Kit CSS -->
        <link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
    </head>

    <body class="dark-edition">
        <div class="wrapper ">
            <div class="sidebar" data-color="purple" data-background-color="black">
                <div class="logo">

                    <a href="#" class="simple-text logo-normal">
                        <img src="assets/img/new.png">
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li class="nav-item active  ">
                            <a class="nav-link" href="admin/dashboardmanage.htm">
                                <i class="material-icons">dashboard</i>
                                <p>Thông tin</p>
                            </a>
                        </li>   
                        <li class="nav-item active  ">
                            <a class="nav-link" href="admin/productsmanage.htm">
                                <i class="material-icons">local_florist</i>
                                <p>Quản lý sản phẩm</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="admin/staffmanage.htm">
                                <i class="material-icons">face</i>
                                <p>Quản lý nhân viên</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="admin/usersmanage.htm">
                                <i class="material-icons">perm_identity</i>
                                <p>Quản lý tài khoản</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="admin/ordersmanage.htm">
                                <i class="material-icons">library_books</i>
                                <p>Quản lý hóa đơn</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="admin/company.htm">
                                <i class="material-icons">how_to_reg</i>
                                <p>Quản lý đối tác</p>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <a class="navbar-brand" href="admin/dashboardmanage.htm">Admin Manage</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="material-icons">person</i>Tên Tài khoản
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="material-icons">exit_to_app</i>
                                    </a>
                                </li>
                                <!-- Ngay chỗ này edit cái tên người dùng với cái nút login -->
                            </ul>
                        </div>
                    </div>
                </nav>
                

                <jsp:include page="${param.view}"/>

                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="float-left">
                            <ul>
                                <li>
                                    <a href="#">
                                        SG-ROSE
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright float-right">
                            &copy;
                            <script>
                                document.write(new Date().getFullYear())
                            </script>, made with <i class="material-icons">favorite</i> by
                            <a href="https://www.creative-tim.com" target="_blank">SG-ROSE</a>
                        </div>
                        <!-- your footer here -->
                    </div>
                </footer>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap-material-design.min.js"></script>
        <script src="https://unpkg.com/default-passive-events"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!--  Google Maps Plugin    -->
        <!-- Chartist JS -->
        <script src="./assets/js/plugins/chartist.min.js"></script>
        <!--  Notifications Plugin    -->
        <script src="./assets/js/plugins/bootstrap-notify.js"></script>
        <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="./assets/js/material-dashboard.js?v=2.1.0"></script>
        <!-- Material Dashboard DEMO methods, don't include it in your project! -->
        <script src="./assets/demo/demo.js"></script>

    </body>

</html>
