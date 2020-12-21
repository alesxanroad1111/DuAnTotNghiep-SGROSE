<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="rt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="home">Home</a></li>
                <li class="active">Giỏ Hàng</li>
            </ol>
        </div>
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
                                <a class="cart_quantity_delete" href="user/buy/${o.product.id}?yeucau=bosp&txtmasp=${o.product.id}"><i class="fa fa-times"></i></a>
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
</section> <!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>Bạn có muốn thanh toán giỏ hàng?</h3>
            <p>Vui lòng chọn Thanh Toán để tiếp tục nhập thông tin của bạn và hoàn tất thanh toán.</p>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>
                        <li>Phí Ship Hàng <span>Free</span></li>
                        <li>Tổng Tiền <span><fmt:formatNumber value = "${total}" type = "number"/> VNĐ</span></li>
                    </ul>
                    <a class="btn btn-default update" href="">Cập Nhật</a>
                    <a class="btn btn-default check_out" href="user/checkouts">Thanh Toán</a>
                </div>
            </div>
        </div>
    </div>
</section><!--/#do_action-->