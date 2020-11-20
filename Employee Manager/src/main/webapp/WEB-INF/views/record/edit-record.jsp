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

<title>Edit Record</title>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>
	<%
		System.out.println("record/edit-record.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="record.edit.title" />
							</h4>
						</div>
						<div class="content">
							<form:form action="admin/record/edit-record/${record.id}.htm"
								method="POST" commandName="record">
								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Tên Nhân Viên: </label>
											<form:hidden path="employee.id" readonly="true"
												class="form-control" />
											<form:input path="employee.nameEmployee" readonly="true"
												class="form-control" />
											<form:hidden path="dateWrite" readonly="true"
												class="form-control" />
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Loại Đánh Giá: (<span style="color: red;">*</span>)
											</label>
											<form:select path="type" class="form-control">
												<form:option value="true">Thành Tích</form:option>
												<form:option value="false">Kỷ Luật</form:option>
											</form:select>
										</div>
									</div>
								</div>
								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Lý Do: (<span style="color: red;">*</span>)<form:errors
													path="reason" /></label>
											<form:textarea path="reason" placeholder="Nhập lý do..."
												rows="1" class="form-control" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Số Tiền: (<span style="color: red;">*</span>)<form:errors
													path="price" /></label>

											<form:input path="price" type="number" class="form-control" />
										</div>
									</div>

								</div>

								<div class="clearfix"></div>
								<button type="submit" class="btn btn-info btn-fill pull-right">
									<s:message code="record.edit.process" />
								</button>
								<div class="clearfix"></div>

							</form:form>
						</div>
					</div>
				</div>

			</div>
		</div>

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
								<form:form action="admin/account/search.htm" method="get">
									<div class="col-md-2">
										<div class="form-group">
											<input type="text" name="search"
												placeholder="Tìm kiếm tài khoản" class="form-control" />
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
	</div>
</body>
</html>