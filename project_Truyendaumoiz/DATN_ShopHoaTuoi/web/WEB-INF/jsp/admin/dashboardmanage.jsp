<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
    <div class="row">
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">local_florist</i>
                    </div>
                    <p class="card-category">Tổng sản phẩm</p>
                    <h3 class="card-title"><strong>+</strong>75
                    </h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/productsmanage.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-primary card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">event_note</i>
                    </div>
                    <p class="card-category">Tổng hóa đơn</p>
                    <h3 class="card-title"><strong>+</strong>75</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/ordersmanage.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">how_to_reg</i>
                    </div>
                    <p class="card-category">Tổng nhân viên</p>
                    <h3 class="card-title"><strong>+</strong>75</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/staffsmanage.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">business</i>
                    </div>
                    <p class="card-category">Đối tác</p>
                    <h3 class="card-title">+245</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/ordersmanage.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--    <div class="col-md-12 row">
        
        <div class="col-md-6">
            <div id="myDIV" class="header">
                <h2>My To Do List</h2>
                <input type="text" id="myInput" placeholder="Title...">
                <span onclick="newElement()" class="addBtn">Add</span>
            </div>

            <ul id="myUL">
                <li>Hit the gym</li>
                <li class="checked">Pay bills</li>
                <li>Meet George</li>
                <li>Buy eggs</li>
                <li>Read a book</li>
                <li>Organize office</li>
            </ul>
        </div> 
    </div>-->
</div>