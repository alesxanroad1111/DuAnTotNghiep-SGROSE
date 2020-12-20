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
                        <h4 class="card-title">Insert Users</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">
                        <form:form action="${pageContext.request.contextPath}/admin/user/insert" modelAttribute="user" method="POST" enctype="multipart/form-data">
                               <div class="row">
                            <div class="form-group center">
                                <form:hidden path="id" cssClass="form-control"  />
                            </div>
                        
                                <div class="col-md-6">
                                    <div class="form-group center">
                                        <label >Tên tài khoản</label>
                                        <form:input path="name" class="form-control" />
                                    </div>
                                </div>
                                     </div>
                                    <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Email:</label>
                                        <form:input path="email" cssClass="form-control" />
                                    </div>
                                </div>
                           

                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Địa chỉ</label>
                                        <form:input path="address" class="form-control" />
                                    </div>
                                </div>
                                     </div>
                                    <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Số điện thoại</label>
                                        <form:input path="phone" class="form-control" />
                                    </div>
                                </div>
                           
                             
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Mật khẩu</label>
                                        <form:input path="password" class="form-control" />
                                    </div>
                                </div>
                                    </div>
                                    <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Giới tính</label><br>
                                        <div class="form-control">
                                            <form:radiobutton path="gender" value="1" label="Nam"/>
                                            <form:radiobutton path="gender" value="2" label="Nữ"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Trạng thái hoạt động</label><br>
                                        <div class="form-control">
                                            <form:radiobutton path="isactive" value="1" label="Đang hoạt động"/>
                                            <form:radiobutton path="isactive" value="2" label="Đang offline"/>
                                        </div>
                                    </div>
                                </div>
                                        </div>
                            


                            <button class="btn btn-success">Insert </button>
                            <a class="btn btn-success" href="admin/user/index"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                            <div class="clearfix"></div>
                        </div> 
                    </div>
                </div>
                <div class="col-md-4 ">
                    <link rel="stylesheet" href="assets/js/js.css">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh sản phẩm</h6>
                            <img id="blah" src="images/logo/new.png" alt="your "/>
                            <label for="fileUpload"
                                   class="file-upload btn btn-primary btn-block rounded-pill shadow"><i
                                    class="fa fa-upload mr-2"></i>Tải Hình Ảnh
                                <form:input  path="avatar" type="file" name="avatar" accept="avatar/*" onchange="readURL(this);" id="fileUpload"/>
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