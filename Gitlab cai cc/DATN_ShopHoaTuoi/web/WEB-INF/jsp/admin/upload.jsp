<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
    <div class="container-fluid">
        <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:void(0)">Thông tin</a>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="material-icons">person</i>Tên Tài khoản
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="material-icons">exit_to_app</i>
                    </a>
                </li>
                <!-- Ngay chỗ này edit cái tên người dùng với cái nút login -->
            </ul>
        </div>
    </div>
</nav>
<!-- End Navbar -->
<div class="content">
    <section>
        <div class="container p-5">
            <link rel="stylesheet" href="assets/js/js.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
            <div class="row">
                <div class="col-lg-5 mx-auto" >
                    <div class="p-5  shadow rounded-lg" >
                        <form action="admin/upload.htm" method="POST" enctype="multipart/form-data">
                            <img src="https://res.cloudinary.com/mhmd/image/upload/v1557366994/img_epm3iz.png"
                                 alt="" width="200" class="d-block mx-auto mb-4 rounded-pill">
                            <!-- Default bootstrap file upload-->
                            <div class="custom-file overflow-hidden rounded-pill mb-5">
                                <input id="customFile" type="file" name="image" accept="image/*" size="50" multiple class="btn btn-primary custom-file-input rounded-pill">
                                <label for="customFile" class="custom-file-label rounded-pill">Chọn Hình Ảnh</label>
                            </div>
                            <!-- End -->

                            <h6 class="text-center mb-4 text-muted">
                                Nhấp vào chọn hình ảnh để chọn hình ảnh muốn upload và chọn nút Upload
                            </h6>
                            <div class="text-center mb-4">
                                <input class="file-upload btn btn-primary btn-block rounded-pill shadow" value="Upload" name="btnUpload" type="submit"/>
                            </div>
                            <div class="text-center text-primary" role="alert">
                                ${message}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <style>
            body {
                font-family: 'Varela Round', sans-serif;
            }
            .modal-confirm {		
                color: #434e65;
                width: 525px;
            }
            .modal-confirm .modal-content {
                padding: 20px;
                font-size: 16px;
                border-radius: 5px;
                border: none;
            }
            .modal-confirm .modal-header {
                background: #47c9a2;
                border-bottom: none;   
                position: relative;
                text-align: center;
                margin: -20px -20px 0;
                border-radius: 5px 5px 0 0;
                padding: 35px;
            }
            .modal-confirm h4 {
                text-align: center;
                font-size: 36px;
                margin: 10px 0;
            }
            .modal-confirm .form-control, .modal-confirm .btn {
                min-height: 40px;
                border-radius: 3px; 
            }
            .modal-confirm .close {
                position: absolute;
                top: 15px;
                right: 15px;
                color: #fff;
                text-shadow: none;
                opacity: 0.5;
            }
            .modal-confirm .close:hover {
                opacity: 0.8;
            }
            .modal-confirm .icon-box {
                color: #fff;		
                width: 95px;
                height: 95px;
                display: inline-block;
                border-radius: 50%;
                z-index: 9;
                border: 5px solid #fff;
                padding: 15px;
                text-align: center;
            }
            .modal-confirm .icon-box i {
                font-size: 64px;
                margin: -4px 0 0 -4px;
            }
            .modal-confirm.modal-dialog {
                margin-top: 80px;
            }
            .modal-confirm .btn, .modal-confirm .btn:active {
                color: #fff;
                border-radius: 4px;
                background: #eeb711 !important;
                text-decoration: none;
                transition: all 0.4s;
                line-height: normal;
                border-radius: 30px;
                margin-top: 10px;
                padding: 6px 20px;
                border: none;
            }
            .modal-confirm .btn:hover, .modal-confirm .btn:focus {
                background: #eda645 !important;
                outline: none;
            }
            .modal-confirm .btn span {
                margin: 1px 3px 0;
                float: left;
            }
            .modal-confirm .btn i {
                margin-left: 1px;
                font-size: 20px;
                float: right;
            }
            .trigger-btn {
                display: inline-block;
                margin: 100px auto;
            }
        </style>
    </section>
</div>
<script>
    $(function () {
        $(document).ready(function () {
            $('#myModal').dialog({
                title: "ahaha",
                width: 450,
                height: 250,
                modal: true,
                button: {
                    close: function () {
                        $(this).dialog('close');
                    }
                }
            });
        });
    });
</script>