<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">
<section id="slider">
    <!--form-->
    <div class="container row" style="margin-left: 30px; margin-right: 0px;">
        <div class="col-sm-3"></div>
        <form:form class="form-horizontal" action="user/reg.htm" modelAttribute="user" method="GET">
            <div class="col-sm-6 row" style="background-color: #f2f2f2;">
                <div  class="text-center"><h2>Registration</h2></div>
                
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Họ Và Tên*</label>
                    <div class="col-sm-9">
                        <form:input path="name" type="text" id="firstName" placeholder="Your Name" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email* </label>
                    <div class="col-sm-9">
                        <form:input path="email" type="email" id="email" placeholder="Email" class="form-control" name="email"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Mật khẩu*</label>
                    <div class="col-sm-9">
                        <form:input path="password" type="password" id="password" placeholder="Password" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Xác nhận mật khẩu*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" placeholder="Password" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-3 control-label">Số điện thoại</label>
                    <div class="col-sm-9">
                        <form:input path="phone" type="text" id="phoneNumber" placeholder="" class="form-control"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-3">Giới tính</label>
                    <div class="col-sm-9">
                        <form:select path="gender.id" class="form-control"
                                                     items="${genders}" itemValue="id" itemLabel="name" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="Address" class="col-sm-3 control-label">Địa Chỉ</label>
                    <div class="col-sm-9">
                        <form:input path="address" type="text" id="Address" placeholder="Địa Chỉ" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">*Thông tin bắt buộc</span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <button class="btn btn-primary btn-block">Đăng ký</button>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
                
            </div>
        </form:form>
        <div class="col-sm-3"></div>

    </div>
</section>
