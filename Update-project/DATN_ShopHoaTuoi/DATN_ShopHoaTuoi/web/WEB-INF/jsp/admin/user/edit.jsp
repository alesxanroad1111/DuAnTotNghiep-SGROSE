<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Edit Users</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">                        
                        <form:form action="${pageContext.request.contextPath}/admin/user/index.htm" modelAttribute="user" method="get" class="col-md-7">


                            <div class="row">
                                <div class="form-group center">
                                    <form:hidden path="id" class="form-control"/>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group center">
                                        <label >Tên tài khoản</label>
                                        <form:input path="name" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Email</label>
                                        <form:input path="email" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Địa chỉ</label>
                                        <form:input path="address" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Số điện thoại</label>
                                        <form:input path="phone" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Mật khẩu</label>
                                        <form:input path="password" class="form-control" />
                                    </div>
                                </div>  
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Giới Tính</label><br>
                                        <div class="form-control">
                                            <form:select path="gender.id" cssClass="form-control bg-dark"
                                                         items="${genders}" itemValue="id" itemLabel="name" />
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label >Trạng thái hoạt động</label><br>
                                        <div class="form-control">
                                            <form:select path="isactive.id" cssClass="form-control bg-dark"
                                                         items="${actives}" itemValue="id" itemLabel="name" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input name="btnUpdate" class="btn btn-success" type="submit" value="Update" />
                            <a class="btn btn-success" href="admin/user/index.htm"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                             <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh sản phẩm</h6>
                            <img src="images/avatar/${user.avatar}" width="100%"/>
                        </div>
                    </div>
                </div>
            </form:form>



        </div>
    </div>
</div>
