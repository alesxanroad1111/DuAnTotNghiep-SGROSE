<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="rt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Check out</li>
            </ol>
        </div><!--/breadcrums-->
        <div class="checkout-options">
            <h3>${nameuser} ${user.name}</h3>
            <p>${user.email}</p>
        </div><!--/checkout-options-->

        <div class="register-req">
            <p>${message}</p>
        </div><!--/register-req-->
        ${thongbao}
        <div class="shopper-informations">
            <div class="row">
                <div class="col-sm-3">
                    <div class="shopper-info">
                        <p>Thông Tin Liên Hệ</p>
                        <form:form action="user/dat-hang-thanh-cong" modelAttribute="order" method="POST" >
                            <form:input path="name" name="txtname" type="text" value="${user.name}" placeholder="Họ Và Tên"/>
                            <form:input path="numberphone" name="txtnumberphone" type="text" value="${user.phone}" placeholder="Số Điện Thoại"/>
                            <form:input path="email" name="txtemail" type="email" value="${user.email}" placeholder="Email"/>
                            <form:input path="address" name="txtaddress" value="${user.address}" placeholder="Địa Chỉ"/>
                            <button class="btn btn-primary">Thanh Toán</button>
                        </form:form>

                    </div>
                </div>

                <div class="col-sm-9">
                    <div class="order-message">
                        <p>Giỏ Hàng Của Bạn</p>
                        <div class="table-responsive cart_info">
                            <table class="table table-condensed">
                                <thead>
                                    <tr class="cart_menu">
                                        <td class="image"></td>
                                        <td class="description">Hoa</td>
                                        <td class="price">Giá</td>
                                        <td class="quantity">Số Lượng</td>
                                        <td class="total">Tổng Tiền</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="o"  items="${giohang}">
                                        <tr>
                                            <td class="cart_product">
                                                <a href=""><img src="images/hoa/${o.product.image}" width="120" alt=""></a>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="user/product/${o.product.id}">${o.product.name}</a></h4>
                                                <p>ID: ${o.product.id}</p>
                                            </td>
                                            <td class="cart_price">
                                                <p><fmt:formatNumber value = "${o.product.price}" type = "number"/>₫</p>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <a class="cart_quantity_up" href="user/buy/${o.product.id}?yeucau=minus&txtmasp=${o.product.id}"> - </a>
                                                    <input class="cart_quantity_input" type="text" name="quantity" value="${o.quantity}" autocomplete="off" size="2">
                                                    <a class="cart_quantity_up" href="user/buy/${o.product.id}?yeucau=plus&txtmasp=${o.product.id}"> + </a>
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price"><fmt:formatNumber value = "${o.product.price * o.quantity}" type = "number"/>₫</p>
                                            </td>
                                            <td class="cart_delete">
                                                <a class="cart_quantity_delete" href="user/cart?yeucau=bosp&txtmasp=${o.product.id}"><i class="fa fa-times"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                        <td colspan="2">
                                            <table class="table table-condensed total-result">
                                                <tr>
                                                    <td><a class="btn btn-default add-to-cart" href="home">Tiếp Tục Mua Hàng</a></td>
                                                    <td><a class="btn btn-default add-to-cart" href="user/cart?yeucau=deleteall">Xóa Tất Cả</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                        <td colspan="2">
                                            <table class="table table-condensed total-result">
                                                <tr>
                                                    <td>Tổng Tiền Của Tất Cả Hàng</td>
                                                    <td><fmt:formatNumber value = "${total}" type = "number"/>₫</td>
                                                </tr>
                                                <tr class="shipping-cost">
                                                    <td>Phí Ship</td>
                                                    <td>Free</td>										
                                                </tr>
                                                <tr>
                                                    <td>Tổng</td>
                                                    <td><span><fmt:formatNumber value = "${total}" type = "number"/>₫</span></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>	
                </div>					
            </div>
        </div>
        <div class="review-payment">
            <h2>Review & Payment</h2>
        </div>
    </div>
</section>
