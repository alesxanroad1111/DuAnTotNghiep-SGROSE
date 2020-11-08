<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset="utf-8"/>
	<title>Spring MVC</title>
</head>
<body>
	<h1>${company.name}</h1>
	<img src="${company.logo}">
	<div>${company.slogan}</div>
	<hr>
</body>
</html>
