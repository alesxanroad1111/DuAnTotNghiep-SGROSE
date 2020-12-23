<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="content">
    <a href="admin/reportChart" class="btn-circle btn-circle-lg m-1"><img src="images/icon/chart.png" width="70"/></a>
    <div class="row">
        <div class=" col-md-12">
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Thống kê sản phẩm</h4>
                    <p class="card-category">Chi tiết</p>
<!--                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                        Biểu đồ chi tiết
                    </button>-->
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-hover">
                        <thead class="text-warning">
                        <th>Group</th>
                        <th>Tổng tiền</th>
                        <th>Tổng số lượng</th>
                        <th>Giá lớn nhất</th>
                        <th>Giá nhỏ nhất</th>
                        <th>Giá trung bình</th>
                        </thead>
                        <tbody>
                            <c:forEach var="rp" items="${reports}">
                                <tr>
                                    <td>${rp.group}</td>
                                    <td><fmt:formatNumber value = "${rp.sum}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${rp.count}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${rp.max}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${rp.min}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${rp.avg}" type = "number" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Thống kê doanh thu</h4>
                    <p class="card-category">Chi tiết</p>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Biểu đồ chi tiết</button>
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-hover">
                        <thead class="text-warning">
                        <th>Ngày</th>
                        <th>Sản phẩm bán chạy</th>
                        <th>Sản phẩm bán ít chạy</th>
                        <th>Tổng số sản phẩm bán được</th>
                        <th>Tổng tiền</th>
                        </thead>
                        <tbody>
                            <c:forEach var="ro" items="${reportorders}">
                                <tr>
                                    <td>${ro.group}</td>
                                    <td><fmt:formatNumber value = "${ro.max}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${ro.min}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${ro.count}" type = "number" /></td>
                                    <td><fmt:formatNumber value = "${ro.sum}" type = "number" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
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
                            backgroundColor: '#00000'
                        };
                        var chart = new
                                google.visualization.PieChart(document.getElementById('piechart_3d'));
                        chart.draw(data, options);
                    }
                </script>
                <div id="piechart_3d" ></div>

            </div>

        </div>
    </div>

</div>


