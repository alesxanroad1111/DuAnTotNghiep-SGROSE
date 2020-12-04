<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath }/"/>
	<meta charset="utf-8"/>
	<title>Spring MVC - Databinding</title>
	
	<!-- Định dạng lỗi -->
	<style type="text/css">
	*[id$=errors]{
		color:red;
		font-style: italic;
	}
	</style>
</head>
<body>
	<h2>Quản lý sinh viên</h2>
	${message}
        <form:form action="student/validate2.htm" modelAttribute="student">
                <div>Họ và tên</div>
                <form:input path="name"/>
                <form:errors path="name"/>
                <div>Điểm</div>
                <form:input path="mark"/>
                <form:errors path="mark"/>
                <div>Chuyên ngành</div>
                <form:errors path="major" element="div"/>
                <form:radiobuttons path="major" items="${majors}" 
                        itemLabel="name" itemValue="id"/>
                <div>
                        <button>Validate 1</button>
                </div>
        </form:form>
</body>
</html>
