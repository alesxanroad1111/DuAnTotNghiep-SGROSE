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
<title>LamttPS09391</title>
<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						demo.initChartist();

						$
								.notify(
										{
											icon : 'pe-7s-gift',
											message : "Chào mừng bạn đã đến với ứng dụng web <b> Quản Lý Nhân Viên </b> => Trần Lâm Developer"

										}, {
											type : 'info',
											timer : 5
										});

					});
</script>
</head>
<body>
	<%
		System.out.println("index.jsp");
	%>

	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">
								<s:message code="home.index.title" />
							</h4>
							<p class="category">
								<s:message code="home.index.text" />
							</p>
						</div>

						<div class="content all-icons">
							<div class="row">
								<c:forEach var="topEmpl" items="${employee}">
									<div
										class="font-icon-list col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-6">
										<div class="font-icon-detail">
											<a href="#"><img src="assets/img/face-1.jpg" width="75px"
												height="100px" /><br> <br>${topEmpl[1]} </a><br>
											<span><s:message code="home.thanhtich" />
												${topEmpl[2]}</span> <br> <span><s:message
													code="home.diemso" /> ${topEmpl[4]}</span><br> <span><s:message
													code="home.price" /> <f:formatNumber type="currency"
													value="${topEmpl[5]}" pattern="###,###,###" /> VNĐ</span>
										</div>
									</div>
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