<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
</head>
<body>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title" style="font-weight: bold;">
								<s:message code="employee.add.title" />
							</h4>
						</div>
						<div class="content">

							<form:form action="admin/employee/save" method="POST">
								<fieldset>
									<form:form commandName="employee">
										<!-- 3 Dòng  -->
										<div class="row">
											<div class="col-md-4">
												<span style="color: red;"></span>
												<div class="form-group">
													<label>Mã Nhân Viên: (<span style="color: red;">*</span>)<form:errors
															path="id" class="error" /></label>
													<form:input path="id" placeholder="Mã nhân viên..."
														class="form-control" value="" />
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Tên Nhân Viên: (<span style="color: red;">*</span>)<form:errors
															path="nameEmployee" class="error" /></label>
													<form:input path="nameEmployee"
														placeholder="Tên nhân viên..." size="30" maxlength="30"
														class="form-control" />
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="exampleInputEmail1">Thư Điện Tử: (<span
														style="color: red;">*</span>)<form:errors path="email"
															class="error" /></label>
													<form:input path="email" placeholder="Email..." size="30"
														maxlength="30" class="form-control" />
												</div>
											</div>
										</div>
										<!-- 3 Dòng -->
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>Địa Chỉ: (<span style="color: red;">*</span>)<form:errors
															path="address" class="error" /></label>
													<form:input path="address" placeholder="Địa chỉ..."
														class="form-control" />
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Số Điện Thoại: (<span style="color: red;">*</span>)<form:errors
															path="numberPhone" class="error" /></label>
													<form:input path="numberPhone"
														placeholder="Số Điện Thoại..." size="12" maxlength="12"
														class="form-control" value="" />
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Ngày Sinh: (<span style="color: red;">*</span>)<form:errors
															path="birthday" class="error" /></label>
													<form:input path="birthday" placeholder="dd/MM/yyyy..."
														class="form-control" />
												</div>
											</div>
										</div>

										<!-- 2 Dòng -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Giới Tính: (<span style="color: red;">*</span>)<form:errors
															path="gender" class="error" /></label>
													<form:select path="gender" class="form-control">
														<option selected="selected" value=0><s:message
																code="global.select" /></option>
														<form:option value="1">Nam</form:option>
														<form:option value="2">Nữ</form:option>
													</form:select>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Hình Ảnh: (<span style="color: red;">*</span>)<form:errors
															path="photo" class="error" /></label>
													<form:input path="photo" type="file" class="form-control" />
												</div>
											</div>
										</div>

										<!-- 3 Dòng -->

										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>Loại Nhân Viên</label>
													<form:select path="employeeType.id" items="${employeeType}"
														itemValue="id" itemLabel="nameEmployeeType"
														class="form-control">
														<option selected="selected" value=0>Chọn</option>
														<form:option value=""></form:option>
													</form:select>
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group">
													<label>Phòng Ban</label>
													<form:select path="department.id" items="${department}"
														itemValue="id" itemLabel="nameDepartment"
														class="form-control" />

												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group">
													<label>Chức Vụ</label>
													<form:select path="position.id" items="${position}"
														itemValue="id" itemLabel="namePosition"
														class="form-control" />
												</div>
											</div>
										</div>
									</form:form>

									<form:form commandName="contract">
										<!-- 2 Cột  -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Mã Nhân Viên: (<span style="color: red;">*</span>)
													</label>
													<form:input path="employee.id" class="form-control" />
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
															placeholder="Nhập số tiền..." class="form-control"
															size="9" maxlength="9" value="" />
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

									</form:form>
									<div class="clearfix"></div>
									<div class="text-center">
										<button type="submit"
											class="btn btn-success btn-fill pull-right">
											<s:message code="employee.add.process" />
										</button>
										<div class="clearfix"></div>
									</div>
								</fieldset>
							</form:form>

							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>Mã</th>
										<th>Tên Nhân Viên</th>
										<th>Giới Tính</th>
										<th>Ảnh</th>
										<th>Địa Chỉ</th>
										<th>Email</th>
										<th>SĐT</th>
										<th>Ngày Sinh</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listEmployee}" var="employee">
										<tr>
											<td>${employee.id }</td>
											<td>${employee.nameEmployee }</td>
											<td><c:choose>
													<c:when test="${employee.gender < 2 }"> Nam </c:when>
													<c:when test="${employee.gender >= 2}"> Nữ </c:when>
												</c:choose></td>
											<td><img src="assets/img/${employee.photo }"
												style="width: 75px; height: 90px"></td>
											<td>${employee.address }</td>
											<td>${employee.email }</td>
											<td>${employee.numberPhone }</td>
											<td><f:formatDate value="${employee.birthday}"
													pattern="dd/MM/yyyy" />
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
										</tr>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>