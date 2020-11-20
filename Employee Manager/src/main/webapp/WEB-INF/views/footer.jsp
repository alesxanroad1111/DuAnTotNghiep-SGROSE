<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<footer class="footer">
	<div class="container-fluid">
		<nav class="pull-left">
			<ul>
				<li><a href="home"> <s:message code="global.footer.home" />
				</a></li>
				<li><a href="#"> <s:message code="global.footer.company" /></a></li>
				<li><a href="admin/employee/"> <s:message
							code="global.footer.file" />
				</a></li>
				<li><a href="#"> <s:message code="global.footer.news" />
				</a></li>
			</ul>
		</nav>
		<p class="copyright pull-right">
			&copy;
			<script>
					document.write(new Date().getFullYear())
				</script>
			<a href="http://www.facebook.com/laym2k">Tran Lam</a>
			<s:message code="global.footer.tranlam" />
		</p>
	</div>
</footer>