<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="content">       
    <div class="col-md-12 row">
        <div class="container-fluid">
            <a class="btn btn-success btn-hover" href="admin/flower/update.htm">add</a>
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title ">Flowers Manager</h4>
                    <p class="card-category">danh sách</p>

                </div>
                </br>
                <!-- Đây là nội dung cái của trang -->

                <div class="col-md-12 table-responsive">
                    <table id="myTable"  class="table">
                        <thead class="text-primary">
                            <tr>
                                <th>ID</th>
                                <th>Tên hoa</th>
                                <th>Loại hoa</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Image</th>
                                <th>Ngày tạo</th>
                                <th>Ngày sửa</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="f" items="${flowers}">
                                <tr>
                                    <td>${f.id}</td>
                                    <td>Hoa ${f.name}</td>
                                    <td>${f.typeid.name}</td>
                                    <td>${f.amount}</td>
                                    <td>${f.price}</td>
                                    <td><img src="images/hoa/${f.image}" id="blah" width="60"/></td>
                                    <td>${f.createdtime}</td>
                                    <td>${f.updatedtime}</td>
                                   <td><a href="admin/flower/edit/show/${f.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                    <td><a href="admin/flower/edit/delete/${f.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
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