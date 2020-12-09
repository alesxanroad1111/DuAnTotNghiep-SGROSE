<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content" style="font-size: 14px;    ">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold text-primary"><strong>DANH SÁCH TÀI KHOẢN</strong></h2>
            </div>
            <div class="col-md-12">
                <table class="table table-dark table-striped table-hover">
                    <thead>
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
                            <th>Edit</th>
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
                                <td>${u.avatar}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${u.gender==0}">
                                            Nữ
                                        </c:when>
                                        <c:otherwise>
                                            Nam
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${u.isactive==1}">
                                            <i class="material-icons">toggle_on</i>
                                            </c:when>
                                            <c:otherwise>
                                             <i class="material-icons">toggle_off</i>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${u.createdtime}</td>
                                <td>${u.updatedtime}</td>
                                <td><a href="admin/views/${u.id}"><i class="material-icons">done_outline</i></a></td>
                                <td><a href="admin/delete2/${u.id}"><i class="material-icons">delete</i></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#" ng-click="prev()">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#" ng-click="next()">Next</a></li>
                </ul>
            </div>
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold text-primary">Thông tin chi tiết</h2>
            </div>
            <div class="col-md-12 row"><div class="col-md-2"></div>
                <form:form action="${pageContext.request.contextPath}/admin/usersmanage" modelAttribute="user" method="get" class="col-md-7">

                    <div class="form-group center">
                        <form:hidden path="id" class="form-control"/>
                    </div>
                    <div class="form-group center">
                        <label >Tên tài khoản</label>
                        <form:input path="name" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Email</label>
                        <form:input path="email" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Địa chỉ</label>
                        <form:input path="address" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Số điện thoại</label>
                        <form:input path="phone" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Mật khẩu</label>
                        <form:input path="password" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Giới tính</label><br>
                        <div class="form-control">
                            <form:radiobutton path="gender" value="1" label="Nam"/>
                            <form:radiobutton path="gender" value="2" label="Nữ"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >Trạng thái hoạt động</label><br>
                        <div class="form-control">
                            <form:radiobutton path="isactive" value="1" label="Đang hoạt động"/>
                            <form:radiobutton path="isactive" value="2" label="Đang offline"/>
                        </div>
                    </div>
                </div>
                <div class="form-group text-center">
                    <input name="btnInsert" class="btn btn-default" type="submit" value="Insert" />
                    <input name="btnUpdate" class="btn btn-default" type="submit" value="Update" />
                    <input name="btnReset" class="btn btn-default" type="submit" value="Reset" />
                </div> 
            </form:form>
        </div>
    </div>

</div>
