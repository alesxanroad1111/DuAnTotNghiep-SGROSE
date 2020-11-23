<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <table class="table table-borderless col-sm-12">
        <thead>
            <tr>
                <th>Name</th>
                <th>Địa chỉ</th>
                <th>Fax</th>
                <th>Link</th>
                <th>Hình ảnh</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                 <c:forEach var="c" items="${companys}">
                <td>${c.name}</td>
                <td>${c.address}</td>
                <td>${c.fax}</td>
                <td>${c.link}</td>
                <th>${c.images}</th>
                
                 </c:forEach>
            </tr>
        </tbody>
    </table>
</div>