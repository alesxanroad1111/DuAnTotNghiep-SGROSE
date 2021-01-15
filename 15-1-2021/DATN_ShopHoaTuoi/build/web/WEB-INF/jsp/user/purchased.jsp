
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="slider" style="background: #FAFAFA;" >
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

            <div class="col-sm-9 padding-right category-tab" style=" margin-bottom: 10px;">
                <div class="btn-group btn-group-lg col-sm-12 row">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#purchaseall" data-toggle="tab">Tất Cả</a></li>
                        <li><a href="#waitforship" data-toggle="tab">Chờ lấy hàng</a></li>
                        <li><a href="#shipping" data-toggle="tab">Đang giao hàng</a></li>
                        <li><a href="#claimed" data-toggle="tab">Đã giao hàng</a></li>
                        <li><a href="#cancel" data-toggle="tab">Đã hủy</a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="purchaseall" >
                        <c:forEach var="p" items="${purchase}">
                            <div  class="col-md-12 row" style="background: #FFF; margin-top: 10px;">

                                <div class="col-sm-12" style=" margin-top: 10px;">
                                    <img src="images/hoa/${p.flowerId.image}" class="col-sm-3" width="150px"
                                         class="img-rounded" alt="Cinque Terre">
                                    <div class="col-sm-9">
                                        <h4>${p.flowerId.name}</h4>
                                    </div>

                                </div>
                                <div class="col-sm-10"></div><div class="col-sm-2 padding-right" >Số lượng: ${p.amount}</div>
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: ${p.price}đ</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : ${p.totalprice}đ</h4></div>

                                <div class="col-sm-12">
                                    <div class="col-sm-8">
                                    </div>
                                    <div class="col-sm-4 row" style=" margin-bottom: 10px;">
                                        <a href="#" class="btn btn-default check_out col-sm-12" style="border-radius: 0px;">Mua lần nữa</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade in" id="waitforship" >
                        <c:forEach var="p" items="${waitforship}">
                            <div  class="col-md-12 row" style="background: #FFF; margin-top: 10px;">

                                <div class="col-sm-12" style=" margin-top: 10px;">
                                    <img src="images/hoa/${p.flowerId.image}" class="col-sm-3" width="150px"
                                         class="img-rounded" alt="Cinque Terre">
                                    <div class="col-sm-9">
                                        <h4>${p.flowerId.name}</h4>
                                    </div>

                                </div>
                                <div class="col-sm-10"></div><div class="col-sm-2 padding-right" >Số lượng: ${p.amount}</div>
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: ${p.price}đ</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : ${p.totalprice}đ</h4></div>

                                <div class="col-sm-12">
                                    <div class="col-sm-8">
                                    </div>
                                    <div class="col-sm-4 row" style=" margin-bottom: 10px;">
                                        <a href="#" class="btn btn-default check_out col-sm-12" style="border-radius: 0px;">Mua lần nữa</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade in" id="shipping" >
                        <c:forEach var="p" items="${shipping}">
                            <div  class="col-md-12 row" style="background: #FFF; margin-top: 10px;">

                                <div class="col-sm-12" style=" margin-top: 10px;">
                                    <img src="images/hoa/${p.flowerId.image}" class="col-sm-3" width="150px"
                                         class="img-rounded" alt="Cinque Terre">
                                    <div class="col-sm-9">
                                        <h4>${p.flowerId.name}</h4>
                                    </div>

                                </div>
                                <div class="col-sm-10"></div><div class="col-sm-2 padding-right" >Số lượng: ${p.amount}</div>
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: ${p.price}đ</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : ${p.totalprice}đ</h4></div>

                                <div class="col-sm-12">
                                    <div class="col-sm-8">
                                    </div>
                                    <div class="col-sm-4 row" style=" margin-bottom: 10px;">
                                        <a href="#" class="btn btn-default check_out col-sm-12" style="border-radius: 0px;">Mua lần nữa</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade in" id="claimed" >
                        <c:forEach var="p" items="${claimed}">
                            <div  class="col-md-12 row" style="background: #FFF; margin-top: 10px;">

                                <div class="col-sm-12" style=" margin-top: 10px;">
                                    <img src="images/hoa/${p.flowerId.image}" class="col-sm-3" width="150px"
                                         class="img-rounded" alt="Cinque Terre">
                                    <div class="col-sm-9">
                                        <h4>${p.flowerId.name}</h4>
                                    </div>

                                </div>
                                <div class="col-sm-10"></div><div class="col-sm-2 padding-right" >Số lượng: ${p.amount}</div>
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: ${p.price}đ</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : ${p.totalprice}đ</h4></div>

                                <div class="col-sm-12">
                                    <div class="col-sm-8">
                                    </div>
                                    <div class="col-sm-4 row" style=" margin-bottom: 10px;">
                                        <a href="#" class="btn btn-default check_out col-sm-12" style="border-radius: 0px;">Mua lần nữa</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
