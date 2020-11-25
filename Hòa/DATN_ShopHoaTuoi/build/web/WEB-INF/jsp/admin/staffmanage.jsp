<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-14 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center" >
                <h2 class="font-weight-bold text-primary">QUẢN LÝ NHÂN VIÊN</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->
            <div class="col-md-16">
                <table class="table table-dark table-striped table-hover">
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
                                <th>${rows.role.id}</th>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
                                <td> <a href="admin/edit0/${rows.id}.htm"><i class="material-icons">done_outline</i></a></td>
                                 <td><a href="admin/delete0/${rows.id}.htm"><i class="material-icons">delete</i></td>
                              
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
             <div class="col-md-12 text-center">
                    <h2 class="font-weight-bold text-primary">THÔNG TIN NHÂN VIÊN</h2>
                </div>
                ${message}
             <div class="col-md-12 row">
                    <form:form action="${pageContext.request.contextPath}/admin/staffmanage.htm" modelAttribute="staff" method="get" class="col-md-12 row"    >
                        <div class="col-md-8">
                            <div class="form-group">
                                <!--                            <label >Mã hoa</label>-->
                                <form:hidden    path="id"  cssClass="form-control"  />
                            </div>
                            <div class="form-group">
                                <label >Tên nhân viên:</label>
                                <form:input path="name" cssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label >Email:</label>
                                <form:input path="email" cssClass="form-control" />
                            </div>
                            
                            <div class="form-group">
                                <label >Mật khẩu:</label><br>
                                <form:input path="password" cssClass=" form-control"/>
                            </div>
                            <div class="form-group">
                                <label >Ngày sinh:</label>
                                <form:input path="birthday" cssClass="form-control"/>
                            </div>
                           
                            <div class="form-group" >
                                <label >Địa chỉ</label>
                                <form:input path="address" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label >Giới tính:</label>
                               <div class="custom-control custom-radio ">
                                  
                                <form:radiobutton path="gender" value="1" label="Nam"/> &nbsp;
                                <form:radiobutton path="gender" value="2" label="Nữ"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label >SĐT:</label>
                                <form:input path="phone" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label >Vai trò:</label>
                                <div class="custom-control custom-radio ">
                                <form:radiobutton path="role.id" value="1" label="Admin"/>
                                &nbsp;
                                <form:radiobutton path="role.id" value="2" label="Nhân Viên"/>
                                
                              
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <!--<input name="btnInsert" class="btn btn-default" type="submit" value="Insert" />-->
                                <input name="btnUpdate" class="btn btn-success" type="submit" value="Update" />
                                <!--<input name="btnReset" class="btn btn-default" type="submit" value="Reset" />-->
                            </div> 

                        </div>

                        <div class="row col-md-4">
                            <form class="md-form">
                                
                            </form:form>
                    </div>

                </div>
        </div>
    </div>
</div