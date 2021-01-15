<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="rt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section id="slider" style="margin-top: 50px; margin-bottom: 20px;">
    <div class="container">
        <div class="col-md-7">
            <div class="customer_cart">
                <div class="card-title">
                    <div class="row">
                        <table>
                            <tbody>
                                <tr class="col-xs-12">
                                    <td>

                                    </td>
                                    <td>
                                        <h3>${dathang} </h3>
                                        <p style="color: red;">${message}</p>
                                        <p>Mã đơn hàng <span  style="color: orange;">#${idorder.id}</span></p>
                                        <p>Cảm ơn bạn đã đặt đơn hàng tại <span  style="color: orange;">#SG-ROSE</span></p>
                                        <p>Hotline hỗ trợ(miễn phí) <span  style="color: orange;">#0829069648</span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="order-detail">
                <div class="preorder_info">
                    <p style="font-size: 18px;">Thông tin đơn hàng</p>
                    <p>Thông tin giao hàng</p>
                    <p style="color: orange;">#${dulieuorder.name}</p>
                    <p style="color: orange;">#${dulieuorder.email}</p>
                    <p style="color: orange;">#${dulieuorder.numberphone}</p>
                    <p style="color: orange;">#${dulieuorder.address}</p>
                    <p>Thanh toán <span style="color: orange;">#${satus}</span></p>
                    <p>Trạng thái <span style="color: orange;">#${ispaid}</span></p>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="col-xs-6">
                    <a href="user/check-order" class="btn btn-primary btn-block">Theo dõi đơn hàng</a>
                </div>
                <div class="col-xs-6">
                    <a href="home" class="btn btn-primary btn-block">Quay lại trang chủ</a>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="order-info">
                <div class="order_item_content">
                    <div class="cart_price">
                        <div class="cart_item">
                            <div class="item_price">
                                <div class="item_title_price">Tạm tính</div>
                                <div class="item_content_price" style="color: orange;"><fmt:formatNumber value = "${total}" type = "number"/>₫</div>
                            </div>
                        </div>
                        <div class="cart_item">
                            <div class="item_price">
                                <div class="item_title_price">Phí ship</div>
                                <div class="item_content_price" style="color: orange;">0 đ</div>
                            </div>
                        </div>
                        <div class="cart_item">
                            <div class="item_price">
                                <div class="item_title_price">Khuyến mãi</div>
                                <div class="item_content_price" style="color: orange;">0 đ</div>
                            </div>
                        </div>
                    </div>
                    <div class="cart_total">
                        <div class="price_total">
                            <div class="price_title_total">Tổng cộng</div>
                            <div class="price_content_total">
                                <div class="row-payment-total">
                                    <span class="payment" style="color: orange;"><fmt:formatNumber value = "${total}" type = "number"/>₫</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="notice">
                    <p>
                        <span class="attention">*</span>
                        Đơn hàng của quý khách sẽ được giao trong giờ hành chính, từ thứ 2 - thứ 7. Quý khách vui
                        lòng chú ý điện thoại để nhận hàng nhanh nhất nhé!
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<style>
    atar-uploader button, .form-horizontal button{
        background: #FE980F;
        border-radius: 0;
        color: white;
    }
    *[role="form"] h2 { 
        font-family: 'Open Sans' , sans-serif;
        font-size: 40px;
        font-weight: 600;
        color: #000000;
        margin-top: 5%;
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 4px;
    }
    *[role="form"] {
        max-width: 530px;
        padding: 15px;
        margin: 0 auto;
        border-radius: 0.3em;
        background-color: white;
    }
    .preorder_info{
        padding: 20px;
        margin: 20px;
        border: 1px solid #a09ea0;
        border-radius: 15px;
    }
    .btn btn-return {
        background: #464646;
        color: #fff;
        font-size: 18px;
        border-radius: 4px;
        border: none;
        padding: 8px 20px;
        float: left;
        margin: 20px auto;
    }
    .cart_price {
        padding: 5px 0;
    }
    .cart_item{
        padding: 6px 0;
    }
    .item_price {
        overflow: auto;
        font-size: 16px;
    }
    .item_title_price{
        width: 30%;
        float: left;
    }
    .item_content_price{
        width: 70%;
        float: right;
        text-align: right;
    }
    .cart_total {
        border-top: 1px solid #a09ea0;
        border-bottom: 1px solid #f8af6f;
        padding: 10px 0;
    }
    .price_total{
        overflow: auto;
        font-size: 16px;
    }
    .price_title_total{
        width: 30%;
        float: left;
    }
    .price_content_total{
        width: 70%;
        float: right;
        text-align: right;
    }
    .row-payment-total{
        font-size: 22px;
    }
    .notice{
        margin: 20px 0;
    }
    .notice p{
        text-align: justify;
    }
    .attention{
        color: #df0024;
        font-weight: bold;
    }
</style>
