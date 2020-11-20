<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Info-Employee</title>
<style>
table {
	width: 60%;
	border-collapse: collapse;
	margin: 10px auto;
}

tr:nth-of-type(odd) {
	background: #eee;
}

th {
	background: #4c13be;
	color: white;
	font-weight: bold;
}

td, th {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	font-size: 18px;
}

a {
	color: red;
	text-decoration: none;
}
</style>
</head>
<body>
	<center>
		<h1>Info Data</h1>
		<h3>Xin chào: ${sessionScope.account.fullName}</h3>
		<a href="${pageContext.request.contextPath }/admin/account/">Tài
			Khoản | </a> <a
			href="${pageContext.request.contextPath }/admin/employee/">Nhân
			Viên | </a> <a
			href="${pageContext.request.contextPath }/admin/login/logout.htm"
			onclick="return confirm('Bạn chắc chắn chứ ?')">Logout</a>
	</center>

	<!-- EmployeeType -->
	<table border="1px">
		<thead>
			<tr>
				<th width="50%">Mã Loại Nhân Viên</th>
				<th>Tên Loại Nhân Viên</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${listInfoLNV}" var="info">
				<tr>
					<td>${info.id }</td>
					<td>${info.nameEmployeeType }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<!-- Position -->
	<table border="1px">
		<thead>
			<tr>
				<th width="50%">Mã Chức Vụ</th>
				<th>Tên Chức Vụ</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${listInfoCV}" var="info">
				<tr>
					<td>${info.id }</td>
					<td>${info.namePosition }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- Bonus -->
	<table border="1px">
		<thead>
			<tr>
				<th>Mã Khen Thưởng</th>
				<th>Tên Khen Thưởng</th>
				<th>Giá</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${listInfoKT}" var="info">
				<tr>
					<td>${info.id }</td>
					<td>${info.nameBonus }</td>
					<td>${info.price }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>