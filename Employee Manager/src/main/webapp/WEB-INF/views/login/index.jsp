<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<style>
table {
	width: 50%;
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
</style>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>
	<%
		System.out.println("login/index.jsp");
	%>

	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;"></h4>
						</div>
						<div class="content">
							<div style="text-align: center;">
								<h2>
									<b><s:message code="login.form" /></b>
								</h2>
								<br>
							</div>

							<center>
								<form:form method="post"
									action="${pageContext.request.contextPath}/admin/login/login.htm"
									commandName="loginForm">
									<div style="color: red">${message }</div>
									<table style="text-align: center;">
										<tr>
											<p>
												<form:errors path="email" />
											</p>
											<td><b><s:message code="login.email" />: </b></td>
											<td><form:input path="email" for="exampleInputEmail1"
													class="form-control" /></td>
										</tr>

										<tr>
											<p>
												<form:errors path="password" />
											</p>
											<td><b><s:message code="login.password" />: </b></td>
											<td><form:password path="password" class="form-control" />
											</td>

										</tr>

										<tr>
											<td><b><s:message code="login.remember" /></b></td>
											<td><input type="checkbox" name="remember" value="1"></td>
										</tr>

										<tr>
											<td colspan="2">
												<center>
													<button type="submit"
														class="btn btn-info btn-fill pull-right"
														value="${labelSubmit}">
														<s:message code="login.button" />
													</button>
												</center>
											</td>


										</tr>
									</table>
									<br>
									<br>
								</form:form>

							</center>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>