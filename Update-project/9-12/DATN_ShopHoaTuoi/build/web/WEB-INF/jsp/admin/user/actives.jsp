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
                        <form:form action="${pageContext.request.contextPath}/admin/user/index.htm" modelAttribute="user" method="get" >
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
                                        
                                             <label >Giới Tính</label>
                                            <form:input path="gender.name" class="form-control" />                                 
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Trạng thái hoạt động</label><br>
                                        
                                               <form:input path="isactive.name" class="form-control" />
                                           
                                       
                                    </div>
                                </div>
                            </div>
<!--                            <input name="btnUpdate" class="btn btn-success" type="submit" value="Update" />-->
                            <a class="btn btn-success" href="admin/user/index.htm"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="20px"/></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <link rel="stylesheet" href="assets/js/js.css">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh sản phẩm</h6>
                            <img id="blah" src="images/avatar/${user.avatar}" width="80%" alt="your image"/>
                            <label for="fileUpload"
                                   class="file-upload btn btn-primary btn-block rounded-pill shadow"><i
                                    class="fa fa-upload mr-2"></i>Tải Hình Ảnh
                                <form:input  path="avatar" type="file" name="avatar" accept="image/*" onchange="readURL(this);" id="fileUpload"/>
                            </label>
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
