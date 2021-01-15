<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<section id="cart_items">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div>
                    <h2><img src="https://img.icons8.com/plasticine/100/000000/check.png" width="35px" />
                        Kiểm tra đơn hàng</h2>
                </div>
                <form action="user/kiem-tra-don-hang" method="GET">
                    <div class="form-group">
                        <label for="usr">Số điện thoại</label>
                        <input name="phone" type="text" class="form-control" id="usr">
                        <div class="modal-footer ">
                            <button type="submit" class="btn btn-info">
                                Tra Cứu Hàng
                            </button>
                        </div>
                    </div>
                </form>
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
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: <fmt:formatNumber value = "${p.price}" type = "number"/>₫</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : <fmt:formatNumber value = "${p.totalprice}" type = "number"/>₫</h4></div>
                                

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
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: <fmt:formatNumber value = "${p.price}" type = "number"/>₫</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : <fmt:formatNumber value = "${p.totalprice}" type = "number"/>₫</h4></div>

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
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: <fmt:formatNumber value = "${p.price}" type = "number"/>₫</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : <fmt:formatNumber value = "${p.totalprice}" type = "number"/>₫</h4></div>

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
                                <div class="col-sm-9"></div><div class="col-sm-3 padding-right" style="border-bottom: 1px solid #F2f2f2;">Đơn giá: <fmt:formatNumber value = "${p.price}" type = "number"/>₫</div>
                                <div class="col-sm-12"><h4 style="color:orange;">Tổng Giá   : <fmt:formatNumber value = "${p.totalprice}" type = "number"/>₫</h4></div>

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
</div>
</section>
