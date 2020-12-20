<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Insert Staffs</h4>
                        <p class="card-category">Form here</p>
                        
                    </div>
                    <div class="card-body">
                        <form:form action="admin/staff/insert" modelAttribute="staff" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group center">
                                    <form:hidden path="id" cssClass="form-control"  />
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <label >Tên nhân viên:</label>
                                        <form:input path="name" cssClass="form-control"  />
                                        <!--<input style="background-color: #8b92a9"  name="name" required>--> 
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
                                        <form:input path="birthday" name="birthday" cssClass="form-control"/>
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
                                         <form:select path="gender.id" cssClass="form-control bg-dark"
                                                         items="${genders}" itemValue="id" itemLabel="name" />
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
                                        <form:select path="role.id" cssClass="form-control bg-dark"
                                                         items="${roles}" itemValue="id" itemLabel="name" />
                                    </div>                               
                                </div>
                            </div>


                            <button class="btn btn-success">Insert </button>
                            <a class="btn btn-success" href="admin/user/index"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                            <!--<div class="clearfix"></div>-->
                            <span style="color: #fc354c;">${message}</span>
                        </div>    
                    </div>
                </div>  
                <div class="col-md-4">
                    <link rel="stylesheet" href="assets/js/js.css">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh sản phẩm</h6>
                            <img id="blah" src="images/logo/new.png" alt="your image"/>
                            <input name="avatar2" hidden>
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

<!--</div>-->
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

<!--<style> 
input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border:0;
  border-bottom: 2px solid black;
}
background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px), linear-gradient(to top, rgba(180, 180, 180, 0.1) 1px, rgba(180, 180, 180, 0) 1px);
}
</style>-->