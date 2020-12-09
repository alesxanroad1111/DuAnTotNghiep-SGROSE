<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">
<section id="slide" style="margin-top: 30px;">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="row" style="margin-bottom: 10px">
                    <div class="col-sm-3">
                        <div class="picture">
                            <img src="img/faces/${user.avatar}" height="50">
                        </div>
                    </div>
                    <div class="col sm-9">
                        <div class="input-text">${user.name}</div>
                        <div>
                            <a class="text-right_edit" href="user/profile.htm">
                                Sửa hồ sơ
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="panel-group category-products" id="accordian" style="border: none;">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#taikhoancuatoi">
                                        <span class="badge pull-left"><img
                                                src="https://img.icons8.com/fluent/24/000000/guest-male.png" /></span>
                                        Tài khoản của tôi
                                    </a>
                                </h4>
                            </div>
                            <div id="taikhoancuatoi" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="">Hồ sơ </a></li>
                                        <li><a href="">Ngân hàng </a></li>
                                        <li><a href="">Địa chỉ </a></li>
                                        <li><a href="">Thêm mật khẩu</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#donmua">
                                        <span class="badge pull-left"><img
                                                src="https://img.icons8.com/cotton/24/000000/note--v2.png" /></span>
                                        Đơn mua
                                    </a>
                                </h4>
                            </div>
                            <div id="donmua" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="">Tất cả </a></li>
                                        <li><a href="">Chờ xác nhận </a></li>
                                        <li><a href="">Chờ lấy hàng </a></li>
                                        <li><a href="">Đang giao</a></li>
                                        <li><a href="">Đã giao</a></li>
                                        <li><a href="">Đã hủy</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#thongbao">
                                        <span class="badge pull-left"><img
                                                src="https://img.icons8.com/flat_round/24/000000/bell.png" /></span>
                                        Thông báo
                                    </a>
                                </h4>
                            </div>
                            <div id="thongbao" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="">Cập nhật đơn hàng </a></li>
                                        <li><a href="">Khuyến mãi </a></li>
                                        <li><a href="">Cập nhật ví </a></li>
                                        <li><a href="">Hoạt động</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#visgrose">
                                        <span class="badge pull-left"><img
                                                src="https://img.icons8.com/doodle/24/000000/wallet-app.png" /></span>
                                        Ví SG-Rose
                                    </a>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9" style="margin-bottom: 100px;">
                <div class="row">
                    <div class=" col-sm-12">
                        <h2 class="title text-center">Hồ Sơ Của Tôi</h2>
                    </div>
                    <form:form class="form-horizontal" action="user/update-your-profile.htm" modelAttribute="userr" method="POST">
                        <div class="col-sm-6">

                            <div class="form-group row">
                                <label class="col-sm-4">ID Người Dùng:</label>
                                <div class="col-sm-8 shopper-info">
                                    <form:hidden path="id" class="form-control"/>
                                    <form:hidden path="password" class="form-control"/>
                                    <form:hidden path="avatar" class="form-control"/>
                                    <form:hidden path="address" class="form-control"/>
                                    <form:hidden path="isactive.id" class="form-control"/>
                                    <label class="input-text">${user.id}</label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4">Tên:</label>
                                <div class="col-sm-8 shopper">
                                    <form:input path="name" type="text" class="form-control" value="${user.name}" placeholder="Họ và tên"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4">Email:</label>
                                <div class="col-sm-8">
                                    <label class="input-text">${user.email}</label>
                                    <form:hidden path="email" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4">Số điện thoại:</label>
                                <div class="col-sm-8">
                                    <label class="input-text">${user.phone}</label>
                                    <form:hidden path="phone" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4">Giới Tính:</label>
                                <div class="col-sm-8">
                                    <form:radiobuttons path="gender.id" items="${genders}" itemLabel="name" itemValue="id"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class=" col-sm-4 ">Ngày sinh:</label>
                                <div class="col-sm-8 shopper">
                                    <form:input path="birthday" name="birthday" type="text" id="birthDate" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="control-label col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="btn btn-default check_out" style="margin-left: 0px; margin-top: 0px;">Lưu thông tin</button>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-6"  style="border-left: 1px solid #f2f2f2">
                            <div class="form-group">
                                <div class="text-center">
                                    <img src="img/faces/${user.avatar}" width="150">
                                </div>
                                <div class="text-center" style="margin-top: 20px;">
                                    <button type="submit" style="margin-left: 0px; margin-top: 0px;" class="btn btn-default check_out">Chọn ảnh</button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>
<style>
    .shopper input {
        background: #F2F2F2;
        border: 0 none;
        margin-bottom: 10px;
        padding: 10px;
        width: 100%;
        font-weight: 300;
        border-radius: 0px;
    }
</style>

