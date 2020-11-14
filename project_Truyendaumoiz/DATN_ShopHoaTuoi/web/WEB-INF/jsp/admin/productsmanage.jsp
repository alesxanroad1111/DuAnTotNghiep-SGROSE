<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold">Bảng sản phẩm</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12">
                <table class="table table-dark table-striped table-hover">
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
                                <td>Hoa ${rows.name}</td>
                                <td>${rows.typeid.name}</td>
                                <td>${rows.amount}</td>
                                <td>${rows.price}</td>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
                                <td><a href="admin/${rows.id}.htm"><i class="material-icons">done_outline</i></a></td>
                                <td><a href="admin/delete/${rows.id}.htm"><i class="material-icons">delete</i></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


            </div>
            <div class="col-md-12 text-center">
                <h2>Thông tin chi tiết</h2>
            </div>
            ${message}
            <div class="col-md-12 row">
                <form:form action="${pageContext.request.contextPath}/admin.htm" modelAttribute="flower" method="get" class="col-md-12 row"    >
                    <div class="col-md-8">
                        <div class="form-group">
                            <label >Mã hoa</label>
                            <form:input path="id" cssClass="form-control" disabled="true" />
                        </div>
                        <div class="form-group">
                            <label >Tên hoa</label>
                            <form:input path="name" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Loại hoa</label>

                            <form:input path="typeid.id" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Số lượng</label>
                            <form:input path="amount" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Giá</label>
                            <form:input path="price" cssClass="form-control"/>
                        </div>
                        <div class="form-group" hidden>
                            <label >Giá</label>
                            <form:input path="image" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Notes</label>
                            <form:input path="notes" cssClass="form-control"/>
                        </div>
                        <div class="form-group text-center">
                            <input name="btnInsert" class="btn btn-default" type="submit" value="Insert" />
                            <input name="btnUpdate" class="btn btn-default" type="submit" value="Update" />
                            <input name="btnReset" class="btn btn-default" type="submit" value="Reset" />
                        </div> 
                    </div>

                    <div class="row col-md-4">
                        <form class="md-form">
                            <div class="file-field">
                                <img src="images/hoa/${flower.image}" width="100%"/>
                            </div>
                        </form>
                    </div>
                </form:form>
            </div>

        </div>

    </div>
</div>