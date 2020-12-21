<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
   
    <div class="col-md-12 row">
        <div class="container-fluid">
             <a class="btn-circle btn-circle-lg m-1" href="admin/staff/update"><img src="images/icon/plus.png" width="70"/></a>
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title ">Staffs Manager</h4>
                    <p class="card-category">danh sách</p>
                </div>
                <!-- Đây là nội dung cái của trang -->

                <div class="col-md-12 table-responsive">
                    <table id="myTable" class="table">
                        <thead class="text-primary">
                            <tr>
                                <th>Name</th>
                                <th>Mail</th>
                                <th>Password</th>
                                <th>Birthday</th>
                                <th>Avatar</th>
                                <th>Gender</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Ngày tạo</th>
                                <th>Ngày sửa</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rows" items="${staffs}">
                                <tr>
                                    <td>${rows.name}</td>
                                    <td>${rows.email}</td>
                                    <td>${rows.password}</td>
                                    <td>${rows.birthday}</td>
                                    <td><img src="images/avatar/${rows.avatar}" id="blah" width="60"/></td>
                                    <th>${rows.gender.name}</th>
                                    <th>0${rows.phone}</th>
                                    <th>${rows.role.name}</th>
                                    <td>${rows.createdtime}</td>
                                    <td>${rows.updatedtime}</td>
                                    <td> <a href="admin/staff/edit0/${rows.id}"><img src="images/icon/edit.png" width="31"/></a></td>
                                    <td><a href="admin/staff/delete0/${rows.id}"><img src="images/icon/delete.png" width="31"/></td>

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
                "info": false,
                "bLengthChange": false
            });

        });
    </script>