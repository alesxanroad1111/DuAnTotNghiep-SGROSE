<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2>Bảng sản phẩm</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12">
                <table class="table table-condensed" ng-app="myapp" ng-controller="myctrl">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên hoa</th>
                            <th>Loại hoa</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Ngày tạo</th>
                            <th>Ngày sửa</th>
                            <th>Edit</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rows" items="${flowers}">
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.name}</td>
                                <td>${rows.typeid.name}</td>
                                <td>${rows.amount}</td>
                                <td>${rows.price}</td>
                                <td>${rows.createtimes}</td>
                                <td>${rows.createtimes}</td>
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
            <div class="col-md-12 row">
                <form class="col-md-8">
                    <div class="form-group">
                        <label >Mã hoa</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Tên hoa</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Loại hoa</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Số lượng</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Giá</label>
                        <input class="form-control" >
                    </div>
                    <div class="form-group">
                        <label >Notes</label>
                        <input class="form-control" >
                    </div>
                </form>
                <div class="col-md-4">
                    <div class="">
                        <img src="./assets/Hoakhaitruong/Chucthanhcong.jpg" alt="" style="width:100%">
                        <div class="text-center">
                            <h4>Ảnh sản phẩm</h4>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>