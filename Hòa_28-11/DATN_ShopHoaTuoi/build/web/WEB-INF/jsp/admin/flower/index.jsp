<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="description" content="Bootstrap.">  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta charset="utf-8"/>

<div class="content">       
    <div class="col-md-12 row">
        <div class="container-fluid">
            <a class="btn btn-success btn-hover" href="admin/flower/update.htm">add</a>
            <div class="card">
                    <div class="card-header card-header-success">
                    <h4 class="card-title ">Flowers Manager</h4>
                    <p class="card-category">danh sách</p>

                </div>
                <!-- Đây là nội dung cái của trang -->

                <div class="col-md-12 table-responsive">
                    <table id="myTable" class="table ">
                        <thead class="text-primary">
                            <tr>
                                <th>ID</th>
                                <th>Tên hoa</th>
                                <th>Loại hoa</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Image</th>
                                <th>Ngày tạo</th>
                                <th>Ngày sửa</th>
                                <th></th>
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
                                    <td><img src="images/hoa/${f.image}" id="blah" width="60"/></td>
                                    <td>${f.createdtime}</td>
                                    <td>${f.updatedtime}</td>
                                    <td><a href="admin/flower/edit/show/${f.id}.htm"><img src="https://img.icons8.com/nolan/50/edit.png" width="31"/></a></td>
                                    <td><a href="admin/flower/edit/delete/${f.id}.htm"><img src="https://img.icons8.com/nolan/64/delete-sign.png" width="31"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                </div>

            </div>
        </div>
    </div>
   