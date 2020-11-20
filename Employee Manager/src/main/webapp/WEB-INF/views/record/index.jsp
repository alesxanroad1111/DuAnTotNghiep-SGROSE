<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Record List</title>
</head>
<body>
	<%
		System.out.println("record/index.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="record.index.title" />
							</h4>
							<p class="category">
								<s:message code="global.text" />
							</p>
						</div>

						<div style="clear: both; width: 98%; margin: 10px auto;">
							<form:form action="admin/record/search.htm" method="get">
								<div class="col-md-2">
									<div class="form-group">
										<input type="text" name="search"
											placeholder="Tìm kiếm tài khoản" class="form-control" />
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<select name="filter" class="form-control">
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
								<a href="admin/record/add-record.htm" type="submit"
									class="btn btn-success btn-fill pull-right"><s:message
										code="record.add.title" /></a>

							</div>
						</div>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>STT</th>
										<th>Tên Nhân Viên</th>
										<th>Loại</th>
										<th>Lý Do</th>
										<th>Tiền</th>
										<th>Ngày Ghi Nhận</th>
										<th>Chức năng</th>
									</tr>

								</thead>
								<c:set var="count" value="0" />
								<tbody>
									<c:forEach items="${listRecord}" var="record">
										<tr>
											<c:set var="count" value="${count+1 }" />
											<td>${count}</td>
											<td><a href="" class="text-info">${record.employee.nameEmployee }</a></td>
											<td><c:choose>
													<c:when test="${record.type ==true}">Khen Thưởng</c:when>
													<c:otherwise>Kỷ Luật</c:otherwise>
												</c:choose></td>
											<td>${record.reason }</td>
											<td><f:formatNumber type="currency"
													value="${record.price }" pattern="###,###,###" /> VNĐ</td>
											<td><f:formatDate value="${record.dateWrite }"
													pattern="dd/MM/yyyy" />
											<td width="40px"><a
												href="admin/record/edit-record/${record.id}.htm"
												type="button" rel="tooltip" title="Sửa"
												class="btn btn-info btn-simple btn-xs"> <i
													class="fa fa-edit"></i>
											</a> <a href="admin/record/delete-record/${record.id}.htm"
												onclick="return confirm('Bạn chắc chắn chứ ?')"
												type="button" rel="tooltip" title="Xóa"
												class="btn btn-danger btn-simple btn-xs"> <i
													class="fa fa-times"></i>
											</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="margin: 10px; text-align: right;">
								<c:forEach begin="1" end="${rowCount}" varStatus="row">
									<a type="button" href="admin/record/?page=${row.index}"
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
			message : "Cảm ơn bạn đã trỏ tới <b> => Quản Lý Bản Ghi </b> "

		}, {
			type : 'success',
			timer : 1
		});

	});
</script>
</html>