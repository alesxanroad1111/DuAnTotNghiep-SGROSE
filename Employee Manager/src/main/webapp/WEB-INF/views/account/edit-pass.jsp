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
<title>Edit Password</title>
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
								<s:message code="account.edit.title" />
							</h4>
							<div style="font-weight: bold; color: red">${message }</div>
						</div>
						<div class="content">
							<form:form action="admin/account/editPass/${account.email}.htm"
								method="POST" commandName="account">
								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Địa Chỉ Email: <form:errors path="email"
													class="error" /></label>
											<form:input path="email"
												placeholder="Địa chỉ email của bạn..." size="30"
												maxlength="30" class="form-control" readonly="true" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Nhập mật khẩu mới: <form:errors
													path="password" class="error" /></label>
											<form:input path="password"
												placeholder="Nhâp lại mật khẩu mới của bạn..." size="30"
												maxlength="30" class="form-control" />
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
	</div>


</body>
</html>