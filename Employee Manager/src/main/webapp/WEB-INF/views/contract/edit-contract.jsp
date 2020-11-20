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
<title>Edit Contract</title>
</head>
<body>
	<%
		System.out.println("contract/edit-contract.jsp");
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="contract.edit.title" />
							</h4>
						</div>
						<div class="content">
							<form:form
								action="admin/contract/edit-contract/${contract.employee.id }.htm"
								method="POST" commandName="contract">
								<!-- 2 Cột  -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Mã Nhân Viên</label>
											<form:input path="employee.id" class="form-control"
												readonly="true" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Tên Nhân Viên</label>
											<form:input path="employee.nameEmployee" class="form-control"
												readonly="true" />
										</div>
									</div>
								</div>


								<!-- 2 Dòng -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Trợ Cấp: (<span style="color: red;">*</span>)
											</label>
											<form:select path="subsidize" class="form-control">
												<form:option value="500000">Ăn Trưa</form:option>
												<form:option value="300000">Xăng Xe</form:option>
												<form:option value="100000">Điện Thoại</form:option>
												<form:option value="900000">Bao Tất</form:option>
											</form:select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Bảo Hiểm: (<span style="color: red;">*</span>)
											</label>
											<form:select path="insurrance" class="form-control">
												<form:option value="0.82">BHXH Doanh Nghiệp Đóng</form:option>
												<form:option value="0.92">BHXH Người Lao Động Đóng</form:option>
											</form:select>
										</div>
									</div>
								</div>

								<!-- 3 Dòng -->

								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Loại Hợp Đồng: (<span style="color: red;">*</span>)
											</label>
											<form:select path="nameContract" class="form-control">
												<form:option value="HD Khong Xac Dinh Thoi Han">Hợp Đồng Không Xác Định Thời Hạn</form:option>
												<form:option value="HD Xac Dinh Thoi Han">Hợp Đồng Xác Định Thời Hạn</form:option>
												<form:option value="HD Theo Mua Vu">Hợp Đồng Theo Mùa Vụ</form:option>
											</form:select>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Kết Thúc</label>
											<form:input path="endTime" placeholder="dd/MM/yyyy..."
												class="form-control" />
											<form:hidden path="startTime" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Lương: (<span style="color: red;">*</span>)<form:errors
													path="salary" class="error" /></label>
											<div class="form-group">
												<form:input path="salary" type="number"
													placeholder="Nhập số tiền..." class="form-control" />
											</div>
										</div>
									</div>
									<form:hidden path="status" />
								</div>

								<div class="clearfix"></div>
								<div class="text-center">
									<button type="submit"
										class="btn btn-success btn-fill pull-right">
										<s:message code="contract.edit.process" />
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