<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<base href="${pageContext.servletContext.contextPath}/">
<script src="assets/js/jquery-3.1.1.min.js"></script>

<nav class="navbar navbar-default navbar-fixed">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand"><s:message code="global.header.welcome" /></a>
		</div>
		<div class="collapse navbar-collapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="?lang=en" data-lang="en"> <span>English</span>
				</a></li>
				<li><a href="?lang=vi" data-lang="vi"> <span>Tiếng
							Việt</span>
				</a></li>
				<li><c:if test="${sessionScope.account.fullName == null}">
						<a href="admin/login/"> <span><s:message
									code="global.header.login" /></span>
						</a>
					</c:if></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown"> <span> <s:message
								code="global.header.hello" />: <span style="color: red;">${sessionScope.account.fullName}</span>
					</span>
				</a></li>
				<%-- <li><a
						href="${pageContext.request.contextPath }/admin/login/logout.htm"
						onclick="return confirm('Bạn chắc chắn chứ ?')"> <span><s:message
									code="global.header.logout" /></span></a></li> --%>
				<c:if test="${sessionScope.account.fullName != null}">
					<li><a
						href="${pageContext.request.contextPath }/admin/login/logout.htm"
						onclick="return confirm('Bạn chắc chắn chứ ?')"> <span><s:message
									code="global.header.logout" /></span></a></li>
					<li><a href="admin/account/FormeditPass/${account.email}.htm"
						type="button" rel="tooltip" title="Đổi Mật Khẩu"
						class="btn btn-info btn-simple btn-xs"> <i class="fa fa-edit"></i>
					</a></li>
				</c:if>
				<li class="separator hidden-lg hidden-md"></li>
			</ul>
		</div>
	</div>
</nav>
<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("home?lang=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>