<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2>Bảng hóa đơn</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12 text-center">
                <table class="table table-condensed" ng-app="myapp" ng-controller="myctrl">
                    <thead>
                        <tr>
                            <th>Mã hóa đơn</th>
                            <th>Khách Hàng</th>
                            <th>Địa chỉ</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thanh toán</th>
                            <th>Ngày tạo</th>
                            <th>Ngày sửa</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rows" items="${orders}">
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.userid.name}</td>
                                <td>${rows.address}</td>
                                <td>${rows.totalmoney}</td>
                                <td>${rows.status}</td>
                                <td>${rows.ispaid}</td>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
                                <td> <i class="material-icons">done_outline</i></td>
                                <td><i class="material-icons">delete</i></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#" ng-click="prev()">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#" ng-click="next()">Next</a></li>
                </ul>
            </div>
            <div class="col-md-12 text-center">
                <h2>Thông tin chi tiết</h2>
            </div>
            <div class="col-md-12 row"><div class="col-md-2"></div>
                <form class="col-md-7">
                    <div class="form-group center">
                        <label >Mã hóa đơn</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Mã nhân viên</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Tên khách hàng</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Địa chỉ</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Tổng tiền</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Trạng thái</label><br>
                        <div class="radio">
                            <label><input type="radio" name="optradio" checked>Đang giao hàng</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio">Đã giao hàng</label>
                        </div>
                        <div class="radio disabled">
                            <label><input type="radio" name="optradio">Đang chờ giao hàng </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >Trạng thái thanh toán</label><br>
                        <div class="radio">
                            <label><input type="radio" name="optradio" checked>Chưa thanh toán</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio">Đã thanh toán</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="form-group text-center" >
                <button name="btnInsert" class="btn btn-default"><i class="material-icons">add_task</i></button>
                <button name="btnUpdate" class="btn btn-default"><i class="material-icons">arrow_circle_down</i></button>
                <button name="btnDelete" class="btn btn-default"><i class="material-icons">delete</i></button>
                <button name="btnReset" class="btn btn-default"><i class="material-icons">autorenew</i></button>
            </div> 
        </div>
    </div>
</div>
