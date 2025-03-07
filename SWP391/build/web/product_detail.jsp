<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, dao.*, util.* " %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <div id="page" class="theia-exception">	
            <jsp:include page="header.jsp"/>
            <main class="bg_gray">
                <div class="top_banner">
                    <div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.3)">
                        <div class="container">
                            <!-- <div class="breadcrumbs">
                                    <ul>
                                            <li><a href="#">Home</a></li>
                                            <li><a href="#">Category</a></li>
                                            <li>Page active</li>
                                    </ul>
                            </div> -->
                            <h1>${slider.title}</h1>                      
                        </div>
                    </div>
                    <img src="${slider.image}" class="img-fluid" alt="">
                </div>
                <!-- /top_banner -->

                <!-- /toolbox -->
                <div class="container margin_30">
                    <div class="row">
                        <!-- Sider -->
                        <div class="col-lg-3"> 
                            <jsp:include page="sider.jsp"/> 
                        </div>

                        <!-- Body content -->
                        <div class="col-lg-9 bg_gray">
                            <div class="container margin_30">
                                <div class="page_header">
                                    <h1>${product.name}</h1>
                                </div>
                                <!-- /page_header -->
                                <div class="row justify-content-center">
                                    <div class="col-lg-8">
                                        <div class="owl-carousel owl-theme prod_pics magnific-gallery">
                                            <div class="item">
                                                <a href="${product.img1}" title="Photo title" data-effect="mfp-zoom-in"><img src="${product.img1}" alt=""></a>
                                            </div>
                                            <!-- /item -->
                                            <div class="item">
                                                <a href="${product.img2}" title="Photo title" data-effect="mfp-zoom-in"><img src="${product.img2}" data-src="${product.img2}" alt="" class="owl-lazy"></a>
                                            </div>
                                            <!-- /item -->
                                        </div>
                                        <!-- /carousel -->
                                    </div>
                                </div>
                                <!-- /row -->
                            </div>
                            <!-- /container -->
                            <<form action="product" method="post">
                            <div class="bg_white">
                                <div class="container margin_60_35">
                                    <div class="row justify-content-between">
                                        <div class="col-lg-6">
                                            <div class="prod_info version_2">
                                                <span class="rating">
                                                    <%
                                                    // Access the 'element' object from the pageContext
                                                        Object elementObj1 = pageContext.findAttribute("product");
                                                        if (elementObj1 != null) {
                                                            // Cast it to the expected type
                                                            SubProducts element = (SubProducts) elementObj1;

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
                                                </span>
                                                
                                                    <small>Categories: 
                                                        <c:forEach var="element" items="${product.categories}">
                                                            ${element}  
                                                        </c:forEach>
                                                    </small>
           
                                                <c:forEach var="element" items="${product.description}">
                                                    <p>${element}</p>
                                                </c:forEach> 
                                            
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="prod_options version_2">
                                                <div class="row">
                                                    <label class="col-xl-7 col-lg-5 col-md-6 col-6"><strong>color</strong> </label>
                                                    <div class="col-xl-5 col-lg-5 col-md-6 col-6">
                                                        <div class="custom-select-form">
                                                            <select class="wide">
                                                                <option value="" selected="">Color</option>
                                                                <c:forEach var="element" items="${product.color}">
                                                                    <option name="color" value="${element}">${element}</option>
                                                                </c:forEach> 
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-xl-7 col-lg-5 col-md-6 col-6"><strong>Size</strong> - Size Guide <a href="#0" data-bs-toggle="modal" data-bs-target="#size-modal"><i class="ti-help-alt"></i></a></label>
                                                    <div class="col-xl-5 col-lg-5 col-md-6 col-6">
                                                        <div class="custom-select-form">
                                                            <select class="wide">
                                                                <option value="" selected="">Size</option>
                                                                <c:forEach var="element" items="${product.size}">
                                                                    <option name="size" value="${element}">${element}</option>
                                                                </c:forEach> 
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-xl-7 col-lg-5  col-md-6 col-6"><strong>Quantity</strong></label>
                                                    <div class="col-xl-5 col-lg-5 col-md-6 col-6">
                                                        <div class="numbers-row">
                                                            <input type="text" value="1" id="quantity_1" class="qty2" name="quantity">
                                                            <div class="inc button_inc">+</div>
                                                            <div class="dec button_inc">-</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-3">
                                                    <div class="col-lg-7 col-md-6">
                                                        <c:if test="${product.discount_status == 1}">
                                                            <div class="price_main">
                                                                <span class="new_price">$${product.price*(100-product.discount)/100}</span>
                                                                <span class="percentage">-${product.discount}%</span> 
                                                                <span class="old_price">$${product.price}</span>
                                                            </div>
                                                        </c:if>                                 
                                                        <c:if test="${product.discount_status == 0}">
                                                            <div class="price_main">
                                                                <span class="new_price">$${product.price}</span>>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="col-lg-5 col-md-6">
                                                        <input type="hidden" name="name" value="${product.name}">
                                                        <input type="hidden" name="service" value="addCart">
                                                        <div class="btn_add_to_cart"><input type="submit" value="Add to cart"class="btn_1"></input></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /row -->
                                </div>
                            </div>
                            <!-- /bg_white -->
                            </form>

                            <!--                            <div class="tabs_product bg_white version_2">
                                                            <div class="container">
                                                                <ul class="nav nav-tabs" role="tablist">
                                                                    <li class="nav-item">
                                                                        <a id="tab-A" href="#pane-A" class="nav-link active" data-bs-toggle="tab" role="tab">Description</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a id="tab-B" href="#pane-B" class="nav-link" data-bs-toggle="tab" role="tab">Reviews</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                         /tabs_product 
                            
                                                        <div class="tab_content_wrapper">
                                                            <div class="container">
                                                                <div class="tab-content" role="tablist">
                                                                    <div id="pane-A" class="card tab-pane fade active show" role="tabpanel" aria-labelledby="tab-A">
                                                                        <div class="card-header" role="tab" id="heading-A">
                                                                            <h5 class="mb-0">
                                                                                <a class="collapsed" data-bs-toggle="collapse" href="#collapse-A" aria-expanded="false" aria-controls="collapse-A">
                                                                                    
                                                                                </a>
                                                                            </h5>
                                                                        </div>
                            
                                                                        <div id="collapse-A" class="collapse" role="tabpanel" aria-labelledby="heading-A">
                                                                            <div class="card-body">
                                                                                <div class="row justify-content-between">
                                                                                    <div class="col-lg-6">
                                                                                        <h3>Details</h3>
                                                                                        <p>Lorem ipsum dolor sit amet, in eleifend <strong>inimicus elaboraret</strong> his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.</p>
                                                                                        <p>Vis ei ipsum conclusionemque. Te enim suscipit recusabo mea, ne vis mazim aliquando, everti insolens at sit. Cu vel modo unum quaestio, in vide dicta has. Ut his laudem explicari adversarium, nisl <strong>laboramus hendrerit</strong> te his, alia lobortis vis ea.</p>
                                                                                        <p>Perfecto eleifend sea no, cu audire voluptatibus eam. An alii praesent sit, nobis numquam principes ea eos, cu autem constituto suscipiantur eam. Ex graeci elaboraret pro. Mei te omnis tantas, nobis viderer vivendo ex has.</p>
                                                                                    </div>
                                                                                    <div class="col-lg-5">
                                                                                        <h3>Specifications</h3>
                                                                                        <div class="table-responsive">
                                                                                            <table class="table table-sm table-striped">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td><strong>Color</strong></td>
                                                                                                        
                                                                                                        <td>Blue</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td><strong>Size</strong></td>
                                                                                                        <td>150x100x100</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td><strong>Weight</strong></td>
                                                                                                        <td>0.6kg</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td><strong>Manifacturer</strong></td>
                                                                                                        <td>Manifacturer</td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                         /table-responsive 
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                     /TAB A 
                                                                    <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
                                                                        <div class="card-header" role="tab" id="heading-B">
                                                                            <h5 class="mb-0">
                                                                                <a class="collapsed" data-bs-toggle="collapse" href="#collapse-B" aria-expanded="false" aria-controls="collapse-B">
                                                                                    Reviews
                                                                                </a>
                                                                            </h5>
                                                                        </div>
                                                                        <div id="collapse-B" class="collapse" role="tabpanel" aria-labelledby="heading-B">
                                                                            <div class="card-body">
                                                                                <div class="row justify-content-between">
                                                                                    <div class="col-lg-5">
                                                                                        <div class="review_content">
                                                                                            <div class="clearfix add_bottom_10">
                                                                                                <span class="rating"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><em>5.0/5.0</em></span>
                                                                                                <em>Published 54 minutes ago</em>
                                                                                            </div>
                                                                                            <h4>"Commpletely satisfied"</h4>
                                                                                            <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros eirmod scaevola sea. Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his.</p>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-lg-5">
                                                                                        <div class="review_content">
                                                                                            <div class="clearfix add_bottom_10">
                                                                                                <span class="rating"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star empty"></i><i class="icon-star empty"></i><em>4.0/5.0</em></span>
                                                                                                <em>Published 1 day ago</em>
                                                                                            </div>
                                                                                            <h4>"Always the best"</h4>
                                                                                            <p>Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his.</p>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                 /row 
                                                                                <div class="row justify-content-between">
                                                                                    <div class="col-lg-5">
                                                                                        <div class="review_content">
                                                                                            <div class="clearfix add_bottom_10">
                                                                                                <span class="rating"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star empty"></i><em>4.5/5.0</em></span>
                                                                                                <em>Published 3 days ago</em>
                                                                                            </div>
                                                                                            <h4>"Outstanding"</h4>
                                                                                            <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros eirmod scaevola sea. Et nec tantas accusamus salutatus, sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his.</p>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-lg-5">
                                                                                        <div class="review_content">
                                                                                            <div class="clearfix add_bottom_10">
                                                                                                <span class="rating"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><em>5.0/5.0</em></span>
                                                                                                <em>Published 4 days ago</em>
                                                                                            </div>
                                                                                            <h4>"Excellent"</h4>
                                                                                            <p>Sit commodo veritus te, erat legere fabulas has ut. Rebum laudem cum ea, ius essent fuisset ut. Viderer petentium cu his.</p>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                 /row 
                                                                                <p class="text-end"><a href="leave-review.html" class="btn_1">Leave a review</a></p>
                                                                            </div>
                                                                             /card-body 
                                                                        </div>
                            
                                                                    </div>
                                                                     /tab B 
                                                                </div>
                                                                 /tab-content 
                                                            </div>
                                                             /container 
                                                        </div>
                                                         /tab_content_wrapper -->
                        </div>
                        <!-- /col -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->


                <!--Ralated product-->
                <div class="bg_white">
                    <div class="container margin_60_35">
                        <div class="main_title">
                            <h2>Related</h2>
                            <span>Products</span>
<!--                            <p>Cum doctus civibus efficiantur in imperdiet deterruisset.</p>-->
                        </div>
                        <div class="owl-carousel owl-theme products_carousel">
                            <c:forEach var="element" items="${relateProduct}">
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
                    <!-- /container -->
                </div>
                <!-- /bg_white -->	
            </main>
            <!-- /main -->


            <jsp:include page="footer.jsp"/>
            <!--/footer-->
        </div>
        <!-- page -->

<!--        <div class="top_panel">
            <div class="container header_panel">
                <a href="#0" class="btn_close_top_panel"><i class="ti-close"></i></a>
                <label>1 product added to cart</label>
            </div>
             /header_panel 
            <div class="item">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="item_panel">
                                <figure>
                                    <img src="img/products/product_placeholder_square_small.jpg" data-src="img/products/shoes/1.jpg" class="lazy" alt="">
                                </figure>
                                <h4>1x Armor Air X Fear</h4>
                                <div class="price_panel"><span class="new_price">$148.00</span><span class="percentage">-20%</span> <span class="old_price">$160.00</span></div>
                            </div>
                        </div>
                        <div class="col-md-5 btn_panel">
                            <a href="cart.html" class="btn_1 outline">View cart</a> <a href="checkout.html" class="btn_1">Checkout</a>
                        </div>
                    </div>
                </div>
            </div>-->

        <!-- COMMON SCRIPTS -->
         <jsp:include page="modal.jsp"/>
        <!-- SPECIFIC SCRIPTS -->
        <script src="js/sticky_sidebar.min.js"></script>
        <script src="js/specific_listing.js"></script>


    </body>
</html>