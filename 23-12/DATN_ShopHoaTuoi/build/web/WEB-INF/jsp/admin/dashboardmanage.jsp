<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="content">
    <div class="row">
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">local_florist</i>
                    </div>
                    <p class="card-category">Tổng sản phẩm</p>
                    <h3 class="card-title"><strong>+</strong>${totalflower}
                    </h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/flower/index" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-primary card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">event_note</i>
                    </div>
                    <p class="card-category">Tổng hóa đơn</p>
                    <h3 class="card-title"><strong>+</strong>${totalbill}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/order/index" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 ">
            <div class="card card-stats ">
                <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">how_to_reg</i>
                    </div>
                    <p class="card-category">Tổng nhân viên</p>
                    <h3 class="card-title"><strong>+</strong>${totalstaff}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/staff/index" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">business</i>
                    </div>
                    <p class="card-category">Đối tác</p>
                    <h3 class="card-title">+${totalcompany}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/company" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!--    <div class="row">
        <div class="col-xl-4 col-lg-12">
            <div class="card card-chart">
                <div class="card-header card-header-success">
                    <div class="ct-chart" id="dailySalesChart"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Daily Sales</h4>
                    <p class="card-category">
                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">access_time</i> updated 4 minutes ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-12">
            <div class="card card-chart">
                <div class="card-header card-header-warning">
                    <div class="ct-chart" id="websiteViewsChart"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Email Subscriptions</h4>
                    <p class="card-category">Last Campaign Performance</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-12">
            <div class="card card-chart">
                <div class="card-header card-header-danger">
                    <div class="ct-chart" id="completedTasksChart"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Completed Tasks</h4>
                    <p class="card-category">Last Campaign Performance</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                    </div>
                </div>
            </div>
        </div>
    </div>-->
    
    <div class="row">
        <div class="col-lg-6 col-md-12">
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
            <script type="text/javascript">
                google.load("visualization", "1", {packages: ["corechart"]});
                google.setOnLoadCallback(drawChart);
                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Loại', 'Tổng giá trị'],
                <c:forEach var="rp" items="${reports}">
                        ['${rp.group}', ${rp.count}],
                </c:forEach>
                    ]);
                    var options = {
                        title: 'Thống kê thông tin hàng hóa',
                        is3D: true,
                 
                    };
                    var chart = new
                            google.visualization.PieChart(document.getElementById('piechart_3d1'));
                    chart.draw(data, options);
                }
            </script>
            <div id="piechart_3d1" style="width: 600px; height: 500px; "></div>
        </div>
        <div class="col-lg-6 col-md-12">
            <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Ngày', 'Tổng tiền'],
            <c:forEach var="ro" items="${reportorders}">
                    ['${ro.group}', ${ro.sum}],
            </c:forEach>
                ]);
                var options = {
                    title: 'Thống kê thông doanh thu',
                    is3D: true,

//                    backgroundColor: {
//                        fill: '#1a2035'
//                     
//                    },
                };
                var chart = new
                        google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
        <div id="piechart_3d" style="width: 600px; height: 500px; "></div>
        </div>
    </div>
<div class="row" style="height: 240px">
    
</div>
<!--<div class="row">
        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Thành viên SG-Rose</h4>
                    <p class="card-category">Chi tiết</p>
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-hover">
                        <thead class="text-warning">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Task</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Doanh Ngọc Diễm</td>
                                <td><span class="badge badge-pill badge-success">Nhóm trưởng</span></td>
                                <td>FullStack</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Trần Công Truyền</td>
                                <td><span class="badge badge-pill badge-warning">Scrum master</span></td>
                                <td>FullStack</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Nguyễn Đức Hòa</td>
                                <td><span class="badge badge-pill badge-info">Thành viên</span></td>
                                <td>Back-end</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Hồ Phi Long</td>
                                <td><span class="badge badge-pill badge-info">Thành viên</span></td>
                                <td>Front-end</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Trần Đại Hưng</td>
                                <td><span class="badge badge-pill badge-info">Thành viên</span></td>
                                <td>Front-end</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>-->
<div class="row">
    <div class="new_footer_top">
        
        <div class="footer_bg">
            <div class="footer_bg_one"></div>
            <div class="footer_bg_two"></div>
            <div class="footer_bg_3"></div>
            <div class="footer_bg_4"></div>
        </div>
    </div>
    <style>


.new_footer_top .footer_bg {
    position: absolute;
    bottom: -400px;
    background: url("http://droitthemes.com/html/saasland/img/seo/footer_bg.png") no-repeat scroll center 0;
    width: 100%;
    height: 276px;
    background-color: RGB (26,32,53);
    z-index: auto;
}

.new_footer_top .footer_bg .footer_bg_one {
    background: url("https://media.giphy.com/media/PgjCcyNVwXzMXv1btT/giphy.gif") no-repeat center center;
    width: 100px;
    height: 105px;
  background-size:100%;
    position: absolute;
    bottom: 0;
    left: 30%;
    -webkit-animation: myfirst 22s linear infinite;
    animation: myfirst 22s linear infinite;
}

.new_footer_top .footer_bg .footer_bg_two {
    background: url("https://media.giphy.com/media/20NUvxKjMv5YkMykZS/giphy.gif") no-repeat center center;
    width: 100px;
    height: 105px;
  background-size:100%;
    position: absolute;
    bottom: 0;
    left: 30%;
    -webkit-animation: myfirst 30s linear infinite;
    animation: myfirst 26s linear infinite;
}
-->
.new_footer_top .footer_bg .footer_bg_3 {
    background: url("https://media.giphy.com/media/h1oTHjzbnCReBYmOzU/giphy.gif") no-repeat center center;
width: 100px;
    height: 105px;
  background-size:100%;
    position: absolute;
    bottom: 0;
    left: 30%;
    -webkit-animation: myfirst 37s linear infinite;
    animation: myfirst 34s linear infinite;
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
</style>
</div>
</div>

<!--<style>
    .card:hover{
        transform: scale(1.05);
        box - shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
    }
</style>-->
