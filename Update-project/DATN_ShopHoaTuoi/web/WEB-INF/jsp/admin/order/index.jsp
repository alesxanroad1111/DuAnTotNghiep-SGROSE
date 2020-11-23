<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
      <a class="btn btn-primary" href="admin/order/update.htm">add</a>
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header card-header-success">
                  <h4 class="card-title ">Orders Manager</h4>
                  <p class="card-category">Danh sách</p>
                </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12 table-responsive ">
                <table class="table">
                    <thead class="text-primary">
                        <tr>
                            <th>Mã hóa đơn</th>
                            <th>Khách Hàng</th>
                            <th>Địa chỉ</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thanh toán</th>
                            <th>Ngày tạo</th>
                            <th>Ngày sửa</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rows" items="${orders}">
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.userid.name}</td>
                                <td>${rows.address}</td>
                                <td>${rows.totalmoney}</td>
                                <td>${rows.status.name}</td>
                                <td>${rows.ispaid.name}</td>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
                               <td><a href="admin/order/edit/show/${rows.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                               <td><a href="admin/order/edit/delete1/${rows.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>