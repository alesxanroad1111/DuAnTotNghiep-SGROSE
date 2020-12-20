<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">


<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Edit Orders</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">
                        <form:form action="admin/order/edit" modelAttribute="order" method="POST">
                            <div class="form-group center">
                                <form:hidden path="id" class="form-control"/>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Mã khách hàng</label>
                                        <form:input path="userid.id" class="form-control"  />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Địa chỉ</label>
                                        <form:input path="address" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Trạng thái giao hàng</label><br>
                                        <div class="form-control">
                                            <form:select path="status.id" cssClass="form-control bg-dark"
                                                         items="${OrderStatuss}" itemValue="id" itemLabel="name" />
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Trạng thái thanh toán</label><br>
                                        <div class="form-control">
                                            <form:select path="ispaid.id" cssClass="form-control bg-dark"
                                                         items="${Ispaids}" itemValue="id" itemLabel="name" />
                                        </div>
                                    </div>
                                </div>
                            </div></br></br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Tổng tiền</label>
                                        <form:input path="totalmoney" class="form-control" />
                                    </div>

                                </div>
                            </div>                            

                            <button class="btn btn-success">Update </button>
                            <a class="btn btn-success" href="admin/order/index">Cancel</a>
                            <div class="clearfix"></div>
                        </form:form>  
                    </div>
                   
                </div>
            </div>
             <div class="col-md-4">
                    <div class="card card-profile">
                        <div class="card-body">
                            
                            <img src="images/hoadon.jpg" width="100%"/>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
