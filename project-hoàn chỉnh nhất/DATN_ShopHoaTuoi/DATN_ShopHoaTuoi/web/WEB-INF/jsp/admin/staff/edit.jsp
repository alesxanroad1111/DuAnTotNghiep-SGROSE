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
                        <form:form action="${pageContext.request.contextPath}/admin/staff/edit" modelAttribute="staff" method="get" class="col-md-7" >

                            <div class="row">
                                <div class="form-group center">
                                    <form:hidden path="id" class="form-control"/>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group center">
                                        <label >Tên nhân viên</label>
                                        <form:input path="name" class="form-control"  />
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
                                        <label >Mật khẩu:</label>
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
                                    <div class="form-group">
                                        <label >Địa chỉ</label>
                                        <form:input path="address" cssClass="form-control"/>
                                    </div>
                                </div>  
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >SĐT:</label>
                                        <form:input path="phone" cssClass="form-control"/>
                                    </div>
                                </div>  
                            </div>      




                            <div class="row"> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Giới Tính</label>
                                        <div class="form-control">
                                            <form:select path="gender.id" cssClass="form-control bg-dark"
                                                         items="${genders}" itemValue="id" itemLabel="name" />
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Vai trò:</label>
                                        <div class="form-control">
                                            <form:select path="role.id" cssClass="form-control bg-dark"
                                                         items="${roles}" itemValue="id" itemLabel="name" />
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            <br>
                            <input name="btnUpdate" class="btn btn-success" type="submit" value="Update" />                              
                            <a class="btn btn-success" href="admin/staff/index"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                            <div class="clearfix"></div>                  
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <link rel="stylesheet" href="assets/js/js.css">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh sản phẩm</h6>
                             <img id="blah" src="images/avatar/${staff.avatar}" width="80%"/>
                             <input  name="image2" value="${staff.avatar}" hidden>
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
