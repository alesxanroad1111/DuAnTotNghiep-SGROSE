package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class check_005fout_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"author\" content=\"\">\r\n");
      out.write("    <title>Checkout | SG-Rose Check out</title>\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"css/prettyPhoto.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"css/price-range.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"css/animate.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/main.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/responsive.css\" rel=\"stylesheet\">\r\n");
      out.write("    <!--[if lt IE 9]>\r\n");
      out.write("    <script src=\"js/html5shiv.js\"></script>\r\n");
      out.write("    <script src=\"js/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->       \r\n");
      out.write("    <link rel=\"shortcut icon\" href=\"images/ico/favicon.ico\">\r\n");
      out.write("    <link rel=\"apple-touch-icon-precomposed\" sizes=\"144x144\" href=\"images/ico/apple-touch-icon-144-precomposed.png\">\r\n");
      out.write("    <link rel=\"apple-touch-icon-precomposed\" sizes=\"114x114\" href=\"images/ico/apple-touch-icon-114-precomposed.png\">\r\n");
      out.write("    <link rel=\"apple-touch-icon-precomposed\" sizes=\"72x72\" href=\"images/ico/apple-touch-icon-72-precomposed.png\">\r\n");
      out.write("    <link rel=\"apple-touch-icon-precomposed\" href=\"images/ico/apple-touch-icon-57-precomposed.png\">\r\n");
      out.write("</head><!--/head-->\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<header id=\"header\"><!--header-->\r\n");
      out.write("\t\t<div class=\"header_top\"><!--header_top-->\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"contactinfo\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-phone\"></i> +2 95 01 88 821</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-envelope\"></i> info@domain.com</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"social-icons pull-right\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-facebook\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-twitter\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-dribbble\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div><!--/header_top-->\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"header-middle\"><!--header-middle-->\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-md-4 clearfix\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"logo pull-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"index.html\"><img src=\"images/home/logo.png\" alt=\"\" /></a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"btn-group pull-right clearfix\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"btn-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default dropdown-toggle usa\" data-toggle=\"dropdown\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\tUSA\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"caret\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"\">Canada</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"\">UK</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"btn-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default dropdown-toggle usa\" data-toggle=\"dropdown\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\tDOLLAR\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"caret\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"\">Canadian Dollar</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"\">Pound</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-md-8 clearfix\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"shop-menu clearfix pull-right\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-user\"></i> Account</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\"><i class=\"fa fa-star\"></i> Wishlist</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"checkout.html\"><i class=\"fa fa-crosshairs\"></i> Checkout</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"cart.html\"><i class=\"fa fa-shopping-cart\"></i> Cart</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"login.html\"><i class=\"fa fa-lock\"></i> Login</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div><!--/header-middle-->\r\n");
      out.write("\t\r\n");
      out.write("\t\t<div class=\"header-bottom\"><!--header-bottom-->\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-9\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"mainmenu pull-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav navbar-nav collapse navbar-collapse\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"index.html\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li class=\"dropdown\"><a href=\"#\">Shop<i class=\"fa fa-angle-down\"></i></a>\r\n");
      out.write("                                    <ul role=\"menu\" class=\"sub-menu\">\r\n");
      out.write("                                        <li><a href=\"shop.html\">Products</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li><a href=\"product-details.html\">Product Details</a></li> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li><a href=\"checkout.html\" class=\"active\">Checkout</a></li> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li><a href=\"cart.html\">Cart</a></li> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li><a href=\"login.html\">Login</a></li> \r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </li> \r\n");
      out.write("\t\t\t\t\t\t\t\t<li class=\"dropdown\"><a href=\"#\">Blog<i class=\"fa fa-angle-down\"></i></a>\r\n");
      out.write("                                    <ul role=\"menu\" class=\"sub-menu\">\r\n");
      out.write("                                        <li><a href=\"blog.html\">Blog List</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li><a href=\"blog-single.html\">Blog Single</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </li> \r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"404.html\">404</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"contact-us.html\">Contact</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"search_box pull-right\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Search\"/>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div><!--/header-bottom-->\r\n");
      out.write("\t</header><!--/header-->\r\n");
      out.write("\r\n");
      out.write("\t<section id=\"cart_items\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"breadcrumbs\">\r\n");
      out.write("\t\t\t\t<ol class=\"breadcrumb\">\r\n");
      out.write("\t\t\t\t  <li><a href=\"#\">Home</a></li>\r\n");
      out.write("\t\t\t\t  <li class=\"active\">Check out</li>\r\n");
      out.write("\t\t\t\t</ol>\r\n");
      out.write("\t\t\t</div><!--/breadcrums-->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"step-one\">\r\n");
      out.write("\t\t\t\t<h2 class=\"heading\">Step1</h2>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"checkout-options\">\r\n");
      out.write("\t\t\t\t<h3>New User</h3>\r\n");
      out.write("\t\t\t\t<p>Checkout options</p>\r\n");
      out.write("\t\t\t\t<ul class=\"nav\">\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label><input type=\"checkbox\"> Register Account</label>\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label><input type=\"checkbox\"> Guest Checkout</label>\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"\"><i class=\"fa fa-times\"></i>Cancel</a>\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div><!--/checkout-options-->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"register-req\">\r\n");
      out.write("\t\t\t\t<p>Please use Register And Checkout to easily get access to your order history, or use Checkout as Guest</p>\r\n");
      out.write("\t\t\t</div><!--/register-req-->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"shopper-informations\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"shopper-info\">\r\n");
      out.write("\t\t\t\t\t\t\t<p>Shopper Information</p>\r\n");
      out.write("\t\t\t\t\t\t\t<form>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Display Name\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"User Name\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" placeholder=\"Password\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" placeholder=\"Confirm password\">\r\n");
      out.write("\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"btn btn-primary\" href=\"\">Get Quotes</a>\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"btn btn-primary\" href=\"\">Continue</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-5 clearfix\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"bill-to\">\r\n");
      out.write("\t\t\t\t\t\t\t<p>Bill To</p>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-one\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<form>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Company Name\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Email*\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Title\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"First Name *\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Middle Name\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Last Name *\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Address 1 *\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Address 2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-two\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<form>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Zip / Postal Code *\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>-- Country --</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>United States</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Bangladesh</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>UK</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>India</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Pakistan</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Ucrane</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Canada</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Dubai</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>-- State / Province / Region --</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>United States</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Bangladesh</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>UK</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>India</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Pakistan</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Ucrane</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Canada</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>Dubai</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"password\" placeholder=\"Confirm password\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Phone *\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Mobile Phone\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Fax\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"order-message\">\r\n");
      out.write("\t\t\t\t\t\t\t<p>Shipping Order</p>\r\n");
      out.write("\t\t\t\t\t\t\t<textarea name=\"message\"  placeholder=\"Notes about your order, Special Notes for Delivery\" rows=\"16\"></textarea>\r\n");
      out.write("\t\t\t\t\t\t\t<label><input type=\"checkbox\"> Shipping to bill address</label>\r\n");
      out.write("\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t</div>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"review-payment\">\r\n");
      out.write("\t\t\t\t<h2>Review & Payment</h2>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"table-responsive cart_info\">\r\n");
      out.write("\t\t\t\t<table class=\"table table-condensed\">\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr class=\"cart_menu\">\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"image\">Item</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"description\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"price\">Price</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"quantity\">Quantity</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"total\">Total</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_product\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"\"><img src=\"images/cart/one.png\" alt=\"\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_description\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h4><a href=\"\">Colorblock Scuba</a></h4>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Web ID: 1089772</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_price\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>$59</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_quantity\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"cart_quantity_button\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"cart_quantity_up\" href=\"\"> + </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"cart_quantity_input\" type=\"text\" name=\"quantity\" value=\"1\" autocomplete=\"off\" size=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"cart_quantity_down\" href=\"\"> - </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_total\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p class=\"cart_total_price\">$59</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_delete\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a class=\"cart_quantity_delete\" href=\"\"><i class=\"fa fa-times\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_product\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"\"><img src=\"images/cart/two.png\" alt=\"\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_description\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h4><a href=\"\">Colorblock Scuba</a></h4>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Web ID: 1089772</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_price\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>$59</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_quantity\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"cart_quantity_button\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"cart_quantity_up\" href=\"\"> + </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"cart_quantity_input\" type=\"text\" name=\"quantity\" value=\"1\" autocomplete=\"off\" size=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"cart_quantity_down\" href=\"\"> - </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_total\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p class=\"cart_total_price\">$59</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_delete\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a class=\"cart_quantity_delete\" href=\"\"><i class=\"fa fa-times\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_product\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"\"><img src=\"images/cart/three.png\" alt=\"\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_description\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h4><a href=\"\">Colorblock Scuba</a></h4>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Web ID: 1089772</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_price\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>$59</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_quantity\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"cart_quantity_button\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"cart_quantity_up\" href=\"\"> + </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"cart_quantity_input\" type=\"text\" name=\"quantity\" value=\"1\" autocomplete=\"off\" size=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"cart_quantity_down\" href=\"\"> - </a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_total\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p class=\"cart_total_price\">$59</p>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"cart_delete\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a class=\"cart_quantity_delete\" href=\"\"><i class=\"fa fa-times\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"4\">&nbsp;</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<table class=\"table table-condensed total-result\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Cart Sub Total</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>$59</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Exo Tax</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>$2</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr class=\"shipping-cost\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Shipping Cost</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Free</td>\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Total</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><span>$61</span></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"payment-options\">\r\n");
      out.write("\t\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t\t<label><input type=\"checkbox\"> Direct Bank Transfer</label>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t\t<label><input type=\"checkbox\"> Check Payment</label>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t\t<label><input type=\"checkbox\"> Paypal</label>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</section> <!--/#cart_items-->\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t<footer id=\"footer\"><!--Footer-->\r\n");
      out.write("\t\t<div class=\"footer-top\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"companyinfo\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2><span>e</span>-shopper</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>\r\n");
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
      out.write("\t\t\t\t\t\t\t\t<p>Circle of Hands</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>24 DEC 2014</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
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
      out.write("\t\t\t\t\t\t\t\t<p>Circle of Hands</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>24 DEC 2014</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
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
      out.write("\t\t\t\t\t\t\t\t<p>Circle of Hands</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>24 DEC 2014</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
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
      out.write("\t\t\t\t\t\t\t\t<p>Circle of Hands</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t<h2>24 DEC 2014</h2>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"address\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"images/home/map.png\" alt=\"\" />\r\n");
      out.write("\t\t\t\t\t\t\t<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"footer-widget\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Service</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Online Help</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Contact Us</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Order Status</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Change Location</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">FAQ?s</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Quock Shop</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">T-Shirt</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Mens</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Womens</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Gift Cards</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Shoes</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>Policies</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Terms of Use</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Privecy Policy</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Refund Policy</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Billing System</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Ticket System</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-2\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>About Shopper</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Company Information</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Careers</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Store Location</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Affillate Program</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"\">Copyright</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3 col-sm-offset-1\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"single-widget\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>About Shopper</h2>\r\n");
      out.write("\t\t\t\t\t\t\t<form action=\"#\" class=\"searchform\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"Your email address\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-right\"></i></button>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>Get the most recent updates from <br />our site and be updated your self...</p>\r\n");
      out.write("\t\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"footer-bottom\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<p class=\"pull-left\">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>\r\n");
      out.write("\t\t\t\t\t<p class=\"pull-right\">Designed by <span><a target=\"_blank\" href=\"http://www.themeum.com\">Themeum</a></span></p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</footer><!--/Footer-->\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script src=\"js/jquery.js\"></script>\r\n");
      out.write("\t<script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.scrollUp.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.prettyPhoto.js\"></script>\r\n");
      out.write("    <script src=\"js/main.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
