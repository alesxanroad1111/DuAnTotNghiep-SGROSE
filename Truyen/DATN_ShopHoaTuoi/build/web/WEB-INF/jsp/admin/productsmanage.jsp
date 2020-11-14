<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <ul class="nav nav-tabs" role="tablist">
         <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#menu1">Các loại hoa</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home">Quản lý hoa</a>
        </li>
       
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <div id="home" class="container tab-pane active"><br>
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
                ${message}
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
                            <div class="form-group" hidden>
                                <label >Giá</label>
                                <form:input path="image" cssClass="form-control"/>
                            </div>
                            <div class="form-group">
                                <label >Notes</label>
                                <form:textarea path="notes" cssClass="form-control"/>
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
                                    <input path="image" type="file" class="form-control-file border">
                                    </form>
                                    </form>
                                </div>
                            </form:form>
                    </div>

                </div>
            </div>
        </div>
        <div id="menu1" class="container tab-pane active"><br>
            <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold text-primary">Bảng loại hoa</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->

            <div class="col-md-12">
                <table class="table table-dark table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên loại hoa</th>
                            <th>Image</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rows" items="${typesofflowers}">
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.name}</td>
                                <td>${rows.image}</td>
                                <td><a href="#"><i class="material-icons">done_outline</i></a></td>
                                <td><a href="#"><i class="material-icons">delete</i></td>
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