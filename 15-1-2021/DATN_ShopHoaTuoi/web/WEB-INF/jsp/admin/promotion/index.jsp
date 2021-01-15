<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <style>
        .btn-circle {
            width: 45px;
            height: 45px;
            line-height: 45px;
            text-align: center;
            padding: 0;
            border-radius: 50%;
        }
        .btn-circle-lg {
            width: 55px;
            height: 55px;
            line-height: 55px;
            font-size: 1.1rem;
        }
    </style>
            <a class=" btn-circle btn-circle-lg m-1" href="admin/promotion/update"><img src="images/icon/plus.png" width="70"/></a>
            <div class="card">
                
                <div class="card-header card-header-success">
                    <h4 class="card-title ">Flowers Promotion</h4>
                    <p class="card-category">List</p>

                </div>
                </br>
                <!-- Đây là nội dung cái của trang -->

                <div class="col-md-12 table-responsive">
                    <table id="myTable"  class="table">
                        <thead class="text-primary">
                            <tr>
                                <th>ID</th>
                                <th>Tên khuyến mãi</th>
                                <th>Tên hoa</th>
                                <th>Theo %</th>
                                <th>Theo giá</th>
                                <th>Số lượng</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${promotions}">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.discountId.name}</td>
                                    <td>${p.flowerId.name}</td>
                                    <td>${p.typePercent}</td>
                                    <td>${p.typeprice}</td>
                                    <td>${p.amount}</td>
                                    <td><a href="admin/promotion/show/view/${p.id}"><img src="images/icon/edit.png" width="31"/></a></td>
                                    <td><a href="admin/promotion/show/delete/${p.id}"><img src="images/icon/delete.png" width="31"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-center">
                        <ul class="pagination pagination-lg pager" id="myPager"></ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
 <meta name="description" content="Bootstrap.">  
    <script src="./assets/js/core/jquery.min.js"></script>
    
    
    <script>
        $(document).ready(function () {
            $('#myTable').dataTable({
                "pageLength": 7,
                "ordering": false,
                "info":    false,
                "bLengthChange": false
            });

        });
        </script>