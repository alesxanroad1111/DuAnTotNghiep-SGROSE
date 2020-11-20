<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>
	<%
		System.out.println("employee/detail.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-user">
						<div class="image">
							<img
								src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=500&q=75&w=800"
								alt="..." />
						</div>
						<div class="content">
							<div class="author">
								<a> <img class="avatar border-gray"
									src="assets/img/${employee.photo }" width="300" height="200" />
									<h4 class="title" style="font-weight: bold;">
										${employee.nameEmployee }<br /> <small>${employee.nameEmployee }</small>
									</h4>
								</a>
							</div>

							<h5 style="text-align: center;">
								<span class="category">Giới Tính: </span>
								<c:choose>
									<c:when test="${employee.gender < 2 }"> Nam </c:when>
									<c:when test="${employee.gender >= 2}"> Nữ </c:when>
								</c:choose>
							</h5>


							<h5 style="text-align: center;">
								<span class="category">Địa Chỉ: </span> ${employee.address }
							</h5>

							<h5 style="text-align: center;">
								<span class="category">Số Điện Thoại: </span>
								${employee.numberPhone }
							</h5>

							<h5 style="text-align: center;">
								<span class="category">Địa Chỉ Email: </span> ${employee.email}
							</h5>

							<h5 style="text-align: center;">
								<span class="category">Phòng Ban: </span>
								${employee.department.nameDepartment}
							</h5>

							<h5 style="text-align: center;">
								<span class="category">Chức Vụ: </span>
								${employee.position.namePosition}
							</h5>

							<h5 style="text-align: center;">
								<span class="category">Loại Nhân Viên: </span>
								${employee.employeeType.nameEmployeeType}
							</h5>

						</div>
						<hr>
						<div class="text-center">
							<a href="admin/employee/" class="btn btn-simple"> <i
								class="fa">Quay Lại</i>
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>