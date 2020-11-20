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
<title>List Employees</title>
</head>
<body>
	<%
		System.out.println("employee/index.jsp");
	%>
	<div class="content">
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
							<form:form action="admin/employee/filter.htm" method="get">
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
													code="global.department" /></option>
											<c:forEach var="department" items="${listDepartment}">
												<option value="${department.id}">${department.nameDepartment}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<button type="submit" class="btn btn-danger btn-fill">
											<s:message code="global.search" />
										</button>
									</div>
								</div>
							</form:form>
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
										<th>STT</th>
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
										<th>Chức Vụ</th>-->
										<th>Chức Năng</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach items="${listEmployee}" var="employee"
										varStatus="itr">
										<tr>
											<c:set var="count" value="${count+1 }" />
											<td>${count}</td>
											<td>${employee.id }</td>
											<td><a href="admin/employee/detail/${employee.id}.htm"
												class="text-warning">${employee.nameEmployee }</a></td>
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
											<td>${employee.position.namePosition }</td> --%>
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
									<a type="button" href="admin/employee/?page=${row.index}"
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

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>


<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		demo.initChartist();

		$.notify({
			icon : 'pe-7s-gift',
			message : "Cảm ơn bạn đã trỏ tới <b> => Quản Lý Nhân Viên </b> "

		}, {
			type : 'danger',
			timer : 1
		});

	});
</script>

</html>