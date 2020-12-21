<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header card-header-success">
                            <h4 class="card-title">Update Program</h4>
                            <p class="card-category">Form here</p>
                        </div>
                        <div class="card-body">
                            <form:form action="admin/program/edit" modelAttribute="program" method="GET">
                                <div class="form-group center">
                                    <form:hidden path="id" class="form-control"/>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Tên chiến dịch</label>
                                            <form:input path="name" class="form-control"  />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Ngày bắt đầu</label>
                                            <div class="input-group">
                                                <form:input path="dateStart" type="text" class="date form-control"  />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Ngày kết thúc </label>
                                            <div class="input-group">
                                                <form:input type="text" class="date form-control"  path="dateEnd" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-success">update </button>
                                <a class="btn btn-success" href="admin/program/index">Cancel</a>
                                <div class="clearfix"></div>
                            </form:form>  
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-profile">
                        <div class="card-body">

                            <img src="images/hoadon.jpg" width="100%"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
