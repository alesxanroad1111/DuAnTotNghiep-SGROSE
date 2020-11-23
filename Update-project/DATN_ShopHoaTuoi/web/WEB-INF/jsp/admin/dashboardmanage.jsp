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
                    <h3 class="card-title"><strong>+</strong>${totalflower}
                    </h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/flower/index.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
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
                    <h3 class="card-title"><strong>+</strong>${totalbill}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/order/index.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 ">
            <div class="card card-stats ">
                <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">how_to_reg</i>
                    </div>
                    <p class="card-category">Tổng nhân viên</p>
                    <h3 class="card-title"><strong>+</strong>${totalstaff}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-warning">check</i>
                        <a href="admin/staffmanage.htm" class="warning-link"><strong>Xem chi tiết</strong></a>
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

    <div class="row">
        <div class="col-xl-4 col-lg-12">
            <div class="card card-chart">
                <div class="card-header card-header-success">
                    <div class="ct-chart" id="dailySalesChart"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Daily Sales</h4>
                    <p class="card-category">
                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">access_time</i> updated 4 minutes ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-12">
            <div class="card card-chart">
                <div class="card-header card-header-warning">
                    <div class="ct-chart" id="websiteViewsChart"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Email Subscriptions</h4>
                    <p class="card-category">Last Campaign Performance</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-12">
            <div class="card card-chart">
                <div class="card-header card-header-danger">
                    <div class="ct-chart" id="completedTasksChart"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Completed Tasks</h4>
                    <p class="card-category">Last Campaign Performance</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Thành viên SG-Rose</h4>
                    <p class="card-category">Chi tiết</p>
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-hover">
                        <thead class="text-warning">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Task</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Doanh Ngọc Diễm</td>
                                <td><span class="badge badge-pill badge-success">Nhóm trưởng</span></td>
                                <td>FullStack</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Trần Công Truyền</td>
                                <td><span class="badge badge-pill badge-warning">Scrum master</span></td>
                                <td>FullStack</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Nguyễn Đức Hòa</td>
                                <td><span class="badge badge-pill badge-info">Thành viên</span></td>
                                <td>Back-end</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Hồ Phi Long</td>
                                <td><span class="badge badge-pill badge-info">Thành viên</span></td>
                                <td>Front-end</td>
                            </tr>
                              <tr>
                                <td>5</td>
                                <td>Trần Đại Hưng</td>
                                <td><span class="badge badge-pill badge-info">Thành viên</span></td>
                                <td>Front-end</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

