package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class layout_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <base href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.servletContext.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/\">\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"author\" content=\"\">\r\n");
      out.write("        <title>SG-Rose</title>\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"assets/img/new.ico\"/> \r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/prettyPhoto.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/price-range.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/animate.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/main.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/responsive.css\" rel=\"stylesheet\">\r\n");
      out.write("        <!--[if lt IE 9]>\r\n");
      out.write("        <script src=\"js/html5shiv.js\"></script>\r\n");
      out.write("        <script src=\"js/respond.min.js\"></script>\r\n");
      out.write("        <![endif]-->       \r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/ico/favicon.ico\">\r\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"144x144\" href=\"images/ico/apple-touch-icon-144-precomposed.png\">\r\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"114x114\" href=\"images/ico/apple-touch-icon-114-precomposed.png\">\r\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"72x72\" href=\"images/ico/apple-touch-icon-72-precomposed.png\">\r\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" href=\"images/ico/apple-touch-icon-57-precomposed.png\">\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <header id=\"header\">\r\n");
      out.write("            <!--header-->\r\n");
      out.write("            <div class=\"header_top\">\r\n");
      out.write("                <!--header_top-->\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-sm-6\">\r\n");
      out.write("                            <div class=\"contactinfo\">\r\n");
      out.write("                                <ul class=\"nav nav-pills\">\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-phone\"></i> +84 829 069 648</a></li>\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-envelope\"></i> sgrose@gmail.com</a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-sm-6\">\r\n");
      out.write("                            <div class=\"social-icons pull-right\">\r\n");
      out.write("                                <ul class=\"nav navbar-nav\">\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-facebook\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-twitter\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-dribbble\"></i></a></li>\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!--/header_top-->\r\n");
      out.write("\r\n");
      out.write("            <div class=\"header-middle\">\r\n");
      out.write("                <!--header-middle-->\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-md-4 clearfix\">\r\n");
      out.write("                            <div class=\"logo pull-left\">\r\n");
      out.write("                                <a href=\"index.html\"><img src=\"images/logo/new.png\" alt=\"Logo_shop\"\r\n");
      out.write("                                                         /></a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-md-8 clearfix\">\r\n");
      out.write("                            <div class=\"shop-menu clearfix pull-right\">\r\n");
      out.write("                                <ul class=\"nav navbar-nav\">\r\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-user\"></i> Account</a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fa fa-crosshairs\"></i> Checkout</a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fa fa-shopping-cart\"></i> Cart</a></li>\r\n");
      out.write("                                    <li><a href=\"#\"><i class=\"fa fa-lock\"></i> Login</a></li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!--/header-middle-->\r\n");
      out.write("\r\n");
      out.write("            <div class=\"header-bottom\">\r\n");
      out.write("                <!--header-bottom-->\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-sm-9\">\r\n");
      out.write("                            <div class=\"navbar-header\">\r\n");
      out.write("                                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\"\r\n");
      out.write("                                        data-target=\".navbar-collapse\">\r\n");
      out.write("                                    <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mainmenu pull-left\">\r\n");
      out.write("                                <ul class=\"nav navbar-nav collapse navbar-collapse\">\r\n");
      out.write("                                    <li><a href=\"index.html\">Home</a></li>\r\n");
      out.write("                                    <li><a href=\"contact-us.html\">Giới thiệu</a></li>\r\n");
      out.write("                                    <li class=\"dropdown\"><a href=\"#\">Hoa tươi<i class=\"fa fa-angle-down\"></i></a>\r\n");
      out.write("                                        <ul role=\"menu\" class=\"sub-menu\">\r\n");
      out.write("                                            <li><a href=\"\">Hoa hồng đỏ</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Hoa hồng vàng</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Hoa hồng trắng</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Hoa tulip</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Hoa cúc</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Hoa hướng dương</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Hoa cẩm chướng</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Các loại hoa khác</a></li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </li>\r\n");
      out.write("                                    <li class=\"dropdown\"><a href=\"#\">Chủ đề hoa<i class=\"fa fa-angle-down\"></i></a>\r\n");
      out.write("                                        <ul role=\"menu\" class=\"sub-menu\">\r\n");
      out.write("                                            <li><a href=\"#\">Hoa chúc mừng</a></li>\r\n");
      out.write("                                            <li><a href=\"#\">Hoa tình yêu</a></li>\r\n");
      out.write("                                            <li><a href=\"#\">Hoa khai trương</a></li>\r\n");
      out.write("                                            <li><a href=\"#\">Hoa sinh nhật</a></li>\r\n");
      out.write("                                            <li><a href=\"#\">Hoa cưới</a></li>\r\n");
      out.write("                                            <li><a href=\"#\">Hoa chia buồn</a></li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </li>\r\n");
      out.write("                                    <li class=\"dropdown\"><a href=\"#\">Quà tặng<i class=\"fa fa-angle-down\"></i></a>\r\n");
      out.write("                                        <ul role=\"menu\" class=\"sub-menu\">\r\n");
      out.write("                                            <li><a href=\"\">Gấu bông</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Socola</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Bánh kem</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Giỏ trái cây</a></li>\r\n");
      out.write("                                            <li><a href=\"\">Giỏ quà tặng</a></li>\r\n");
      out.write("                                        </ul>\r\n");
      out.write("                                    </li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-sm-3\">\r\n");
      out.write("                            <div class=\"search_box pull-right\">\r\n");
      out.write("                                <input type=\"text\" placeholder=\"Search\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!--/header-bottom-->\r\n");
      out.write("        </header>\r\n");
      out.write("        <!--/header-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, (java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.view}", java.lang.String.class, (PageContext)_jspx_page_context, null), out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("       <footer id=\"footer\">\r\n");
      out.write("\t\t<!--Footer-->\r\n");
      out.write("\t\t<div class=\"footer-top\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"companyinfo\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2><span>SG</span>-Rose</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<p>Đây là shop hoa tươi không cần tưới</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-7\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"video-gallery text-center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"iframe-img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"images/home/iframe1.png\" alt=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"overlay-icon\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-play-circle-o\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Doanh Ngọc Diễm</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>20/10/2020</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"video-gallery text-center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"iframe-img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"images/ceo/ctruyen.jpg\" alt=\"\" style=\"width: 40px;\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"overlay-icon\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-play-circle-o\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Trần Công Truyền</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>20/10/2020</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"video-gallery text-center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"iframe-img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"images/home/iframe2.png\" alt=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"overlay-icon\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-play-circle-o\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Nguyễn Đức Hòa</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>20/10/2020</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"video-gallery text-center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"iframe-img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"images/home/iframe3.png\" alt=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"overlay-icon\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-play-circle-o\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Hồ Phi Long</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>20/10/2020</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"video-gallery text-center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"iframe-img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img src=\"images/home/iframe4.png\" alt=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"overlay-icon\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"fa fa-play-circle-o\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Trần Đại Hưng</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>20/10/2020</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"address\">\r\n");
      out.write("\t\t\t\t\t\t\t<iframe\r\n");
      out.write("\t\t\t\t\t\t\t\tsrc=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62706.19126010514!2d106.66183064710812!3d10.800821146647111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7649fa48af2a40ef!2zVlDEkEQgQ8O0bmcgdHkgUGjDoXQgdHJp4buDbiBQaOG6p24gbeG7gW0gUXVhbmcgVHJ1bmc!5e0!3m2!1svi!2s!4v1602660139339!5m2!1svi!2s\"\r\n");
      out.write("\t\t\t\t\t\t\t\theight=\"250px\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n");
      out.write("\t\t\t\t\t\t\t\ttabindex=\"0\"></iframe>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"footer-widget\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Dịch vụ</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Hỗ trợ trực tuyến</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Về chúng tôi</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Trạng thái đặt hàng</a></li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Tiện ích </h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Các loại hoa</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Quà tặng</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Chính sách</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Điều khoản sử dụng</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Chính sách bảo mật</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Chính sách hoàn tiền</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Hệ thống thanh toán</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>About SG-ROSE</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Thông tin về cửa hàng</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Việc làm</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Vị trí cửa hàngs</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Chương trình liên kết</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Copyright</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3 col-sm-offset-1\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Liên hệ SG-Rose</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<form action=\"#\" class=\"searchform\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Your email address\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-default\"><i\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tclass=\"fa fa-arrow-circle-o-right\"></i></button>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Hãy gửi mail để chúng tôi phản hồi <br> sớm nhất có thể</p>\r\n");
      out.write("\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"footer-bottom\">\r\n");
      out.write("\t\t\t<div class=\"container \">\r\n");
      out.write("\t\t\t\t<div class=\"text-center\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<p class=\"pull-left\">Copyright © 2020 SG-ROSE Inc. All rights reserved.</p>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t</footer>\r\n");
      out.write("\r\n");
      out.write("        <script src=\"js/jquery.js\"></script>\r\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery.scrollUp.min.js\"></script>\r\n");
      out.write("        <script src=\"js/price-range.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery.prettyPhoto.js\"></script>\r\n");
      out.write("        <script src=\"js/main.js\"></script>\r\n");
      out.write("    </body>\r\n");
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