<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold text-primary"><strong>DANH SÁCH HÓA ĐƠN</strong></h2>
            </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12">
                <table class="table table-dark table-striped table-hover" >
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
                                <td><a href="admin/edit/${rows.id}.htm"><i class="material-icons">done_outline</i></a></td>
                                <td><a href="admin/delete1/${rows.id}.htm"><i class="material-icons">delete</i></td>
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
                <h2 class="text-primary">Thông tin chi tiết</h2> ${message}
            </div>     
            <div class="col-md-12 row"><div class="col-md-2"></div>
                <form:form action="${pageContext.request.contextPath}/admin/ordersmanage.htm" modelAttribute="order" method="get" class="col-md-7">
                    <div class="form-group center">
                        <form:hidden path="id" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label >Mã khách hàng</label>
                        <form:input path="userid.id" class="form-control"  />
                    </div>
                    <div class="form-group">
                        <label >Địa chỉ</label>
                        <form:input path="address" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Tổng tiền</label>
                        <form:input path="totalmoney" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label >Trạng thái</label>
                        <div class="form-control">
                            <form:radiobutton path="status" value="1" label="Đã giao hàng"/>
                            <form:radiobutton path="status" value="2" label="Đang giao hàng"/>
                            <form:radiobutton path="status" value="3" label="Đang chờ giao hàng"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >Trạng thái thanh toán</label><br>
                        <div class="custom-control">
                            <form:radiobutton path="ispaid" value="1" label="Đã thanh toán"/>
                            <form:radiobutton path="ispaid" value="2" label="Chưa thanh toán"/>
                            <form:radiobutton path="ispaid" value="3" label="Đang chờ thanh toán"/>
                        </div>
                    </div>
                </div>
                <div class="form-group text-center" >
                        <input name="btnInsert" class="btn btn-default" type="submit" value="Insert" />
                        <input name="btnUpdate" class="btn btn-default" type="submit" value="Update" />
                        <input name="btnReset" class="btn btn-default" type="submit" value="Reset" />
                </div> 
            </form:form>
        </div>
    </div>
</div>
