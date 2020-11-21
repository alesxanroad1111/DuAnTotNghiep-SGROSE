<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div>
    <div class="col-md-12 text-center">
        <h2 class="text-primary">Thông tin chi tiết</h2>
    </div>
    ${message}
    <div class="col-md-12 row">
        <form:form action="${pageContext.request.contextPath}/admin/productsmanage.htm" modelAttribute="flower" method="get" class="col-md-12 row"    >
            <div class="col-md-8">
                <div class="form-group">
                    <!--                            <label >Mã hoa</label>-->
                    <form:hidden    path="id"  cssClass="form-control"  />
                </div>
                <div class="form-group">
                    <label >Tên hoa</label>
                    <form:input path="name" cssClass="form-control" />
                    <form:errors path="name"/>
                </div>
                <div class="form-group">
                    <label >Loại hoa</label><br>
                    <form:select path="typeid.id" cssClass="bg-dark form-control"
                                 items="${typesofflowers}" itemValue="id" itemLabel="name" />
                </div>
                <div class="form-group">
                    <label >Số lượng</label>
                    <form:input path="amount" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label >Giá</label>
                    <form:input path="price" cssClass="form-control"/>
                </div>
                <div class="form-group" hidden>
                    <label >Giá</label>
                    <form:input path="image" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label >Notes</label>
                    <form:textarea path="notes" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label >Ngày Tạo</label><br>
                    <form:input path="createdtime" id="date"  name="date"  cssClass="form-control bg-dark "  readonly="true" />
                </div>
                <div class="form-group text-center">
                    <input name="btnInsert" class="btn btn-default" type="submit" value="Insert" />
                    <input name="btnUpdate" class="btn btn-default" type="submit" value="Update" />
                    <input name="btnReset" class="btn btn-default" type="submit" value="Reset" />
                </div> 

            </div>

            <div class="row col-md-4">
                <form class="md-form">
                    <div class="file-field product-information">
                        <img src="images/hoa/${flower.image}" width="100%"/>
                        <input path="image" type="file" class="form-control-file border">
                        </form>
                    </div>
                </form:form>
        </div>
    </div>
</div>