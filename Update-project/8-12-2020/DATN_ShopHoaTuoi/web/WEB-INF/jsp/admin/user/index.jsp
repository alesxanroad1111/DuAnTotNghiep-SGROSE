<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">

    <div class="col-md-12 row">
        <div class="container-fluid">
            
            <div class="card">
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
                            <li><a href="#blazers" class="btn btn-success" data-toggle="tab">Actives</a></li>
                            <li><a href="#sunglass" class="btn btn-success" data-toggle="tab">Ban</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <table id="myTable" class="table">
                                <thead class="text-primary">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Email</th>
                                        <th>Địa chỉ</th>
                                        <th>Phone</th>
                                        <th>Password</th>
                                        <th>Avatar</th>
                                        <th>Giới tính</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Ngày sửa</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="u" items="${users}">
                                        <tr>
                                            <td>${u.id}</td>
                                            <td>${u.name}</td>
                                            <td>${u.email}</td>
                                            <td>${u.address}</td>
                                            <td>${u.phone}</td>
                                            <td>${u.password}</td>
                                            <td><img src="images/avatar/${u.avatar}" id="blah" width="60"/></td>
                                            <td>${u.gender.name}</td>
                                            <td>${u.isactive.name}</td>
                                            <td>${u.createdtime}</td>
                                            <td>${u.updatedtime}</td>
                                            <td> <a href="admin/user/edit/${u.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/user/delete2/${u.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <!--<td><a href="admin/user/actives/${u.id}.htm"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>-->
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
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Email</th>
                                        <th>Địa chỉ</th>
                                        <th>Phone</th>
                                        <th>Password</th>
                                        <th>Avatar</th>
                                        <th>Giới tính</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Ngày sửa</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="c" items="${actives1}">
                                        <tr>
                                            <td>${c.id}</td>
                                            <td>${c.name}</td>
                                            <td>${c.email}</td>
                                            <td>${c.address}</td>
                                            <td>${c.phone}</td>
                                            <td>${c.password}</td>
                                            <td><img src="images/avatar/${c.avatar}" id="blah" width="60"/></td>
                                            <td>${c.gender.name}</td>
                                            <td>${c.isactive.name}</td>
                                            <td>${c.createdtime}</td>
                                            <td>${c.updatedtime}</td>
                                            <td> <a href="admin/user/edit/${c.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/user/delete2/${c.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <!--<td><a href="admin/user/actives/${u.id}.htm"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>-->
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>

                        <div class="tab-pane fade" id="sunglass" >
                            <!--aduvip-->
                            <table id="myTable2" class="table">
                                <thead class="text-primary">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Email</th>
                                        <th>Địa chỉ</th>
                                        <th>Phone</th>
                                        <th>Password</th>
                                        <th>Avatar</th>
                                        <th>Giới tính</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Ngày sửa</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach var="a" items="${actives2}">
                                        <tr>
                                            <td>${a.id}</td>
                                            <td>${a.name}</td>
                                            <td>${a.email}</td>
                                            <td>${a.address}</td>
                                            <td>${a.phone}</td>
                                            <td>${a.password}</td>
                                            <td><img src="images/avatar/${a.avatar}" id="blah" width="60"/></td>
                                            <td>${a.gender.name}</td>
                                            <td>${a.isactive.name}</td>
                                            <td>${a.createdtime}</td>
                                            <td>${a.updatedtime}</td>
                                            <td> <a href="admin/user/edit/${a.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                            <td><a href="admin/user/delete2/${a.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                            <!--<td><a href="admin/user/actives/${u.id}.htm"><img src="https://img.icons8.com/flat_round/64/000000/info.png" width="31" /></a></td>-->
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
<!--<div class="modal fade" id="mymodal" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thông tin hóa đơn</h4>
            </div>
            <div class="modal-body">

                <label>Mã hóa đơn:</label></br>
                <label>Tên hóa đơn:</label></br>
                <label>Tên khách hàng:</label></br>
                <label>Ten sản phẩm:</label></br>
                <label>Số lượng:</label></br>
                <label>Tổng tiền:</label></br>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>-->
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

</script>
