<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="cart_items">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
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
            <div class="col-md-8">
                <h2> <img src="https://img.icons8.com/emoji/48/000000/star-emoji.png" width="35px"/> Danh sách đơn hàng</h2>
                <div id="list_order">
                    <div></div>
                    <div class="table-responsive cart_info" >
                        <table class="table table-condensed" width="300%">
                            <thead>
                                <tr class="cart_menu">
                                    <th>Ngày Mua Hàng</th>
                                    <th>Mã Đơn Hàng</th>
                                    <th>Tổng Giá</th>
                                    <th>Tình Trạng</th>
                                    <th>Họ Tên Khách Hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c"  items="${checkorder}">
                                    <tr>
                                        <td>${c.createdtime}</td>
                                        <td>${c.id}</td>
                                        <td>${c.totalmoney}</td>
                                        <td>${c.status.name}</td>
                                        <td>${c.name}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
