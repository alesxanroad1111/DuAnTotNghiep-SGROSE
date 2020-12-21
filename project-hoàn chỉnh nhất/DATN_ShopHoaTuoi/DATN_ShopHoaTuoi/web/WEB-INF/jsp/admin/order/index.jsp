<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">

    <div class="col-md-12 row">
        <div class="container-fluid">
            <a class=" btn-circle btn-circle-lg m-1" href="admin/order/update"><img src="images/icon/plus.png" width="70"/></a>
            <div class="card">
                ${message}
                <div class="card-header card-header-success">
                    <h4 class="card-title ">Orders Manager</h4>
                    <p class="card-category">Danh sách</p>
                </div>
                </br>
                <!-- Đây là nội dung cái của trang -->
                <div class="category-tab"><!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" class="btn btn-success" data-toggle="tab">Tất cả</a></li>
                            <li><a href="#blazers" class="btn btn-success" data-toggle="tab">Chưa thanh toán</a></li>
                            <li><a href="#sunglass" class="btn btn-success" data-toggle="tab">Thanh toán</a></li>
                            <li><a href="#kids" class="btn btn-success" data-toggle="tab">Đang chờ lấy hàng</a></li>
                            <li><a href="#poloshirt" class="btn btn-success" data-toggle="tab">Đang giao hàng</a></li>
                            <li><a href="#sunglass1" class="btn btn-success" data-toggle="tab">Đã nhận hàng</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane container active" id="home">
                            <table id="myTable" class="table">
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
                                        <th ></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="rows" items="${orders}">
                                        <tr>
                                            <td>${rows.id}</td>
                                            <td>${rows.userid.name}</td>
                                            <td>${rows.address}</td>
                                            <td>${rows.totalmoney}.VNĐ</td>
                                            <td>${rows.status.name}</td>
                                            <td>${rows.ispaid.name}</td>
                                            <td>${rows.createdtime}</td>
                                            <td>${rows.updatedtime}</td>
                                            <td><a href="admin/order/edit/show/${rows.id}"><img src="images/icon/edit.png" width="31"/></a></td>
                                            <td><a href="admin/order/edit/delete1/${rows.id}"><img src="images/icon/delete.png" width="31"/></td>
                                            <td><a href="admin/order/details/${rows.id}"><img src="images/icon/info.png" width="31" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>

                        <div class="tab-pane fade" id="blazers" >
                            <!--aduvip-->
                             <table id="myTable1" class="table">
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
                                        <th ></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="i" items="${ordersispaid}">
                                        <tr>
                                            <td>${i.id}</td>
                                            <td>${i.userid.name}</td>
                                            <td>${i.address}</td>
                                            <td>${i.totalmoney}.VNĐ</td>
                                            <td>${i.status.name}</td>
                                            <td>${i.ispaid.name}</td>
                                            <td>${i.createdtime}</td>
                                            <td>${i.updatedtime}</td>
                                            <td><a href="admin/order/edit/show/${i.id}"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/order/edit/delete1/${i.id}"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <td><a href="admin/order/details/${i.id}"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>

                        <div class="tab-pane fade" id="sunglass" >
                            <table id="myTable2" class="table">
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
                                        <th ></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="a" items="${ordersispaid2}">
                                        <tr>
                                            <td>${a.id}</td>
                                            <td>${a.userid.name}</td>
                                            <td>${a.address}</td>
                                            <td>${a.totalmoney}.VNĐ</td>
                                            <td>${a.status.name}</td>
                                            <td>${a.ispaid.name}</td>
                                            <td>${a.createdtime}</td>
                                            <td>${a.updatedtime}</td>
                                            <td><a href="admin/order/edit/show/${a.id}"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/order/edit/delete1/${a.id}"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <td><a href="admin/order/details/${a.id}"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                        
                        <div class="tab-pane fade" id="kids" >
                            <table id="myTable3" class="table">
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
                                        <th ></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="x" items="${orderstatus}">
                                        <tr>
                                            <td>${x.id}</td>
                                            <td>${x.userid.name}</td>
                                            <td>${x.address}</td>
                                            <td>${x.totalmoney}.VNĐ</td>
                                            <td>${x.status.name}</td>
                                            <td>${x.ispaid.name}</td>
                                            <td>${x.createdtime}</td>
                                            <td>${x.updatedtime}</td>
                                            <td><a href="admin/order/edit/show/${x.id}"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/order/edit/delete1/${x.id}"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <td><a href="admin/order/details/${x.id}"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                        
                        <div class="tab-pane fade" id="poloshirt" >
                            <table id="myTable4" class="table">
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
                                        <th ></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="x1" items="${orderstatus1}">
                                        <tr>
                                            <td>${x1.id}</td>
                                            <td>${x1.userid.name}</td>
                                            <td>${x1.address}</td>
                                            <td>${x1.totalmoney}.VNĐ</td>
                                            <td>${x1.status.name}</td>
                                            <td>${x1.ispaid.name}</td>
                                            <td>${x1.createdtime}</td>
                                            <td>${x1.updatedtime}</td>
                                            <td><a href="admin/order/edit/show/${x1.id}"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/order/edit/delete1/${x1.id}"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <td><a href="admin/order/details/${x1.id}"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                        <div class="tab-pane fade" id="sunglass1" >
                            <table id="myTable6" class="table">
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
                                        <th ></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="az" items="${orderstatus2}">
                                        <tr>
                                            <td>${az.id}</td>
                                            <td>${az.userid.name}</td>
                                            <td>${az.address}</td>
                                            <td>${az.totalmoney}.VNĐ</td>
                                            <td>${az.status.name}</td>
                                            <td>${az.ispaid.name}</td>
                                            <td>${az.createdtime}</td>
                                            <td>${az.updatedtime}</td>
                                            <td><a href="admin/order/edit/show/${az.id}"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/order/edit/delete1/${az.id}"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <td><a href="admin/order/details/${az.id}"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div><!--/category-tab-->
                

            </div>
        </div>
    </div>
</div>

<meta name="description" content="Bootstrap.">  
<script src="./assets/js/core/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#myTable').dataTable({
            "pageLength": 7,
            "ordering": false,
            "info": false,
            "bLengthChange": false
        });

    });
     $(document).ready(function () {
        $('#myTable1').dataTable({
            "pageLength": 7,
            "ordering": false,
            "info": false,
            "bLengthChange": false
        });

    });
     $(document).ready(function () {
        $('#myTable2').dataTable({
            "pageLength": 7,
            "ordering": false,
            "info": false,
            "bLengthChange": false
        });

    });
     $(document).ready(function () {
        $('#myTable3').dataTable({
            "pageLength": 7,
            "ordering": false,
            "info": false,
            "bLengthChange": false
        });

    });
     $(document).ready(function () {
        $('#myTable4').dataTable({
            "pageLength": 7,
            "ordering": false,
            "info": false,
            "bLengthChange": false
        });

    });
    $(document).ready(function () {
        $('#myTable6').dataTable({
            "pageLength": 7,
            "ordering": false,
            "info": false,
            "bLengthChange": false
        });

    });
</script>
