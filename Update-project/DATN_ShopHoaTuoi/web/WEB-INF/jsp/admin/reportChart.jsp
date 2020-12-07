<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <div class="row  container-fluid" >
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
//                    },
                    

                };
                var chart = new
                        google.visualization.PieChart(document.getElementById('piechart_3d'));
                        
                chart.draw(data, options);
            }
        </script>
        <div id="piechart_3d" style="width: 100%; height: 500px;  fill: #FFF; "></div>
    </div>
    <div class="row  container-fluid">
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
 
//                    backgroundColor: {
//                        fill: '#1a2035'
//                    }
                };
                var chart = new
                        google.visualization.PieChart(document.getElementById('piechart_3d1'));
                chart.draw(data, options);
            }
        </script>
        <div id="piechart_3d1" style="width: 100%; height: 500px; "></div>
    </div>
    <div class="row  container-fluid">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Ngày', 'Tong tiền'],
            <c:forEach var="ro" items="${reportorders}">
                    ['${ro.group}', ${ro.sum}],
            </c:forEach>
                ]);

                var options = {
                    chart: {
                        title: 'Doanh thu của SG-Rose',
                        subtitle: '',
                        is3D: true,
//                        backgroundColor: {
//                        fill: '#1a2035'
//                    }
                    }
                };

                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <div id="columnchart_material"style="width: 100%; height: 500px; "></div>
    </div>

</div>
