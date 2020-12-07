<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <a class="btn btn-success btn-hover" href="admin/user/update.htm">add</a>
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header card-header-success">
                  <h4 class="card-title ">Users Manager</h4>
                  <p class="card-category">danh sách</p>
                </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12 table-responsive">
                <table id="myTable" class="table">
                    <thead class="text-primary">
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Địa chỉ</th>
                            <th>Phone</th>
                            <th>Password</th>
                            <th>Avatar</th>
                            <th>Giới tính</th>
                            <th>Trạng thái</th>
                            <th>Ngày tạo</th>
                            <th>Ngày sửa</th>
                            <th></th>
                            <th></th>
                 
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="u" items="${users}">
                            <tr>
                               <td>${u.id}</td>
                                <td>${u.name}</td>
                                <td>${u.email}</td>
                                <td>${u.address}</td>
                                <td>${u.phone}</td>
                                <td>${u.password}</td>
                                <td><img src="images/avatar/${u.avatar}" id="blah" width="60"/></td>
                                <td>${u.gender.name}</td>
                                <td>${u.isactive.name}</td>
                                <td>${u.createdtime}</td>
                                <td>${u.updatedtime}</td>
                                <td> <a href="admin/user/edit/${u.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                 <td><a href="admin/user/delete2/${u.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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