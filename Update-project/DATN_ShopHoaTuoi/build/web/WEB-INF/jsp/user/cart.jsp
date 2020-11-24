<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="user/home.htm">Home</a></li>
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
                        <td class="quantity">Số lượng</td>
                        <td class="total">Tổng tiền</td>
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
                                <h4><a href="user/product/${o.product.id}.htm">${o.product.name}</a></h4>
                                <p>ID: ${o.product.id}</p>
                            </td>
                            <td class="cart_price">
                                <p>${o.product.price} VNĐ</p>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button">
                                    <a class="cart_quantity_up" href="user/buy/${o.product.id}.htm?yeucau=minus&txtmasp=${o.product.id}"> - </a>
                                    <input class="cart_quantity_input" type="text" name="quantity" value="${o.quantity}" autocomplete="off" size="2">
                                    <a class="cart_quantity_up" href="user/buy/${o.product.id}.htm?yeucau=plus&txtmasp=${o.product.id}"> + </a>
                                </div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price">${o.product.price * o.quantity} VNĐ</p>
                            </td>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="user/cart.htm?yeucau=bosp&txtmasp=${o.product.id}"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">&nbsp;</td>
                            <td colspan="2">
                                <table class="table table-condensed total-result">
                                    <tr>
                                        <td><a class="btn btn-default add-to-cart" href="user/home.htm">Tiếp Tục Mua Hàng</a></td>
                                        <td><a class="btn btn-default add-to-cart" href="user/cart.htm?yeucau=deleteall">Xóa Tất Cả</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>


    </div>
</section> <!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>What would you like to do next?</h3>
            <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="chose_area">
                    <ul class="user_option">
                        <li>
                            <input type="checkbox">
                            <label>Use Coupon Code</label>
                        </li>
                        <li>
                            <input type="checkbox">
                            <label>Use Gift Voucher</label>
                        </li>
                        <li>
                            <input type="checkbox">
                            <label>Estimate Shipping & Taxes</label>
                        </li>
                    </ul>
                    <ul class="user_info">
                        <li class="single_field">
                            <label>Country:</label>
                            <select>
                                <option>United States</option>
                                <option>Bangladesh</option>
                                <option>UK</option>
                                <option>India</option>
                                <option>Pakistan</option>
                                <option>Ucrane</option>
                                <option>Canada</option>
                                <option>Dubai</option>
                            </select>

                        </li>
                        <li class="single_field">
                            <label>Region / State:</label>
                            <select>
                                <option>Select</option>
                                <option>Dhaka</option>
                                <option>London</option>
                                <option>Dillih</option>
                                <option>Lahore</option>
                                <option>Alaska</option>
                                <option>Canada</option>
                                <option>Dubai</option>
                            </select>

                        </li>
                        <li class="single_field zip-field">
                            <label>Zip Code:</label>
                            <input type="text">
                        </li>
                    </ul>
                    <a class="btn btn-default update" href="">Get Quotes</a>
                    <a class="btn btn-default check_out" href="">Continue</a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>
                        <li>Phí Ship Hàng <span>Free</span></li>
                        <li>Tổng Tiền <span>${total} VNĐ</span></li>
                    </ul>
                    <a class="btn btn-default update" href="">Update</a>
                    <a class="btn btn-default check_out" href="">Check Out</a>
                </div>
            </div>
        </div>
    </div>
</section><!--/#do_action-->