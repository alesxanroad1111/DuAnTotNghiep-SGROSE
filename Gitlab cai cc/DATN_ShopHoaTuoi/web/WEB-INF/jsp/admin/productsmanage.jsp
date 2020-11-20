<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold text-primary"><strong>DANH SÁCH SẢN PHẨM</strong></h2>
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
                        <c:forEach var="f" items="${flowers}">
                            <tr>
                                <td>${f.id}</td>
                                <td>Hoa ${f.name}</td>
                                <td>${f.typeid.name}</td>
                                <td>${f.amount}</td>
                                <td>${f.price}</td>
                                <td>${f.createdtime}</td>
                                <td>${f.updatedtime}</td>
                                <td><a href="admin/show/${f.id}.htm"><i class="material-icons">done_outline</i></a></td>
                                <td><a href="admin/delete/${f.id}.htm"><i class="material-icons">delete</i></td>
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
                <h2 class="text-primary">Thông tin chi tiết</h2>
            </div>
            <div class="col-md-12 row">
                <form:form action="${pageContext.request.contextPath}/admin/productsmanage.htm" modelAttribute="flower" method="get" class="col-md-12 row"    >
                    <div class="col-md-8">
                        <div class="form-group">
                            <!--                            <label >Mã hoa</label>-->
                            <form:hidden    path="id"  cssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label >Tên hoa</label>
                            <form:input path="name" cssClass="form-control" />
                            <form:errors path="name"/>
                        </div>
                        <div class="form-group">
                            <label >Loại hoa</label><br>
                            <form:select path="typeid.id" cssClass="bg-dark form-control"
                                         items="${typesofflowers}" itemValue="id" itemLabel="name" />
                        </div>
                        <div class="form-group">
                            <label >Số lượng</label>
                            <form:input path="amount" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Giá</label>
                            <form:input path="price" cssClass="form-control"/>
                        </div>
                        <div class="text-primary">
                            <label >Hình Ảnh</label>
                            <form:input path="image" type="file" class="btn btn-primary" cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Notes</label>
                            <form:textarea path="notes"  cssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label >Ngày Tạo</label><br>
                            <form:input path="createdtime" id="date"  name="date"  cssClass="form-control bg-dark "  readonly="true" />
                        </div>
                        <div class="form-group text-center">
                            <input name="btnInsert" class="btn btn-default" type="submit" value="Insert" />
                            <input name="btnUpdate" class="btn btn-default" type="submit" value="Update" />
                            <input name="btnReset" class="btn btn-default" type="submit" value="Reset" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="text-primary">
                            <label >Hình Ảnh</label>
                             <img src="images/hoa/${flower.image}" width="100%"/>
                            <form:input path="image" type="file" class="btn btn-primary" cssClass="form-control"/>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    function getDate() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }

        today = dd + '/' + mm + '/' + yyyy;
        console.log(today);
        document.getElementById("date").value = today;
    }


    window.onload = function () {
        getDate();
    };
</script>