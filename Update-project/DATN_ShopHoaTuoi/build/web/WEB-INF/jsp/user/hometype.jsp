<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base href="${pageContext.servletContext.contextPath}/">

<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1><span>SG</span>-Rose</h1>
                                <h2>Hoa chúc mừng sinh nhật</h2>
                                <p>Hãy ghé thăm và mua cho mình những bó hoa sinh nhật tươi vui. </p>
                                <button type="button" class="btn btn-default get">Thử ngay nào</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/home/birthday-flower.png" class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png"  class="pricing" alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>SG</span>-Rose</h1>
                                <!--                                <img src="../../../../../../../C:/Users/DiemNgonTrai/AppData/Local/Temp/pricing.png" alt=""/>-->
                                <h2>100% Responsive Design</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png"  class="pricing" alt="" />
                            </div>
                        </div>

                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>SG</span>-Rose</h1>
                                <h2>Free Ecommerce Template</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png" class="pricing" alt="" />
                            </div>
                        </div>

                    </div>

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>

            </div>
        </div>
    </div>
</section><!--/slider-->

<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Thể loại</h2>
                    <div class="panel-group category-products" id="accordian">
                        <!--category-productsr-->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#themflowers">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        Các chủ đề hoa
                                    </a>
                                </h4>
                            </div>
                            <div id="themflowers" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="#">Hoa chúc mừng</a></li>
                                        <li><a href="#">Hoa tình yêu</a></li>
                                        <li><a href="#">Hoa khai trương</a></li>
                                        <li><a href="#">Hoa sinh nhật</a></li>
                                        <li><a href="#">Hoa cưới</a></li>
                                        <li><a href="#">Hoa chia buồn</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#typesofflowers">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        các loại hoa tươi
                                    </a>
                                </h4>
                            </div>
                            <div id="typesofflowers" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="">Hoa hồng đỏ</a></li>
                                        <li><a href="">Hoa hồng vàng</a></li>
                                        <li><a href="">Hoa hồng trắng</a></li>
                                        <li><a href="">Hoa tulip</a></li>
                                        <li><a href="">Hoa cúc</a></li>
                                        <li><a href="">Hoa hướng dương</a></li>
                                        <li><a href="">Hoa cẩm chướng</a></li>
                                        <li><a href="">Các loại hoa khác</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#present">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        Quà tặng
                                    </a>
                                </h4>
                            </div>
                            <div id="present" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><a href="">Gấu bông</a></li>
                                        <li><a href="">Socola</a></li>
                                        <li><a href="">Bánh kem</a></li>
                                        <li><a href="">Giỏ trái cây</a></li>
                                        <li><a href="">Giỏ quà tặng</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div><!--/category-products-->

                    <div class="brands_products"><!--brands_products-->
                        <h2>Hàng Hot</h2>
                        <div class="brands-name">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#"> <span class="pull-right">(50)</span>Hoa hồng đỏ</a></li>
                                <li><a href="#"> <span class="pull-right">(56)</span>Hoa tulip</a></li>
                                <li><a href="#"> <span class="pull-right">(27)</span>Hoa hồng vàng</a></li>
                                <li><a href="#"> <span class="pull-right">(32)</span>Gấu siêu to khổng lồ</a></li>
                                <li><a href="#"> <span class="pull-right">(5)</span>Socola tặng gấu</a></li>
                                <li><a href="#"> <span class="pull-right">(9)</span>Hoa tình yêu lãng mạng</a></li>
                                <li><a href="#"> <span class="pull-right">(4)</span>Hoa sinh nhật</a></li>
                            </ul>
                        </div>
                    </div><!--/brands_products-->

                    <div class="price-range"><!--price-range-->
                        <h2>Price Range</h2>
                        <div class="well text-center">
                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                            <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                        </div>
                    </div><!--/price-range-->

                    <div class="shipping text-center"><!--shipping-->
                        <img src="images/home/shipping.jpg" alt="" />
                    </div><!--/shipping-->

                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="features_items" id="data-container"><!--features_items-->
                    <h2 class="title text-center">Danh Mục Hoa</h2>
                    <form:form action="user/cart" method="GET">
                        <c:forEach var="rows" items="${flowertype}">
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <p class="txtid" hidden>${rows.id}</p>
                                            <p class="pname" hidden>${rows.name}</p>
                                            <p class="pprice" hidden>${rows.price}</p>
                                            <a href="user/product/${rows.id}"><img src="images/hoa/${rows.image}" alt="" /></a>
                                            <h2 name="txtPrice">${rows.price}₫</h2>
                                            <p name="txtName">${rows.name}</p>
                                            <a href="user/product/${rows.id}" class="btn btn-default add-to-cart">Xem Sản Phẩm</a>
                                            <a href="user/buy/${rows.id}?yeucau=muasp&txtmasp=${rows.id}" class="btn btn-danger add-to-cart"><i class="fa fa-shopping-cart"></i>Mua</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </form:form>
                    <div id="pagination-container"></div>
                </div><!--features_items-->
                

                <!--recommended_items<div class="recommended_items">
                    <h2 class="title text-center">recommended items</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">	
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/recommend1.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/recommend2.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/recommend3.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">	
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/recommend1.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/recommend2.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/recommend3.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>			
                    </div>
                </div>recommended_items-->

            </div>
        </div>
    </div>
</section>
<script>
    $('#pagination-container').pagination({
        dataSource: [1, 2, 3, 4, 5, 6, 7, ..., 195],
        callback: function (data, pagination) {
            // template method of yourself
            var html = template(data);
            $('#data-container').html(html);
        }
    })
</script>

