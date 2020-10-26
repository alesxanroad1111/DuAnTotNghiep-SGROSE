package org.apache.jsp.WEB_002dINF.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class staff_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<section>\r\n");
      out.write("    <table class=\"table\">\r\n");
      out.write("    <thead class=\" text-primary\">\r\n");
      out.write("        <th>\r\n");
      out.write("            Id\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Name\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Email\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Password\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Birthday\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Address\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Avatar\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Gender\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Phone\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Role\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Time created\r\n");
      out.write("        </th>\r\n");
      out.write("        <th>\r\n");
      out.write("            Time updated\r\n");
      out.write("        </th>\r\n");
      out.write("    </thead>\r\n");
      out.write("    <tbody>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td>\r\n");
      out.write("                1\r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("            <td>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("    </tbody>\r\n");
      out.write("</table>\r\n");
      out.write("</section>\r\n");
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
