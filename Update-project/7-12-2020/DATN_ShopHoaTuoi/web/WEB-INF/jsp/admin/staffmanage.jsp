<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center" >
                <h2>Quản Lý Nhân Viên</h2>
            </div>
            <!-- Đây là nội dung cái của trang -->
            <div class="col-md-12">
                <table id="myTable" class="col-md-12 table table-condensed text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Mail</th>
                            <th>Password</th>
                            <th>Birthday</th>                           
                            <th>Address</th>
                            <th>Gender</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Ngày tạo</th>
                            <th>Ngày sửa</th>
                            <th>Edit</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rows" items="${staffs}">
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.name}</td>
                                <td>${rows.email}</td>
                                <td>${rows.password}</td>
                                <td>${rows.birthday}</td>
                                <td>${rows.address}</td>
                                <th>${rows.gender}</th>
                                <th>0${rows.phone}</th>
                                <th>${rows.role}</th>
                                <td>${rows.createdtime}</td>
                                <td>${rows.updatedtime}</td>
<!--                                <td> <i class="material-icons">done_outline</i></td>
                                <td><i class="material-icons">delete</i></td>-->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
           
        </div>
    </div>
</div
     <meta name="description" content="Bootstrap.">  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>