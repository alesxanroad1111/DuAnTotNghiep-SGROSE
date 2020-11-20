<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mail</title>
</head>
<body>
	<%
		System.out.println("mail/form.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="header">
								<h4 class="title" style="font-weight: bold;">
									<s:message code="contact.email.title" />
								</h4>
								<p class="category">
									<s:message code="contact.email.text" />
								</p>
							</div>
							<div style="clear: both; width: 98%; margin: 10px auto;">
								<div class="content">
									<div class="row">
										<div class="col-md-12">
											<form:form action="admin/email/send.htm" method="post"
												modelAttribute="record">
												<div class="form-group">
													<label><s:message code="email.from" /> (<span
														style="color: red;">*</span>) </label> <input name="from"
														placeholder="Người gửi" class="form-control">
												</div>
												<div class="form-group">
													<label><s:message code="email.to" /> (<span
														style="color: red;">*</span>)</label> <input name="to"
														placeholder="Người nhận" class="form-control">
												</div>
												<div class="form-group">
													<label><s:message code="email.subject" /> (<span
														style="color: red;">*</span>)</label> <input name="subject"
														placeholder="Chủ đề" class="form-control">
												</div>
												<div class="form-group">
													<label><s:message code="email.body" /> (<span
														style="color: red;">*</span>)</label>
													<textarea name="body" placeholder="Nội dung tin nhắn"
														class="form-control" rows="3" cols="30"></textarea>
												</div>

												<button class="btn btn-danger btn-fill">
													<s:message code="contact.button" />
												</button>
												<span style="color: red;"> ${ message } </span>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="card">
							<div class="header">
								<h4 class="title" style="font-weight: bold;">
									<s:message code="contact.map.title" />
								</h4>
								<p class="category">
									<s:message code="contact.map.text" />
								</p>
							</div>
							<div class="content">
								<div class="row">
									<div class="col-md-12">
										<iframe
											src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.455226329217!2d106.62735611380073!3d10.852939092269615!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529e76ef4ac4d%3A0x30d6a9932e802efe!2sFPT%20Polytechnic%20HCM%20-%20C%C6%A1%20s%E1%BB%9F%203!5e0!3m2!1sen!2s!4v1582287128479!5m2!1sen!2s"
											width="748px" height="409px" frameborder="0"
											style="border: 2" allowfullscreen></iframe>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<p style="text-align: center; color: black;" class="category">
								<s:message code="contact.phone" />
								0941841519
							</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<p style="text-align: center; color: black;" class="category">
								<s:message code="contact.email" />
								tran.lam1992000@gmail.com
							</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<p style="text-align: center; color: black;" class="category">
								<s:message code="contact.address" />
								Cao Đẳng PFT Polytechnic Hồ Chí Minh
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>