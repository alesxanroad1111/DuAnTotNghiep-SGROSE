<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Employee</title>
</head>
<body>
	<%
		System.out.println("employee/edit-employee.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-9">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="employee.edit.title" />
							</h4>
						</div>
						<div class="content">
							<form:form action="admin/employee/edit-empl/${employee.id}.htm"
								method="POST" commandName="employee">
								<!-- 3 Dòng  -->
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Mã Nhân Viên: <form:errors path="id"
													class="error" /></label>
											<form:input path="id" placeholder="Mã nhân viên..."
												readonly="true" class="form-control" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Tên Nhân Viên: (<span style="color: red;">*</span>)<form:errors
													path="nameEmployee" class="error" /></label>
											<form:input path="nameEmployee"
												placeholder="Tên nhân viên..." size="30" maxlength="30"
												class="form-control" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="exampleInputEmail1">Thư Điện Tử: (<span
												style="color: red;">*</span>)<form:errors path="email"
													class="error" /></label>
											<form:input path="email" placeholder="Email..." size="30"
												maxlength="30" class="form-control" />
										</div>
									</div>
								</div>
								<!-- 3 Dòng -->
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Địa Chỉ: (<span style="color: red;">*</span>)<form:errors
													path="address" class="error" /></label>
											<form:input path="address" placeholder="Địa chỉ..."
												class="form-control" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Số Điện Thoại: (<span style="color: red;">*</span>)<form:errors
													path="numberPhone" class="error" /></label>
											<form:input path="numberPhone" placeholder="Số Điện Thoại..."
												size="12" maxlength="12" class="form-control" value="" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Ngày Sinh: (<span style="color: red;">*</span>)<form:errors
													path="birthday" class="error" /></label>
											<form:input path="birthday" placeholder="dd/MM/yyyy..."
												class="form-control" />
										</div>
									</div>
								</div>

								<!-- 2 Dòng -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Giới Tính: (<span style="color: red;">*</span>)
											</label>
											<form:select path="gender" class="form-control">
												<form:option value="1">Nam</form:option>
												<form:option value="2">Nữ</form:option>
											</form:select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Hình Ảnh: (<span style="color: red;">*</span>)<form:errors
													path="photo" class="error" /></label>
											<form:input path="photo" type="file" class="form-control" />
										</div>
									</div>
								</div>

								<!-- 3 Cột -->

								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Loại Nhân Viên</label>
											<form:select path="employeeType.id" items="${employeeType}"
												itemValue="id" itemLabel="nameEmployeeType"
												class="form-control" />
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<label>Phòng Ban</label>
											<form:select path="department.id" items="${department}"
												itemValue="id" itemLabel="nameDepartment"
												class="form-control" />
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<label>Chức Vụ</label>
											<form:select path="position.id" items="${position}"
												itemValue="id" itemLabel="namePosition" class="form-control" />
										</div>
									</div>


								</div>

								<div class="clearfix"></div>
								<button type="submit" class="btn btn-info btn-fill pull-right">
									<s:message code="employee.edit.process" />
								</button>
								<div class="clearfix"></div>

							</form:form>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card card-user">
						<div class="image">
							<img
								src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400"
								alt="..." />
						</div>
						<div class="content">
							<div class="author">
								<a> <img class="avatar border-gray"
									src="assets/img/${employee.photo }" />
									<h4 class="title">
										${employee.nameEmployee }<br /> <small>${employee.nameEmployee }</small>
									</h4>
								</a>
							</div>
							<p class="description text-center">
								Giới tính:
								<c:choose>
									<c:when test="${employee.gender < 2 }"> Nam </c:when>
									<c:when test="${employee.gender >= 2}"> Nữ </c:when>
								</c:choose>
								<br> Địa chỉ: ${employee.address } <br> SĐT:
								${employee.numberPhone } <br> Email: ${employee.email }
							</p>
						</div>
						<hr>
						<div class="text-center">
							<a type="button" href="#" class="btn btn-simple"> <i
								class="fa fa-facebook-square"></i>
							</a> <a type="button" href="#" class="btn btn-simple"> <i
								class="fa fa-twitter"></i>
							</a> <a type="button" href="#" class="btn btn-simple"> <i
								class="fa fa-google-plus-square"></i>
							</a>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>