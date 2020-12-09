<%
    String view = request.getParameter("view");
    if (view.startsWith("admin/")) {
        pageContext.forward("admin-layout.jsp");
    } else if (view.startsWith("user/")) {
        pageContext.forward("layout.jsp");
    } else if (view.startsWith("login")) {
        pageContext.forward("login.jsp");
    } else if (view.startsWith("register")) {
        pageContext.forward("register.jsp");
    } else if (view.startsWith("home")) {
        pageContext.forward("layout.jsp");
    } else {
        pageContext.forward("404.jsp");
    }
%>