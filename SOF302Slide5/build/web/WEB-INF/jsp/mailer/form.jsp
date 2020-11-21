<%@ page pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset="utf-8"/>
	<title>Send email</title>
</head>
<body>
	${message}
	<form action="mailer/send.htm" 	method="post">
		<p><input name="from" placeholder="From"></p>
		<p><input name="to" placeholder="To"></p>
		<p><input name="subject" placeholder="Subject"></p>
		<p><textarea name="body" placeholder="Body" 
                    rows="3" cols="30"></textarea></p>
		<button>Send</button>
	</form>
</body>
</html>
