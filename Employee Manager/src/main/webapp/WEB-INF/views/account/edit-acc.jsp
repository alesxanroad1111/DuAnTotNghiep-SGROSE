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

<title>Edit Account</title>
<!-- <style>
table {
	width: 90%;
	border-collapse: collapse;
	margin: 10px auto;
}

tr:nth-of-type(odd) {
	background: #eee;
}

th {
	background: #13be3c;
	color: white;
	font-weight: bold;
}

td, th {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	font-size: 18px;
}
</style> -->
</head>
<body>
	<%
		System.out.println("account/edit-account.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="account.index.title" />
							</h4>
							<div style="font-weight: bold; color: red">${message }</div>
						</div>
						<div class="content">
							<form:form action="admin/account/edit-acc/${account.email}.htm"
								method="POST" commandName="account">
								<!-- 2 Cột  -->

								<form:hidden path="email" class="form-control" />
								<form:hidden path="password" class="form-control" />

								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Họ Và Tên: (<span style="color: red;">*</span>)<form:errors
													path="fullName" class="error" /></label>
											<form:input path="fullName"
												placeholder="Nhập tên đầy đủ của bạn..." size="30"
												maxlength="30" class="form-control" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Địa Chỉ: (<span style="color: red;">*</span>)<form:errors
													path="address" class="error" /></label>
											<form:input path="address"
												placeholder="Nhập địa chỉ của bạn..." size="30"
												maxlength="30" class="form-control" />
										</div>
									</div>
								</div>

								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Số Điện Thoại: (<span style="color: red;">*</span>)<form:errors
													path="numberPhone" class="error" /></label>
											<form:input path="numberPhone" type="number"
												placeholder="Nhập SĐT của bạn..." size="12" maxlength="12"
												class="form-control" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Quyền Truy Cập: (<span style="color: red;">*</span>)
											</label>
											<form:select path="access" class="form-control">
												<form:option value="1">Quản Trị Viên</form:option>
												<form:option value="2">Nhân Viên</form:option>
											</form:select>
										</div>
									</div>
								</div>


								<div class="clearfix"></div>
								<button type="submit" class="btn btn-info btn-fill pull-right">
									<s:message code="account.edit.process" />
								</button>
								<div class="clearfix"></div>

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
								<s:message code="account.index.title" />
							</h4>
							<p class="category">
								<s:message code="global.text" />
							</p>
						</div>

						<div style="clear: both; width: 98%; margin: 10px auto;">
							<form action="admin/account/search.htm">
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
							</form>
							<div>
								<a href="admin/account/add-acc.htm" type="submit"
									class="btn btn-success btn-fill pull-right"><s:message
										code="account.add.title" /></a>
							</div>
						</div>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>STT</th>
										<th>Email</th>
										<th>Mật Khẩu</th>
										<th>Họ Và Tên</th>
										<th>Địa Chỉ</th>
										<th>SDT</th>
										<th>Quyền Truy Cập</th>
										<th>Chức năng</th>
									</tr>

								</thead>
								<c:set var="count" value="0" />
								<tbody>
									<c:forEach items="${listAccount}" var="account">
										<tr>
											<c:set var="count" value="${count+1 }" />
											<td>${count}</td>
											<td>${account.email }</td>
											<td>${account.password }</td>
											<td>${account.fullName }</td>
											<td>${account.address }</td>
											<td>${account.numberPhone }</td>
											<td><c:choose>
													<c:when test="${account.access < 2 }"> Quản Trị Viên </c:when>
													<c:when test="${account.access >= 2}"> Nhân Viên </c:when>
												</c:choose></td>
											<td><a
												href="admin/account/edit-acc/${account.email}.htm"
												type="button" rel="tooltip" title="Sửa"
												class="btn btn-info btn-simple btn-xs"> <i
													class="fa fa-edit"></i>
											</a> <a href="admin/account/delete-acc/${account.email}.htm"
												onclick="return confirm('Bạn chắc chắn chứ ?')"
												type="button" rel="tooltip" title="Xóa"
												class="btn btn-danger btn-simple btn-xs"> <i
													class="fa fa-times"></i>
											</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>