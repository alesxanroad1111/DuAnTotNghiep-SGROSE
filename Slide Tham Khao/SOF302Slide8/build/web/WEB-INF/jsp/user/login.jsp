<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Validation & Interceptor</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	<h2>LOGIN</h2>
	${message}
	<form action="user/login.htm" method="post">
            <div>
                    <label>Username</label>
                    <input name="id"/>
            </div>

            <div>
                    <label>Password</label>
                    <input name="password"/>
            </div>

            <div>
                    <button>Login</button>
            </div>
	</form>
</body>
</html>
