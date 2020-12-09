<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <a class="btn btn-success btn-hover" href="admin/program/insert.htm">add</a>
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title ">Discount Programs</h4>
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
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pr" items="${programs}">
                                <tr>
                                    <td>${pr.id}</td>
                                    <td>${pr.name}</td>
                                    <td>${pr.dateStart}</td>
                                    <td>${pr.dateEnd}</td>
                                    <td><a href="admin/program/show/view/${pr.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                    <td><a href="admin/program/show/delete/${pr.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
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