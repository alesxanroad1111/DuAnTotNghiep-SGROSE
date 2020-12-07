<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Edit Staff</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">
                        <form:form action="${pageContext.request.contextPath}/admin/staff/edit.htm" modelAttribute="staff" method="get" class="col-md-7" >
                            <div class="row">
                                <div class="form-group center">                          
                                    <form:hidden path="id"  cssClass="form-control"  />
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Tên nhân viên:</label>
                                        <form:input path="name" cssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Email:</label>
                                        <form:input path="email" cssClass="form-control" />
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Mật khẩu:</label><br>
                                        <form:input path="password" cssClass=" form-control"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Ngày sinh:</label>
                                        <form:input path="birthday" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">                               
                                <div class="col-md-6">
                                    <div class="form-group" >
                                        <label >Địa chỉ</label>
                                        <form:input path="address" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Giới tính:</label>
                                        <div class="custom-control custom-radio ">

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">                               
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >SĐT:</label>
                                        <form:input path="phone" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Vai trò:</label>
                                        <div class="custom-control custom-radio ">
                                            <form:radiobutton path="role.id" value="1" label="Admin"/>
                                            &nbsp;
                                            <form:radiobutton path="role.id" value="2" label="Nhân Viên"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <input name="btnUpdate" class="btn btn-success" type="submit" value="Update" />                              
                                <a class="btn btn-success" href="admin/staff/index.htm"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                                <div class="clearfix"></div>
                    </form:form>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-profile">
                <div class="card-body">
                    <h6 class="card-category">Ảnh sản phẩm</h6>
                    <img src="images/avatar/${staff.avatar}" width="100%"/>
                    <input type="file" class="custom-file-input" id="customFile" >
                </div>

            </div>
        </div>                          
    </div>
</div>
</div>
