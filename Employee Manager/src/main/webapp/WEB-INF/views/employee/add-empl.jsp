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
<title>Add Employee</title>
</head>
<body>
	<%
		System.out.println("employee/add-employee.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="employee.add.title" />
							</h4>
						</div>
						<div class="content">
							<form:form action="admin/employee/save-empl.htm" method="POST"
								commandName="employee">
								<!-- 3 Dòng  -->
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Mã Nhân Viên: (<span style="color: red;">*</span>)<form:errors
													path="id" class="error" /></label>
											<form:input path="id" placeholder="Mã nhân viên..."
												class="form-control" value="" />
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
											<label>Giới Tính: (<span style="color: red;">*</span>)<form:errors
													path="gender" class="error" /></label>
											<form:select path="gender" class="form-control">
												<option selected="selected" value=0><s:message
														code="global.select" /></option>
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

								<!-- 3 Dòng -->

								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Loại Nhân Viên</label>
											<form:select path="employeeType.id" items="${employeeType}"
												itemValue="id" itemLabel="nameEmployeeType"
												class="form-control">
												<option selected="selected" value=0>Chọn</option>
												<form:option value=""></form:option>
											</form:select>
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
								<div class="text-center">
									<button type="submit"
										class="btn btn-success btn-fill pull-right">
										<s:message code="employee.add.process" />
									</button>
									<div class="clearfix"></div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="employee.index.title" />
							</h4>
							<p class="category">
								<s:message code="global.text" />
							</p>
						</div>
						<div style="clear: both; width: 98%; margin: 10px auto;">
							<form action="admin/employee/filter.htm">
								<div class="col-md-2">
									<div class="form-group">
										<input type="text" name="NV"
											placeholder="Tìm kiếm tên và mã nhân viên"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<select name="PB" class="form-control">
											<option selected="selected" value=""><s:message
													code="global.select" /></option>
											<c:forEach var="department" items="${listDepartment}">
												<option value="${department.id}">${department.nameDepartment}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<button type="submit" class="btn btn-danger btn-fill">Tìm
											kiếm</button>
									</div>
								</div>
							</form>
							<div>
								<a href="admin/employee/add-empl.htm" type="submit"
									class="btn btn-success btn-fill pull-right"><s:message
										code="employee.add.title" /></a>
							</div>
						</div>

						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Mã</th>
										<th>Tên Nhân Viên</th>
										<th>Giới Tính</th>
										<th>Ảnh</th>
										<th>Địa Chỉ</th>
										<th>Email</th>
										<th>SĐT</th>
										<th>Ngày Sinh</th>
										<!-- <th>Loại NV</th>
										<th>Phòng Ban</th>
										<th>Chức Vụ</th>
										<th>Khen Thưởng</th> -->
										<th>Chức Năng</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach items="${listEmployee}" var="employee">
										<tr>
											<td>${employee.id }</td>
											<td>${employee.nameEmployee }</td>
											<td><c:choose>
													<c:when test="${employee.gender < 2 }"> Nam </c:when>
													<c:when test="${employee.gender >= 2}"> Nữ </c:when>
												</c:choose></td>
											<td><img src="assets/img/${employee.photo }"
												style="width: 75px; height: 90px"></td>
											<td>${employee.address }</td>
											<td>${employee.email }</td>
											<td>${employee.numberPhone }</td>
											<td><f:formatDate value="${employee.birthday}"
													pattern="dd/MM/yyyy" /> <%-- <td>${employee.employeeType.nameEmployeeType}</td>
											<td>${employee.department.nameDepartment }</td>
											<td>${employee.position.namePosition }</td>
											<td>${employee.bonus.nameBonus }</td> --%>
											<td><a
												href="admin/employee/edit-empl/${employee.id}.htm"
												type="button" rel="tooltip" title="Sửa"
												class="btn btn-info btn-simple btn-xs"> <i
													class="fa fa-edit"></i>
											</a> <a href="admin/employee/delete-empl/${employee.id}.htm"
												onclick="return confirm('Bạn chắc chắn chứ ?')"
												type="button" rel="tooltip" title="Xóa"
												class="btn btn-danger btn-simple btn-xs"> <i
													class="fa fa-times"></i>
											</a> <a href="admin/employee/detail/${employee.id}.htm"
												type="button" rel="tooltip" title="Xem Chi Tiết"
												class="btn btn-success btn-simple btn-xs"> <i
													class="fa fa-times"></i>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="margin: 10px; text-align: right;">
								<c:forEach begin="1" end="${rowCount}" varStatus="row">
									<a type="button"
										href="admin/employee/add-empl.htm?page=${row.index}"
										class="btn btn-danger btn-xs btn-fill">${row.index}</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>