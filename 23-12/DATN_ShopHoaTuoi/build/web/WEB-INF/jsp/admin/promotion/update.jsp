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
                        <h4 class="card-title">Insert PromotionFlower</h4>
                        <p class="card-category">Form here</p>
                    </div>
                    <div class="card-body">
                        <form:form action="admin/promotion/insert" modelAttribute="promotion" method="GET">
                            <div class="form-group center">
                                <form:hidden path="id" class="form-control"/>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Mã tên khuyến mãi</label><br>
                                         <form:select path="discountId.id" cssClass="form-control bg-dark"
                                                     items="${DiscountPrograms}" itemValue="id" itemLabel="name" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Mã tên hoa</label><br>
                                        <form:select path="flowerId.id" cssClass="form-control bg-dark"
                                                     items="${Flowers}" itemValue="id" itemLabel="name" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Khuyến mãi theo %</label>
                                            <form:input path="typePercent" class="form-control" />
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Khuyến mãi theo giá</label><br>
                                            <form:input path="typeprice" class="form-control" />
                                    </div>
                                </div>
                            </div></br></br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label >Số lượng</label>
                                        <form:input path="amount" class="form-control" />
                                    </div>
                                </div>
                            </div>                            

                            <button class="btn btn-success">Insert </button>
                            <a class="btn btn-success" href="admin/promotion/index">Cancel</a>
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
