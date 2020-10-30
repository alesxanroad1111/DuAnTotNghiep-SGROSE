<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2>Quản Lý Nhân Viên</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12 text-center">
                <table class="table table-condensed" ng-app="myapp" ng-controller="myctrl">
                    <thead>
                        <tr>
                            <th>ID </th>
                            <th>Name</th>
                            <th>Emai</th>
                            <th>Password</th>
                            <th>Birthday</th>
                            <th>Address</th>
                            <th>Avatar</th>
                            <th>Genden</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Createdtime</th>
                            <th>Updatedtime</th>
                            <th>Edit</th>
                     
                           
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rows" items="${user}">
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.name}</td>
                                <td>${rows.email}</td>
                                <td>${rows.password}</td>
                                <td>${rows.birthday}</td>
                                <td>${rows.address}</td>
                                <td>${rows.avatar}</td>
                                <td>${rows.gender}</td>
                                <td>${rows.phone}</td>
                                <td>${rows.role}</td>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
                                <td> <i class="material-icons">done_outline</i></td>
                                <td><i class="material-icons">delete</i></td>
                                
                                  
                                
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
                <h2>Thông tin nhân viên</h2>
            </div>
            ${message}
            <div class="col-md-12 row">
                <form:form action="staffmanage.htm" modelAttribute="flower" method="get" class="col-md-8">
                    <div class="form-group">
                        <label >Mã nhân viên</label>
                        <form:input path="id" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label >Tên nhân viên</label>
                        <form:input path="name" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label >Mail</label>
                        <form:input path="mail" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label >Password</label>
                        <form:input path="password" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label >Birthday</label>
                        <form:input path="birthday" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label >Address</label>
                        <form:input path="address" cssClass="form-control"/>
                    </div>
                     <div class="form-group">
                        <label >Gender</label>
                        <form:input path="gender" cssClass="form-control"/>
                    </div>
                     <div class="form-group">
                        <label>Phone</label>
                        <form:input path="number" cssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <form:input path="role" cssClass="form-control"/>
                    </div>
                    
                </form:form>
                <div class="col-md-4">
                    <div class="">
                        <img src="img/faces/avt.jpg" alt="" style="width:100%">
                        <div class="text-center">
                            <h4>Ảnh sản phẩm</h4>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
            <form:form action="staffmanage.htm" modelAttribute="flower" method="get">
            <div class="form-group text-center">
			<button name="btnInsert" class="btn btn-default">Insert</button>
			<button name="btnUpdate" class="btn btn-default">Update</button>
			<button name="btnDelete" class="btn btn-default">Delete</button>
			<button name="btnReset" class="btn btn-default">Reset</button>
            </div>  
            </form:form>
        </div>
    </div>
</div>
