<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">
<section id="slide" style="background: #FAFAFA;">
    <div class="container">
        <div class="row" style=" margin-top: 20px;"> 
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <div class="row" style="margin-bottom: 10px">
                        <div class="col-sm-3">
                            <div class="picture">
                                <img src="images/avatar/${user.avatar}" height="50">
                            </div>
                        </div>
                        <div class="col sm-9">
                            <div class="input-text">${user.name}</div>
                            <div>
                                <a class="text-right_edit" href="user/profile/${user.id}">
                                    Sửa hồ sơ
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-group category-products" id="accordian" style="border: none;">
                        <!--category-productsr-->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        <td>
                                            <img src="https://img.icons8.com/fluent/24/000000/guest-male.png" />
                                        </td>
                                        Tài khoản của tôi
                                    </a>
                                </h4>
                            </div>
                            <div id="sportswear" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="user/profile/${user.id}">Hồ sơ</a></li>
                                        <li><a href="user/changepassword">Đổi mật khẩu</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a href="user/purchased">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        <img src="https://img.icons8.com/cotton/24/000000/note--v2.png" width="25px" />
                                        Đơn mua
                                    </a>
                                </h4>
                            </div>

                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        <img src="https://img.icons8.com/flat_round/24/000000/bell.png" width="25px" />
                                        Thông báo
                                    </a>
                                </h4>
                            </div>
                            <div id="womens" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="#">Cập nhật đơn hàng</a></li>
                                        <li><a href="#">Khuyến mãi</a></li>
                                        <li><a href="#">Cập nhật ví</a></li>
                                        <li><a href="#">Hoạt động</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        <img src="https://img.icons8.com/doodle/24/000000/wallet-app.png" width="25px" />
                                        Ví SG-Rose
                                    </a>
                                </h4>
                            </div>

                        </div>

                    </div>
                    <!--/category-products-->


                </div>
            </div>
            <div class="col-sm-9" style="margin-bottom: 100px;">
                <div class="row">
                    <div class=" col-sm-12">
                        <h2 class="title text-center">THAY ĐỔI MẬT KHẨU</h2>
                    </div>
                    <form class="form-horizontal" action="user/change-password"  method="POST">
                        <div class="col-sm-6">

                            
                            <div class="form-group row">
                                <label class="col-sm-4">Mật khẩu cũ:</label>
                                <div class="col-sm-8 shopper">
                                    <input name="password" class="form-control" type="password" class="form-control"  placeholder="Old password" required/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4">Mật khẩu mới:</label>
                                <div class="col-sm-8 shopper">
                                    <input name="repassword" class="form-control" type="password" class="form-control"  placeholder="New password" required/>
                                    
                                </div>
                            </div>
                            <div class="form-group row shopper">
                                <label class="col-sm-4">Nhập lại:</label>
                                <div class="col-sm-8">
                                    <input name="confirmpassword" class="form-control" type="password" class="form-control"  placeholder="Confirm password" required/>
                                    
                                </div>
                            </div>
                            
                            <p style="color: #FF4518;">${message}</p>

                            <div class="form-group row">
                                <div class="control-label col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="btn btn-default check_out" style="margin-left: 0px; margin-top: 0px;">Đổi mật khẩu</button>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-6"  style="border-left: 1px solid #f2f2f2">
                            
                        </div>
                    </form>
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

