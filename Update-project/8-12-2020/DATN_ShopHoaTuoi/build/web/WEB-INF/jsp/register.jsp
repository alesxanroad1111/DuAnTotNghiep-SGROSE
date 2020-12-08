<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="form"><!--form-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3"></div> 
                <div class="login-form col-sm-6"><!--login form-->
                    <h2 class="text-center">Đăng kí tài khoản</h2>
                    <form action="#">
                        <input type="email" name="email" placeholder="email" />
                        <input type="password" name="password" placeholder="password" />
                        <input type="email" name="email" placeholder="email" />
                        <input type="password" name="password" placeholder="password" />
                        <span>
                            <input type="checkbox" class="checkbox"> 
                            Nhớ tài khoản
                        </span>
                        <button type="submit" class="btn btn-default">Đăng nhập</button>
                    </form>
                </div><!--/login form-->
                <div class="col-sm-3"></div> 
            </div>
        </div>
    </div>
</section><!--/form-->
