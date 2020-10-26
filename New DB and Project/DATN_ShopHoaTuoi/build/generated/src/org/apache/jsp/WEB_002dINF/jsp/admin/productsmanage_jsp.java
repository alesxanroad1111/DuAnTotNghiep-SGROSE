package org.apache.jsp.WEB_002dINF.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class productsmanage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("    <div class=\"col-md-12 row\">\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("            <div class=\"col-md-12 text-center\">\r\n");
      out.write("                <h2>Bảng sản phẩm</h2>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- Đây là nội dung cái của trang -->\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-md-12\">\r\n");
      out.write("                <table class=\"table table-condensed\" ng-app=\"myapp\" ng-controller=\"myctrl\">\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>ID</th>\r\n");
      out.write("                            <th>Tên hoa</th>\r\n");
      out.write("                            <th>Loại hoa</th>\r\n");
      out.write("                            <th>Số lượng</th>\r\n");
      out.write("                            <th>Giá</th>\r\n");
      out.write("                            <th>Ngày tạo</th>\r\n");
      out.write("                            <th>Ngày sửa</th>\r\n");
      out.write("                            <th>Edit</th>\r\n");
      out.write("                            <th></th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("                <ul class=\"pagination justify-content-center\">\r\n");
      out.write("                    <li class=\"page-item\"><a class=\"page-link\" href=\"#\" ng-click=\"prev()\">Previous</a></li>\r\n");
      out.write("                    <li class=\"page-item\"><a class=\"page-link\" href=\"#\" ng-click=\"next()\">Next</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-12 text-center\">\r\n");
      out.write("                <h2>Thông tin chi tiết</h2>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-12 row\">\r\n");
      out.write("                <form class=\"col-md-8\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label >Mã hoa</label>\r\n");
      out.write("                        <input class=\"form-control\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label >Tên hoa</label>\r\n");
      out.write("                        <input class=\"form-control\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label >Loại hoa</label>\r\n");
      out.write("                        <input class=\"form-control\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label >Số lượng</label>\r\n");
      out.write("                        <input class=\"form-control\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label >Giá</label>\r\n");
      out.write("                        <input class=\"form-control\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label >Notes</label>\r\n");
      out.write("                        <input class=\"form-control\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("                <div class=\"col-md-4\">\r\n");
      out.write("                    <div class=\"\">\r\n");
      out.write("                        <img src=\"./assets/Hoakhaitruong/Chucthanhcong.jpg\" alt=\"\" style=\"width:100%\">\r\n");
      out.write("                        <div class=\"text-center\">\r\n");
      out.write("                            <h4>Ảnh sản phẩm</h4>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>");
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
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${flowers}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                            <tr>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.typeid.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.amount}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.price}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.createtimes}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rows.createtimes}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                                <td> <i class=\"material-icons\">done_outline</i></td>\r\n");
          out.write("                                <td><i class=\"material-icons\">delete</i></td>\r\n");
          out.write("                            </tr>\r\n");
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
