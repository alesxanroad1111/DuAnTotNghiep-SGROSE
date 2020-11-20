<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="sidebar" data-color="azure"
	data-image="assets/img/sidebar-4.jpg">
	<div class="sidebar-wrapper">
		<div class="logo">
			<a href="http://facebook.com/laym2k" class="simple-text"> <s:message
					code="global.menu.welcome" />
			</a>
		</div>

		<ul class="nav">
			<li><a href="home"> <i class="pe-7s-graph"></i>
					<p>
						<s:message code="global.menu.home" />
					</p>
			</a></li>
			<li><a href="admin/account/"> <i class="pe-7s-user"></i>
					<p>
						<s:message code="global.menu.qltk" />
					</p>
			</a></li>
			<li><a href="admin/employee/"> <i class="pe-7s-note2"></i>
					<p>
						<s:message code="global.menu.qlnv" />
					</p>
			</a></li>
			<li><a href="admin/contract/"> <i class="pe-7s-news-paper"></i>
					<p>
						<s:message code="global.menu.qlhd" />
					</p>
			</a></li>
			<li><a href="admin/info/department"> <i
					class="pe-7s-science"></i>
					<p>
						<s:message code="global.menu.ttpb" />
					</p>
			</a></li>
			<li><a href="admin/record/report"> <i class="pe-7s-bell"></i>
					<p>
						<s:message code="global.menu.xh" />
					</p>
			</a></li>
			<li><a href="admin/email/"> <i class="pe-7s-map-marker"></i>
					<p>
						<s:message code="global.menu.lh" />
					</p>
			</a></li>
			<li class="active-pro"><a href="https://www.facebook.com/laym2k">
					<i class="pe-7s-rocket"></i>
					<p>Trần Lâm</p>
			</a></li>
		</ul>
	</div>
</div>
