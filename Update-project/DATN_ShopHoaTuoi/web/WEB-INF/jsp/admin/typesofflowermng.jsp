<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 text-center">
                <h2 class="font-weight-bold">Bảng loại hoa</h2>
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