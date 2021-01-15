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
                        <form:form action="${pageContext.request.contextPath}/admin/user/edit" modelAttribute="user" method="POST" >
                            <div class="row">
                                <div class="form-group center">
                                    <form:hidden path="id" class="form-control" />

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group center">
                                        <label >Tên tài khoản</label>
                                        <form:hidden path="name" class="form-control"/>
                                        <span class="form-control">${user.name}</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Email</label>
                                        <form:hidden path="email" class="form-control" />
                                        <span class="form-control">${user.email}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Địa chỉ</label>
                                        <form:hidden path="address" class="form-control" />
                                        <span class="form-control">${user.address}</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Số điện thoại</label>
                                        <form:hidden path="phone" class="form-control" />
                                        <span class="form-control">${user.phone}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Địa chỉ</label>
                                        <form:hidden path="birthday" class="form-control" />
                                        <span class="form-control">${user.birthday}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Mật khẩu</label>
                                        <form:hidden path="password" class="form-control" />
                                        <span class="form-control">${user.password}</span>
                                    </div>
                                </div>  
                                <div class="col-md-6">
                                    <div class="form-group">                                

                                        <label >Giới Tính</label>
                                        <form:hidden path="gender.id" Class="form-control" />
                                        <span class="form-control">${user.gender.name}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Ngày Tạo</label>
                                        <form:hidden path="createdtime" class="form-control" />
                                        <span class="form-control">${user.createdtime}</span>
                                    </div>
                                </div>  
                                <div class="col-md-6">
                                    <div class="form-group">                                

                                        <label >Cập Nhật</label>
                                        <form:hidden path="updatedtime" class="form-control" />
                                        <span class="form-control">${user.updatedtime}</span>
                                    </div>
                                </div>
                            </div>


                            <!--                            <input name="btnUpdate" class="btn btn-success" type="submit" value="Update" />-->
                            <a class="btn btn-success" href="admin/user/index"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="20px"/></a>

                            <input name="btnactive" class="btn btn-success" type="submit" value="Active" />  
                            <input name="btnban" class="btn btn-success" type="submit" value="Unactive" />  

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <link rel="stylesheet" href="assets/js/js.css">
                    <div class="card card-profile">
                        <div class="card-body">

                            <h6 class="card-category">Hình Ảnh Người Dùng</h6>
                            <img id="blah" src="images/avatar/${user.avatar}" width="80%" alt="your image"/>
                            <input name="avatar2" value="${user.avatar}" hidden>
                        </div>
                    </div>
                </div>    
            </form:form>



        </div>
    </div>
</div>




<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                        .attr('src', e.target.result)
                        .width(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
