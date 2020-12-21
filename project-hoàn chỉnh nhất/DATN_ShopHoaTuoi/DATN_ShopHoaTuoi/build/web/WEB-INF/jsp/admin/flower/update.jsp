<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">insert Flower</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">
                        <form:form action="${pageContext.request.contextPath}/admin/flower/insert"  modelAttribute="flower" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group center">
                                    <form:hidden path="id" class="form-control"/>
                                   
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Tên hoa</label>
                                        <form:input path="name" cssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Tên Loại hoa</label>
                                        <form:select path="typeid.id" cssClass="form-control"
                                                     items="${typesofflowers}" itemValue="id" itemLabel="name" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Số lượng</label>
                                        <form:input path="amount" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Giá</label>
                                        <form:input path="price" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Notes</label>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Thông tin về hoa</label>
                                            <form:textarea path="notes" rows="7" cssClass="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-success">Insert </button>
                            <a class="btn btn-success" href="admin/flower/index"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                            <div class="clearfix"></div>
                            <span style="color: #fc354c;">${message}</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <link rel="stylesheet" href="assets/js/js.css">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh Đại Diện</h6>
                            <img id="blah" src="images/logo/new.png" alt="your image"/>
                            <label for="fileUpload"
                                   class="file-upload btn btn-success btn-block rounded-pill shadow"><i
                                    class="fa fa-upload mr-2"></i>Tải Hình Ảnh
                                <form:input  path="image" type="file" name="image" accept="image/*" onchange="readURL(this);" id="fileUpload"/>
                            </label>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

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
