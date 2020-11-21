<%@ page pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset="utf-8"/>
	<title>Tiêu đề</title>
</head>
<body>
	${message}
	<form action="uploader/upload.htm" 
		method="post" enctype="multipart/form-data">
		<div>File</div>
		<input type="file" name="image">
		<button>Upload</button>
	</form>
</body>
</html>
