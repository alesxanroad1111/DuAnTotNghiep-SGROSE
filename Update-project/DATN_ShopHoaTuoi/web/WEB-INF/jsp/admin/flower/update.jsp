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
                        <h4 class="card-title">insert Flower</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">
                        <form:form action="admin/flower/insert.htm" modelAttribute="flower" method="POST">
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
                            <a class="btn btn-success" href="admin/flower/index.htm"><img src="https://img.icons8.com/fluent/48/000000/assignment-return.png" width="18px"/></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-profile">
                        <div class="card-body">
                            <h6 class="card-category">Ảnh sản phẩm</h6>
                            <img src="images/hoa/${flower.image}" width="100%"/>
                            <div class="custom-file overflow-hidden rounded-pill mb-5">
                                <input id="customFile" type="file" name="image" accept="image/*" size="50" multiple class="btn btn-primary custom-file-input rounded-pill">
                                <label for="customFile" class="custom-file-label rounded-pill">Chọn Hình Ảnh</label>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>


        </div>

    </div>

</div>
