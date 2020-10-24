   
<%
	String view = request.getParameter("view");
	if(view.startsWith("admin/")){
		pageContext.forward("admin-layout.jsp");
	}
	else if(view.startsWith("user/")){
                pageContext.forward("layout.jsp");
	}
	else{
		pageContext.forward("blank-layout.jsp");
	}
%>