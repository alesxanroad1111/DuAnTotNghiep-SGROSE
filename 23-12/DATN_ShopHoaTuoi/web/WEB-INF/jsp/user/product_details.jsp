<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="rt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<base href="${pageContext.servletContext.contextPath}/">
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

                    </div>
                    <!--/category-products-->

                    <div class="brands_products">
                        <!--brands_products-->
                        <h2>Hàng Hot</h2>
                        <div class="brands-name">
                        <ul class="nav nav-pills nav-stacked">
                                <li><a href="#"> <span class="pull-right badge">(50)</span>Hoa hồng đỏ</a></li>
                                <li><a href="#"> <span class="pull-right badge">(56)</span>Hoa tulip</a></li>
                                <li><a href="#"> <span class="pull-right badge">(27)</span>Hoa hồng vàng</a></li>
                                <li><a href="#"> <span class="pull-right badge">(32)</span>Gấu siêu to khổng lồ</a></li>
                                <li><a href="#"> <span class="pull-right badge">(5)</span>Socola tặng gấu</a></li>
                                <li><a href="#"> <span class="pull-right badge">(9)</span>Hoa tình yêu lãng mạng</a></li>
                                <li><a href="#"> <span class="pull-right badge">(4)</span>Hoa sinh nhật</a></li>
                            </ul>
                        </div>
                    </div>
                    <!--/brands_products-->

                    <div class="price-range">
                        <!--price-range-->
                        <h2>Price Range</h2>
                        <div class="well">
                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600"
                                   data-slider-step="5" data-slider-value="[250,450]" id="sl2"><br />
                            <b>$ 0</b> <b class="pull-right">$ 600</b>
                        </div>
                    </div>
                    <!--/price-range-->

                    <div class="shipping text-center">
                        <!--shipping-->
                        <img src="images/home/shipping.jpg" alt="" />
                    </div>
                    <!--/shipping-->

                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="product-details">
                    <!--product-details-->
                    <div class="col-sm-5">
                        <div class="view-product">
                            <img src="images/hoa/${flower.image}" alt="${flower.name}" />
                            <h3>Sale</h3>
                        </div>

                    </div>
                    <div class="col-sm-7">
                        <div class="product-information">
                            <!--/product-information-->
                            <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                            <h2>${flower.name}</h2>
                            <img src="images/product-details/rating.png" alt="" />

                            <div class="row">
                                <div class="col-sm-8">
                                    <span>
                                        <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${flower.price}" type = "number"/>₫</span>

                                    </span>
                                </div>
                                <div class="col-sm-4">
                                    <a href="user/buy/${flower.id}?yeucau=muasp&txtmasp=${flower.id}" class="btn btn-fefault cart">
                                        <i class="fa fa-shopping-cart"></i>
                                        MUA
                                    </a>
                                </div>
                            </div>
                            <p><b>Tình trạng:</b> Còn hàng</p>
                            <p><b>Trạng thái:</b> New</p>
                            <p><b>Brand:</b> SG_Rose</p>
                            <a href=""><img src="images/product-details/share.png" class="share img-responsive"
                                            alt="" /></a>
                        </div>
                        <!--/product-information-->
                    </div>
                </div>
                <!--/product-details-->

                <div class="category-tab shop-details-tab">
                    <!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#details" data-toggle="tab">Mô tả về hoa</a></li>
                            <li><a href="#reviews" data-toggle="tab">Đánh giá</a></li>

                    </div>
                    <div class="tab-content">

                        <div class="tab-pane fade active in" id="details">
                            <div class="col-sm-11">
                                <h2 class="display-4" style="color: #ec4c76;">${flower.name}</h2>
                                <p>${flower.notes}</p>
                            </div>
                            <div class="col-sm-11 text-center">
                                <img src="images/hoa/${flower.image}" alt="${flower.image}"/>
                            </div>

                        </div>
                        <div class="tab-pane fade in" id="reviews" >
                            <div class="col-sm-12">
                                <ul>
                                    <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                    <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                    <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                <p><b>Write Your Review</b></p>

                                <form action="#">
                                    <span>
                                        <input type="text" placeholder="Your Name"/>
                                        <input type="email" placeholder="Email Address"/>
                                    </span>
                                    <textarea name="" ></textarea>
                                    <b>Rating: </b> <img src="images/product-details/rating.png" alt="" />
                                    <button type="button" class="btn btn-default pull-right">
                                        Submit
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <!--/category-tab-->

        <!--<div class="recommended_items">
          recommended_items
           <h2 class="title text-center">Các loại hoa tương tự </h2>
          
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
                                       <button type="button" class="btn btn-default add-to-cart"><i
                                               class="fa fa-shopping-cart"></i>Add to cart</button>
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
                                       <button type="button" class="btn btn-default add-to-cart"><i
                                               class="fa fa-shopping-cart"></i>Add to cart</button>
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
                                       <button type="button" class="btn btn-default add-to-cart"><i
                                               class="fa fa-shopping-cart"></i>Add to cart</button>
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
                                       <button type="button" class="btn btn-default add-to-cart"><i
                                               class="fa fa-shopping-cart"></i>Add to cart</button>
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
                                       <button type="button" class="btn btn-default add-to-cart"><i
                                               class="fa fa-shopping-cart"></i>Add to cart</button>
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
                                       <button type="button" class="btn btn-default add-to-cart"><i
                                               class="fa fa-shopping-cart"></i>Add to cart</button>
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
       </div>
       recommended_items-->

    </div>
</div>
</div>
</section>