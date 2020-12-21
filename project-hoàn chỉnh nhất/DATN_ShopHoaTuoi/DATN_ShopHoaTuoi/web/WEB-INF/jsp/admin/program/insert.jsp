<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<div class="content">
    <div class="col-md-12 row">
        <div class="container-fluid">
            <div class="col-md-12 row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header card-header-success">
                            <h4 class="card-title">Insert Program</h4>
                            <p class="card-category">Form here</p>
                        </div>
                        <div class="card-body">
                            <form:form action="admin/program/add" modelAttribute="program" method="GET">
                                <div class="form-group center">
                                    <form:hidden path="id" class="form-control"/>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Tên chiến dịch</label>
                                            <form:input path="name" class="form-control"  />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Ngày bắt đầu</label>
                                            <div class='input-group date' id='datetimepicker1'>
                                                <form:input path="dateStart" type='text' class="form-control" placeholder="Ngày/Tháng/Năm" />
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Ngày kết thúc </label>
                                            <div class="input-group">
                                                <form:input type="text" class="date form-control"  path="dateEnd" placeholder="Ngày/Tháng/Năm" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-success">Insert </button>
                                <a class="btn btn-success" href="admin/program/index">Cancel</a>
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
</div>
<script>
    $(function () {
        var bindDatePicker = function () {
            $(".date").datetimepicker({
                format: 'dd-MM-YYYY',
                icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down"
                }
            }).find('input:first').on("blur", function () {
                // check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
                // update the format if it's yyyy-mm-dd
                var date = parseDate($(this).val());

                if (!isValidDate(date)) {
                    //create date based on momentjs (we have that)
                    date = moment().format('dd-MM-YYYY');
                }

                $(this).val(date);
            });
        }

        var isValidDate = function (value, format) {
            format = format || false;
            // lets parse the date to the best of our knowledge
            if (format) {
                value = parseDate(value);
            }

            var timestamp = Date.parse(value);

            return isNaN(timestamp) == false;
        }

        var parseDate = function (value) {
            var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
            if (m)
                value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

            return value;
        }

        bindDatePicker();
    });
</script>