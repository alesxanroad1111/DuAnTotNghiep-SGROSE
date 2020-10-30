package org.apache.jsp.WEB_002dINF.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class usermanage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"content\">\n");
      out.write("    <div class=\"col-md-12 row\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"col-md-12 text-center\">\n");
      out.write("                <h2>Users</h2>\n");
      out.write("            </div>\n");
      out.write("            <!-- Đây là nội dung cái của trang -->\n");
      out.write("\n");
      out.write("            <div class=\"col-md-12 text-center\">\n");
      out.write("                <table class=\"table table-condensed\" ng-app=\"myapp\" ng-controller=\"myctrl\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>ID </th>\n");
      out.write("                            <th>Name</th>\n");
      out.write("                            <th>Emai</th>\n");
      out.write("                            <th>Address</th>\n");
      out.write("                            <th>Phone</th>\n");
      out.write("                            <th>Password</th>\n");
      out.write("                            <th>Avatar</th>\n");
      out.write("                            <th>Gender</th>\n");
      out.write("                            <th>Isactive</th>\n");
      out.write("                            <th>Createdtime</th>\n");
      out.write("                            <th>Updatedtime</th>\n");
      out.write("                            <th>Edit</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("                <ul class=\"pagination justify-content-center\">\n");
      out.write("                    <li class=\"page-item\"><a class=\"page-link\" href=\"#\" ng-click=\"prev()\">Previous</a></li>\n");
      out.write("                    <li class=\"page-item\"><a class=\"page-link\" href=\"#\" ng-click=\"next()\">Next</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-12 text-center\">\n");
      out.write("                <h2>Thông tin chi tiết</h2>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-12 row\"><div class=\"col-md-2\"></div>\n");
      out.write("                <form class=\"col-md-7\">\n");
      out.write("                    <div class=\"form-group center\">\n");
      out.write("                        <label >Mã hóa đơn</label>\n");
      out.write("                        <input class=\"form-control\" >\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label >Mã nhân viên</label>\n");
      out.write("                        <input class=\"form-control\" >\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label >Tên khách hàng</label>\n");
      out.write("                        <input class=\"form-control\" >\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label >Địa chỉ</label>\n");
      out.write("                        <input class=\"form-control\" >\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label >Tổng tiền</label>\n");
      out.write("                        <input class=\"form-control\" >\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label >Trạng thái</label><br>\n");
      out.write("                        <div class=\"radio\">\n");
      out.write("                            <label><input type=\"radio\" name=\"optradio\" checked>Đang giao hàng</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"radio\">\n");
      out.write("                            <label><input type=\"radio\" name=\"optradio\">Đã giao hàng</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"radio disabled\">\n");
      out.write("                            <label><input type=\"radio\" name=\"optradio\">Đang chờ giao hàng </label>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label >Trạng thái thanh toán</label><br>\n");
      out.write("                        <div class=\"radio\">\n");
      out.write("                            <label><input type=\"radio\" name=\"optradio\" checked>Chưa thanh toán</label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"radio\">\n");
      out.write("                            <label><input type=\"radio\" name=\"optradio\">Đã thanh toán</label>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group text-center\" >\n");
      out.write("                <button name=\"btnInsert\" class=\"btn btn-default\"><i class=\"material-icons\">add_task</i></button>\n");
      out.write("                <button name=\"btnUpdate\" class=\"btn btn-default\"><i class=\"material-icons\">arrow_circle_down</i></button>\n");
      out.write("                <button name=\"btnDelete\" class=\"btn btn-default\"><i class=\"material-icons\">delete</i></button>\n");
      out.write("                <button name=\"btnReset\" class=\"btn btn-default\"><i class=\"material-icons\">autorenew</i></button>\n");
      out.write("            </div> \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("rows");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                            <tr>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.password}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.avatar}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                  <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.gender}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                    <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.isactive}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.createdtime}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.updatedtime}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                <td> <i class=\"material-icons\">done_outline</i></td>\n");
          out.write("                                <td><i class=\"material-icons\">delete</i></td>\n");
          out.write("                            </tr>\n");
          out.write("                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
