<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center" >
                <h2>Quản Lý Nhân Viên</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->
            <div class="col-md-12">
                <table class="col-md-12 table table-condensed text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Mail</th>
                            <th>Password</th>
                            <th>Birthday</th>                           
                            <th>Address</th>
                            <th>Gender</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Ngày tạo</th>
                            <th>Ngày sửa</th>
                            <th>Edit</th>
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
                                <th>${rows.gender}</th>
                                <th>0${rows.phone}</th>
                                <th>${rows.role}</th>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
                                <td> <i class="material-icons">done_outline</i></td>
                                <td><i class="material-icons">delete</i></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-12 text-center">
                <h2>Thông Tin Nhân Viên</h2>
            </div>
            <div class="col-md-12 row">
                <form class="col-md-8">
                    <div class="form-group">
                        <label>Mã Nhân Viên:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Tên Nhân Viên:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Mail:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Birthday:</label>
                        <input class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Address:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Gender:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Phone:</label>
                        <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Role:</label>
                        <input class="form-control">
                    </div>

                </form>
                <div class="col-md-4">
                    <div class="">
                        <img src="image/avatar.jpg" alt="" style="width:100%">
                        <div class="text-center">
                            <h4>Ảnh nhân viên</h4>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
            <center style="size: 100px;">
                <a href="#" class="plus"><i class="fa fa-plus"></i></a>
                <a href="#" class="wrench"><i class="fa fa-wrench"></i></a>
                <a href="#" class="new"><i class="fa fa-clipboard"></i></a>
            </center>
        </div>
    </div>
</div