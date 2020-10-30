package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_002dlayout_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        \r\n");
      out.write("        <title> Admin SG-Rose</title>\r\n");
      out.write("        <base href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"assets/img/new.ico\"/>\r\n");
      out.write("        <!-- Required meta tags -->\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\" name=\"viewport\" />\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("        <!--     Fonts and icons     -->\r\n");
      out.write("        <script src=\"assets/js/page.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"\r\n");
      out.write("              href=\"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css\">\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js\"></script>\r\n");
      out.write("        <!-- Material Kit CSS -->\r\n");
      out.write("        <link href=\"assets/css/material-dashboard.css?v=2.1.0\" rel=\"stylesheet\" />\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body class=\"dark-edition\">\r\n");
      out.write("        <div class=\"wrapper \">\r\n");
      out.write("            <div class=\"sidebar\" data-color=\"purple\" data-background-color=\"black\">\r\n");
      out.write("                <div class=\"logo\">\r\n");
      out.write("\r\n");
      out.write("                    <a href=\"#\" class=\"simple-text logo-normal\">\r\n");
      out.write("                        <img src=\"assets/img/new.png\">\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"sidebar-wrapper\">\r\n");
      out.write("                    <ul class=\"nav\">\r\n");
      out.write("                        <li class=\"nav-item active  \">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                <i class=\"material-icons\">dashboard</i>\r\n");
      out.write("                                <p>Thông tin</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>   \r\n");
      out.write("                        <li class=\"nav-item active  \">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"\">\r\n");
      out.write("                                <i class=\"material-icons\">local_florist</i>\r\n");
      out.write("                                <p>Quản lý sản phẩm</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item active  \">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                <i class=\"material-icons\">face</i>\r\n");
      out.write("                                <p>Quản lý nhân viên</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item active  \">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                <i class=\"material-icons\">perm_identity</i>\r\n");
      out.write("                                <p>Quản lý tài khoản</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item active  \">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                <i class=\"material-icons\">library_books</i>\r\n");
      out.write("                                <p>Quản lý hóa đơn</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"nav-item active  \">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                <i class=\"material-icons\">how_to_reg</i>\r\n");
      out.write("                                <p>Quản lý đối tác</p>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"main-panel\">\r\n");
      out.write("                <!-- Navbar -->\r\n");
      out.write("                <nav class=\"navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top \">\r\n");
      out.write("                    <div class=\"container-fluid\">\r\n");
      out.write("                        <div class=\"navbar-wrapper\">\r\n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">Admin Manage</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" aria-controls=\"navigation-index\"\r\n");
      out.write("                                aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                            <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                            <span class=\"navbar-toggler-icon icon-bar\"></span>\r\n");
      out.write("                            <span class=\"navbar-toggler-icon icon-bar\"></span>\r\n");
      out.write("                            <span class=\"navbar-toggler-icon icon-bar\"></span>\r\n");
      out.write("                        </button>\r\n");
      out.write("                        <div class=\"collapse navbar-collapse justify-content-end\">\r\n");
      out.write("                            <ul class=\"navbar-nav\">\r\n");
      out.write("                                <li class=\"nav-item\">\r\n");
      out.write("                                    <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                        <i class=\"material-icons\">person</i>Tên Tài khoản\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li class=\"nav-item\">\r\n");
      out.write("                                    <a class=\"nav-link\" href=\"#\">\r\n");
      out.write("                                        <i class=\"material-icons\">exit_to_app</i>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <!-- Ngay chỗ này edit cái tên người dùng với cái nút login -->\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </nav>\r\n");
      out.write("                \r\n");
      out.write("\r\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, (java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.view}", java.lang.String.class, (PageContext)_jspx_page_context, null), out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <footer class=\"footer\">\r\n");
      out.write("                    <div class=\"container-fluid\">\r\n");
      out.write("                        <nav class=\"float-left\">\r\n");
      out.write("                            <ul>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"https://www.creative-tim.com\">\r\n");
      out.write("                                        SG-ROSE\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </nav>\r\n");
      out.write("                        <div class=\"copyright float-right\">\r\n");
      out.write("                            &copy;\r\n");
      out.write("                            <script>\r\n");
      out.write("                                document.write(new Date().getFullYear())\r\n");
      out.write("                            </script>, made with <i class=\"material-icons\">favorite</i> by\r\n");
      out.write("                            <a href=\"https://www.creative-tim.com\" target=\"_blank\">SG-ROSE</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- your footer here -->\r\n");
      out.write("                    </div>\r\n");
      out.write("                </footer>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--   Core JS Files   -->\r\n");
      out.write("        <script src=\"assets/js/core/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/js/core/popper.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/js/core/bootstrap-material-design.min.js\"></script>\r\n");
      out.write("        <script src=\"https://unpkg.com/default-passive-events\"></script>\r\n");
      out.write("        <script src=\"assets/js/plugins/perfect-scrollbar.jquery.min.js\"></script>\r\n");
      out.write("        <!-- Place this tag in your head or just before your close body tag. -->\r\n");
      out.write("        <script async defer src=\"https://buttons.github.io/buttons.js\"></script>\r\n");
      out.write("        <!--  Google Maps Plugin    -->\r\n");
      out.write("        <!-- Chartist JS -->\r\n");
      out.write("        <script src=\"assets/js/plugins/chartist.min.js\"></script>\r\n");
      out.write("        <!--  Notifications Plugin    -->\r\n");
      out.write("        <script src=\"assets/js/plugins/bootstrap-notify.js\"></script>\r\n");
      out.write("        <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->\r\n");
      out.write("        <script src=\"assets/js/material-dashboard.js\"></script>\r\n");
      out.write("        <!-- Material Dashboard DEMO methods, don't include it in your project! -->\r\n");
      out.write("        <script src=\"assets/demo/demo.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
