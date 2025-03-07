<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, mdao.*, utils.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <div id="page">

            <!-- Header -->
            <jsp:include page="header.jsp"/>

            <main>

                <div id="carousel-home">

                    <!--Slider of home-->
                    <div class="owl-carousel owl-theme">
                        <c:forEach var="element" items="${slider.subList(1,4)}">
                            <div class="owl-slide cover" style="background-image: url(${element.image});">
                                <div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.5)">
                                    <div class="container">
                                        <div class="row justify-content-center justify-content-md-end">
                                            <div class="col-lg-6 static">
                                                <div class="slide-text text-end white">
                                                    <h2 class="owl-slide-animated owl-slide-title">${element.title}</h2>
                                                    <div class="owl-slide-animated owl-slide-cta"><a class="btn_1" href="product" role="button">Shop Now</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                    <!--End Slider of home-->
                    <div id="icon_drag_mobile"></div>
                </div>
                <!--/carousel-->

                <!--Collection of home-->
                <ul id="banners_grid" class="clearfix">
                    <c:forEach var="element" items="${slider.subList(5,8)}">
                        <li>
                            <a href="product" class="img_container">
                                <img src="${element.image}" data-src="${element.image}" alt="" class="lazy">
                                <div class="short_info opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
                                    <h3>${element.title}</h3>
                                    <div><span class="btn_1">Shop Now</span></div>
                                </div>
                            </a>
                        </li> 
                    </c:forEach>


                </ul>
                <!--End Collection of home-->


                <!--/Top Selling -->
                <div class="row">
                    <!-- <div class="col-9"> -->
                    <div class="col-8 container margin_60_35">
                        <div class="main_title">
                            <h2>Top Selling</h2>
                            <span>Products</span>
                            <!-- <p>Cum doctus civibus efficiantur in imperdiet deterruisset</p> -->
                        </div>
                        <div class="row small-gutters">
                            <c:forEach var="element" items="${topSelling}">
                                <div class="col-6 col-md-4 col-xl-3">
                                    <div class="grid_item">
                                        <figure>
                                            <c:set var="found" value="false" />

                                            <c:forEach var="status" items="${element.status}" >
                                                <c:if test="${not found}">
                                                    <c:if test="${status eq 'new'}">
                                                        <span class="ribbon new">${status}</span>
                                                        <c:set var="found" value="true" />
                                                    </c:if>
                                                    <c:if test="${status eq 'hot'}">
                                                        <span class="ribbon hot">${status}</span>
                                                        <c:set var="found" value="true" />
                                                    </c:if>
                                                    <c:if test="${status eq 'common'}">
                                                        <c:if test="${element.discount_status == 1}">
                                                            <span class="ribbon off">-${status}%</span>
                                                            <c:set var="found" value="true" />
                                                        </c:if> 
                                                    </c:if>
                                                </c:if>  
                                            </c:forEach>

                                            <a href="product?service=detail&name=${element.name}&brand=${element.brand_name}">
                                                <img class="img-fluid lazy" src="${element.img1}" data-src="${element.img1}" alt="">
                                                <img class="img-fluid lazy" src="${element.img2}" data-src="${element.img2}" alt="">
                                            </a>
                                            <!--                                            <div data-countdown="2019/05/15" class="countdown"></div>-->
                                        </figure>
                                        <div class="rating">
                                            <%
                                                // Access the 'element' object from the pageContext
                                                Object elementObj = pageContext.findAttribute("element");
                                                 
                                                if (elementObj != null) {
                                                    // Cast it to the expected type
                                                    SubProducts element = (SubProducts) elementObj;

                                                    // Initialize variables for calculating the average rating
                                                    int[] ratings = element.getRating();
                                                    int sum = 0;
                                                    for (int rating : ratings) {
                                                        sum += rating;
                                                    }

                                                    // Calculate the average rating
                                                    int rate = (ratings.length > 0) ? (sum / ratings.length) : 0;
                                                    request.setAttribute("rate", rate);
                                                }
                                            %>
                                            <c:set var="rate" value="${requestScope.rate}" />
                                            <c:forEach begin="1" end="${rate}" step="1">
                                                <i class="icon-star voted"></i>
                                            </c:forEach>
                                            <c:forEach begin="${rate + 1}" end="5" step="1">
                                                <i class="icon-star"></i>
                                            </c:forEach>

                                        </div>
                                        <a href="product?service=detail&name=${element.name}&brand=${element.brand_name}">
                                            <h3>${element.name}</h3>
                                        </a>
                                        <div class="price_box">
                                            <c:if test="${element.discount_status == 1}">                                              
                                                <span class="new_price">$${element.price*(100-element.discount)/100}</span>
                                                <span class="old_price">$${element.price}</span>
                                            </c:if>
                                            <c:if test="${element.discount_status == 0}">                                              
                                                <span class="new_price">$${element.price}</span>                                                
                                            </c:if>     
                                        </div>
                                        <ul>
                                            <li>

                                                <c:set var="colors" value="${element.color}" />
                                                <c:set var="formattedColors" value="" />
                                                <c:forEach items="${colors}" var="color" varStatus="loop">
                                                    <c:set var="formattedColor" value='"${color}"' />
                                                    <c:if test="${not loop.last}">
                                                        <c:set var="formattedColor" value='${formattedColor}, ' />
                                                    </c:if>
                                                    <c:set var="formattedColors" value="${formattedColors}${formattedColor}" />
                                                </c:forEach>

                                                <c:set var="sizes" value="${element.size}" />
                                                <c:set var="formattedSizes" value="" />
                                                <c:forEach items="${sizes}" var="size" varStatus="loop">
                                                    <c:set var="formattedSize" value='"${size}"' />
                                                    <c:if test="${not loop.last}">
                                                        <c:set var="formattedSize" value='${formattedSize}, ' />
                                                    </c:if>
                                                    <c:set var="formattedSizes" value="${formattedSizes}${formattedSize}" />
                                                </c:forEach>
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" 
                                                        data-name="${element.name}" 
                                                        data-colors='[${formattedColors}]' 
                                                        data-sizes='[${formattedSizes}]' 
                                                        >                  
                                                    <i class="ti-shopping-cart"></i>
                                                </button>

                                            </li>
                                        </ul>
                                    </div>
                                    <!-- /grid_item -->
                                </div>
                            </c:forEach>
                        </div>
                        <!-- /row -->
                    </div>
                    <!-- /container -->
                    <!-- </div> -->
                    <div class="col-4">
                        <div class="container margin_60_35">
                            <div class="main_title">
                                <h2>Blogs</h2>
                                <span>Blog</span>
                                <!-- <p>Cum doctus civibus efficiantur in imperdiet deterruisset</p> -->
                            </div>
                            <!-- <div class="row"> -->
                            <c:forEach var="element" items="${blog}">
                                <div class="col-lg-12">
                                    <h5>${element.title}</h5>
                                    <a class="box_news" href="blogDetail?id=${element.id}">

                                        <figure>
                                            <img src="${element.cover_img}" data-src="${element.cover_img}" alt="" width="100" height="76" class="lazy">								
                                        </figure>
                                        <ul>
                                            <!--                                        <li>by Mark Twain</li>-->
                                            <li><fmt:formatDate value="${element.created_at}" pattern="dd.MM.yyyy"/></li>
                                        </ul>
                                        <p>${element.context}</p>
                                    </a>													

                                </div>

                            </c:forEach>

                            <!-- /box_news -->
                            <!-- </div> -->
                            <!-- /row -->
                        </div>
                        <!-- /container -->
                    </div>
                </div>

                <!--/Top Selling -->

                <!-- sLider -->
                <div class="featured lazy" data-bg="url(${slider.get(10).image}">
                    <div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.5)">
                        <div class="container margin_60">
                            <div class="row justify-content-center justify-content-md-start">
                                <div class="col-lg-6 wow" data-wow-offset="150">
                                    <h3>${slider.get(10).title}</h3>
                                    <p>${slider.get(10).content}</p>
                                    <div class="feat_text_block">
                                        <a class="btn_1" href="product" role="button">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Slider -->

                <!-- featured -->
                <div class="container margin_60_35">
                    <div class="main_title">
                        <h2>Featured</h2>
                        <span>Products</span>
                        <!-- <p>Cum doctus civibus efficiantur in imperdiet deterruisset</p> -->
                    </div>
                    <div class="owl-carousel owl-theme products_carousel">
                        <c:forEach var="element" items="${featured}">
                            <div class="item">
                                <div class="grid_item">
                                    <c:set var="found" value="false" />

                                    <c:forEach var="status" items="${element.status}" >
                                        <c:if test="${not found}">
                                            <c:if test="${status eq 'new'}">
                                                <span class="ribbon new">${status}</span>
                                                <c:set var="found" value="true" />
                                            </c:if>
                                            <c:if test="${status eq 'hot'}">
                                                <span class="ribbon hot">${status}</span>
                                                <c:set var="found" value="true" />
                                            </c:if>
                                            <c:if test="${status eq 'common'}">
                                                <c:if test="${element.discount_status == 1}">
                                                    <span class="ribbon off">-${status}%</span>
                                                    <c:set var="found" value="true" />
                                                </c:if> 
                                            </c:if>
                                        </c:if>  
                                    </c:forEach>
                                    <figure>
                                        <a href="product?service=detail&name=${element.name}&brand=${element.brand_name}">
                                            <img class="owl-lazy" src="${element.img1}" data-src="${element.img1}" alt="">
                                        </a>
                                    </figure>
                                    <div class="rating">                                        
                                        <%
                                            // Access the 'element' object from the pageContext
                                            Object elementObj = pageContext.findAttribute("element");
                                            if (elementObj != null) {
                                                // Cast it to the expected type
                                                SubProducts element = (SubProducts) elementObj;

                                                // Initialize variables for calculating the average rating
                                                int[] ratings = element.getRating();
                                                int sum = 0;
                                                for (int rating : ratings) {
                                                    sum += rating;
                                                }

                                                // Calculate the average rating
                                                int rate = (ratings.length > 0) ? (sum / ratings.length) : 0;
                                                request.setAttribute("rate", rate);
                                            }
                                        %>
                                        <c:set var="rate" value="${requestScope.rate}" />
                                        <c:forEach begin="1" end="${rate}" step="1">
                                            <i class="icon-star voted"></i>
                                        </c:forEach>
                                        <c:forEach begin="${rate + 1}" end="5" step="1">
                                            <i class="icon-star"></i>
                                        </c:forEach>


                                    </div>
                                    <a href="product?service=detail&name=${element.name}&brand=${element.brand_name}">
                                        <h3>${element.name}</h3>
                                    </a>
                                    <div class="price_box">
                                        <c:if test="${element.discount_status == 1}">                                              
                                            <span class="new_price">$${element.price*(100-element.discount)/100}</span>
                                            <span class="old_price">$${element.price}</span>
                                        </c:if>
                                        <c:if test="${element.discount_status == 0}">                                              
                                            <span class="new_price">$${element.price}</span>                                                
                                        </c:if>     
                                    </div>
                                    <ul>
                                        <li>
                                            <c:set var="colors" value="${element.color}" />
                                            <c:set var="formattedColors" value="" />
                                            <c:forEach items="${colors}" var="color" varStatus="loop">
                                                <c:set var="formattedColor" value='"${color}"' />
                                                <c:if test="${not loop.last}">
                                                    <c:set var="formattedColor" value='${formattedColor}, ' />
                                                </c:if>
                                                <c:set var="formattedColors" value="${formattedColors}${formattedColor}" />
                                            </c:forEach>

                                            <c:set var="sizes" value="${element.size}" />
                                            <c:set var="formattedSizes" value="" />
                                            <c:forEach items="${sizes}" var="size" varStatus="loop">
                                                <c:set var="formattedSize" value='"${size}"' />
                                                <c:if test="${not loop.last}">
                                                    <c:set var="formattedSize" value='${formattedSize}, ' />
                                                </c:if>
                                                <c:set var="formattedSizes" value="${formattedSizes}${formattedSize}" />
                                            </c:forEach>
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" 
                                                    data-name="${element.name}" 
                                                    data-colors='[${formattedColors}]' 
                                                    data-sizes='[${formattedSizes}]' 
                                                    >                  
                                                <i class="ti-shopping-cart"></i>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /grid_item -->
                            </div>
                            <!-- /item -->
                        </c:forEach>


                    </div>
                    <!-- /products_carousel -->
                </div>
                <!-- featured -->
                <!-- /container -->

                <div class="bg_gray">
                    <div class="container margin_30">
                        <div id="brands" class="owl-carousel owl-theme">
                            <div class="item">
                                <a href="#0"><img src="img/brands/adidas.png" data-src="img/brands/adidas.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                            <div class="item">
                                <a href="#0"><img src="img/brands/crocs.png" data-src="img/brands/crocs.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                            <div class="item">
                                <a href="#0"><img src="img/brands/dd.png" data-src="img/brands/dd.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                            <div class="item">
                                <a href="#0"><img src="img/brands/jaxson.png" data-src="img/brands/jaxson.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                            <div class="item">
                                <a href="#0"><img src="img/brands/jordan.png" data-src="img/brands/jordan.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                            <div class="item">
                                <a href="#0"><img src="img/brands/nike.png" data-src="img/brands/nike.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                            <div class="item">
                                <a href="#0"><img src="img/brands/puma.png" data-src="img/brands/puma.png" alt="" class="owl-lazy"></a>
                            </div><!-- /item -->
                        </div><!-- /carousel -->
                    </div><!-- /container -->
                </div>
                <!-- /bg_gray -->


            </main>
            <!-- /main --> 

            <jsp:include page="footer.jsp"/>
        </div>
        <!-- page -->

        <div id="toTop"></div><!-- Back to top button -->

        <jsp:include page="modal.jsp"/>



        <!-- SPECIFIC SCRIPTS -->
        <script src="js/carousel-home.js"></script>
        <script src="js/sticky_sidebar.min.js"></script>
        <script src="js/specific_listing.js"></script>
        <script src="js/jquery.cookiebar.js"></script>
        <script src="js/tu.js"></script>
        <script src="js/vaidate.js"></script>
        <script>
            $(document).ready(function () {
                'use strict';
                $.cookieBar({
                    fixed: true
                });
            });
        </script>
    </body>
</html>
