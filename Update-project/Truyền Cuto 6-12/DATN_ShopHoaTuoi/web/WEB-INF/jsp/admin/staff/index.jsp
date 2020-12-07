<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="content">       
    <div class="col-md-12 row">
        <div class="container-fluid">
            <a class="btn btn-success btn-hover" href="admin/staff/update.htm">add</a>
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title ">Stafff Manager</h4>
                    <p class="card-category">danh sách</p>

                </div>
                </br>
                <!-- Đây là nội dung cái của trang -->

                <div class="col-md-12 table-responsive">
                    <table id="myTable" class="table">
                        <thead class="text-primary">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Mail</th>
                                <th>Password</th>
                                <th>Birthday</th>                           
                                <th>Address</th>
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
                                    <td>${rows.id}</td>
                                    <td>${rows.name}</td>
                                    <td>${rows.email}</td>
                                    <td>${rows.password}</td>
                                    <td>${rows.birthday}</td>
                                    <td>${rows.address}</td>
                                    <td><img src="images/avatar/${rows.avatar}" id="blah" width="60"/></td>
                                    <th>${rows.gender.name}</th>
                                    <th>0${rows.phone}</th>
                                    <th>${rows.role.name}</th>
                                    <td>${rows.createdtime}</td>
                                    <td>${rows.updatedtime}</td>
                                    <td> <a href="admin/staff/edit0/${rows.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                    <td><a href="admin/staff/delete0/${rows.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>

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

