<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="content">
   
    
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


