<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Contract</title>
</head>
<body>
	<%
		System.out.println("contract/index.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="contract.index.title" />
							</h4>
							<p class="category">
								<s:message code="global.text" />
							</p>
						</div>

						<div style="clear: both; width: 98%; margin: 10px auto;">
							<form action="admin/contract/search.htm">
								<div class="col-md-2">
									<div class="form-group">
										<input type="text" name="search"
											placeholder="Tìm kiếm Mã, Tên NV, Lương" class="form-control" />
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<select name="filter" class="form-control">
											<option selected="selected" value=""><s:message
													code="global.department" /></option>
											<c:forEach var="department" items="${listDepartment}">
												<option value="${department.id}">${department.nameDepartment}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-1">
									<div class="form-group">
										<button type="submit" class="btn btn-danger btn-fill">
											<s:message code="global.search" />
										</button>
									</div>
								</div>
							</form>

							<form action="admin/contract/filter.htm">
								<div class="col-md-2">
									<div class="form-group">
										<select name="filter" class="form-control">
											<option selected="selected" value=""><s:message
													code="global.status" /></option>
											<option value="1"><s:message code="contract.signed" /></option>
											<option value="2"><s:message code="contract.expired" /></option>

										</select>
									</div>
								</div>
								<div class="col-md-1">
									<div class="form-group">
										<button type="submit" class="btn btn-warning btn-fill">
											<s:message code="global.filter" />
										</button>
									</div>
								</div>
							</form>
							<div>
								<a href="admin/contract/add-contract.htm" type="submit"
									class="btn btn-success btn-fill pull-right"><s:message
										code="contract.add.title" /></a>
							</div>
						</div>

						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Nhân Viên</th>
										<th>Tên Hợp Đồng</th>
										<th>Bắt Đầu</th>
										<th>Kết Thúc</th>
										<th>Trợ Cấp</th>
										<th>BHXH</th>
										<th>Lương</th>
										<th>Tổng</th>
										<th>Trạng Thái</th>
										<th>Chức Năng</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listContract}" var="contract">
										<tr>
											<td>${contract.employee.nameEmployee }</td>
											<td>${contract.nameContract }</td>
											<td><f:formatDate value="${contract.startTime}"
													pattern="dd/MM/yyyy" />
											<td><f:formatDate value="${contract.endTime}"
													pattern="dd/MM/yyyy" />
											<td><f:formatNumber type="currency"
													value="${contract.subsidize }" pattern="###,###,###" />
												VNĐ</td>
											<td><c:if test="${contract.insurrance == 0.82}">18% </c:if>
												<c:if test="${contract.insurrance == 0.92}">8% </c:if></td>
											<td><f:formatNumber type="currency"
													value="${contract.salary }" pattern="###,###,###" /> VNĐ</td>
											<td><c:if
													test="${contract.subsidize == 500000 && contract.insurrance == 0.82 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ </c:if>
												<c:if
													test="${contract.subsidize == 300000 && contract.insurrance == 0.82 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>
												<c:if
													test="${contract.subsidize == 100000 && contract.insurrance == 0.82 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>
												<c:if
													test="${contract.subsidize == 900000 && contract.insurrance == 0.82 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>

												<c:if
													test="${contract.subsidize == 500000 && contract.insurrance == 0.92 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>
												<c:if
													test="${contract.subsidize == 300000 && contract.insurrance == 0.92 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>
												<c:if
													test="${contract.subsidize == 100000 && contract.insurrance == 0.92 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>
												<c:if
													test="${contract.subsidize == 900000 && contract.insurrance == 0.92 }">
													<f:formatNumber type="currency" pattern="###,###,###"
														value="${contract.subsidize + (contract.salary * contract.insurrance)}" /> VNĐ</c:if>

											</td>
											<%
												Date date = new Date();
											%><c:if test="${contract.endTime == date.getTime()}"></c:if>
											<td><c:choose>

													<c:when test="${contract.status >= 2}">
														<a
															href="admin/contract/reset-status/${contract.employee.id }.htm"
															type="submit" class="btn btn-warning btn-xs btn-fill">Hết
															Hạn</a>

													</c:when>

													<c:when test="${contract.status < 2 }">
														<a
															href="admin/contract/reset-status/${contract.employee.id }.htm"
															type="submit" class="btn btn-info btn-xs btn-fill">Đã
															Ký</a>
													</c:when>
												</c:choose></td>
											<td><a
												href="admin/contract/edit-contract/${contract.employee.id}.htm"
												type="button" rel="tooltip" title="Sửa"
												class="btn btn-danger btn-xs">Sửa</a> <a
												href="admin/contract/delete-contract/${contract.employee.id}.htm"
												type="button" rel="tooltip" title="Xóa"
												onclick="return confirm('Bạn chắc chắn chứ ?')"
												class="btn btn-success btn-xs">Xóa</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div style="margin: 10px; text-align: right;">
								<c:forEach begin="1" end="${rowCount}" varStatus="row">
									<a type="button" href="admin/contract/?page=${row.index}"
										class="btn btn-danger btn-xs btn-fill">${row.index}</a>
								</c:forEach>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>


<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		demo.initChartist();

		$.notify({
			icon : 'pe-7s-gift',
			message : "Cảm ơn bạn đã trỏ tới <b> => Quản Lý Hợp Đồng </b> "

		}, {
			type : 'warning',
			timer : 1
		});

	});
</script>
</html>