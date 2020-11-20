<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Contract</title>
</head>
<body>
	<%
		System.out.println("contract/add-contract.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="contract.add.title" />
							</h4>

						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Phòng Ban: (<span style="color: red;">*</span>)
										</label>
										<form action="admin/contract/loadEmpl.htm">
											<select name="load" class="form-control">
												<c:forEach var="department" items="${listDepartment }">
													<option value="${department.id}">${department.nameDepartment }</option>
												</c:forEach>
											</select>
											<button type="submit"
												class="btn btn-success btn-fill pull-right">
												<s:message code="record.add.load" />
											</button>
										</form>

									</div>
								</div>
							</div>
						</div>
						<div class="content">
							<form:form action="admin/contract/save-contract.htm"
								method="POST" commandName="contract">
								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Tên Nhân Viên: (<span style="color: red;">*</span>)
											</label>
											<%-- <form:input path="employee.id" placeholder="Mã nhân viên..."
												class="form-control" /> --%>
											<form:select path="employee.id" items="${listEmployee}"
												itemValue="id" itemLabel="nameEmployee" class="form-control" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Loại Hợp Đồng: (<span style="color: red;">*</span>)<form:errors
													path="nameContract" class="error" /></label>
											<form:select path="nameContract" class="form-control">
												<option selected="selected" value=""><s:message
														code="global.select" /></option>
												<form:option value="HD Khong Xac Dinh Thoi Han">Hợp Đồng Không Xác Định Thời Hạn</form:option>
												<form:option value="HD Xac Dinh Thoi Han">Hợp Đồng Xác Định Thời Hạn</form:option>
												<form:option value="HD Theo Mua Vu">Hợp Đồng Theo Mùa Vụ</form:option>
											</form:select>
										</div>
									</div>
								</div>

								<!-- 2 Dòng -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Trợ Cấp: (<span style="color: red;">*</span>)<form:errors
													path="subsidize" class="error" /></label>
											<form:select path="subsidize" class="form-control">
												<option selected="selected" value="0"><s:message
														code="global.select" /></option>
												<form:option value="500000">Ăn Trưa</form:option>
												<form:option value="300000">Xăng Xe</form:option>
												<form:option value="100000">Điện Thoại</form:option>
												<form:option value="900000">Bao Tất</form:option>
											</form:select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Bảo Hiểm: (<span style="color: red;">*</span>)<form:errors
													path="insurrance" class="error" /></label>
											<form:select path="insurrance" class="form-control">
												<option selected="selected" value="0"><s:message
														code="global.select" /></option>
												<form:option value="0.92">BHXH Người Lao Động Đóng</form:option>
												<form:option value="0.82">BHXH Doanh Nghiệp Đóng</form:option>
											</form:select>
										</div>
									</div>

								</div>



								<!-- 2 Cột -->
								<div class="row">

									<div class="col-md-6">
										<div class="form-group">
											<label>Ngày Kết Thúc: </label>
											<form:input path="endTime" placeholder="dd/MM/yyyy..."
												class="form-control" />
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Lương: (<span style="color: red;">*</span>)<form:errors
													path="salary" class="error" /></label>
											<div class="form-group">
												<form:input type="number" path="salary"
													placeholder="Nhập số tiền..." class="form-control" size="9"
													maxlength="9" value="" />
											</div>
										</div>
									</div>
								</div>
								<!-- 1 Cot -->
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<div class="form-group">
												<form:hidden path="status" value="1" />
											</div>
										</div>
									</div>
								</div>

								<div class="clearfix"></div>
								<div class="text-center">
									<button type="submit"
										class="btn btn-success btn-fill pull-right">
										<s:message code="contract.add.process" />
									</button>
									<div class="clearfix"></div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>