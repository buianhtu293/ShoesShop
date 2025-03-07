<%-- 
    Document   : sider
    Created on : May 15, 2024, 6:28:37 PM
    Author     : Nhat Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, dao.*, util.*" %>
<aside>
    <div class="filter_col">
        <div class="inner_bt"><a href="#" class="open_filters"><i class="ti-close"></i></a></div>
        <div class="filter_type version_2">
            <div class="d-none d-md-block">
                <div class="custom-search-input row">
                    <div class="col-10"> 
                        <input type="search" class="form-control p-3 col-10" placeholder="keywords"
                               aria-describedby="search-icon-1">
                    </div>
                    <button class="col-2" type="submit" ><i class="header-icon_search_custom"></i></button>
                </div>
            </div>						
        </div>
        <!-- /filter_type -->
        <div class="filter_type version_2">
            <h4><a href="#filter_1" data-bs-toggle="collapse" class="opened">Categories</a></h4>
            <div class="collapse show" id="filter_1">
                <ul>
                    <c:forEach var="element" items="${categorySider}">
                        <li>
                            <label class="container_check">${element.name}
                                <input type="checkbox" name="category" value="${element.name}">
                                <span class="checkmark"></span>
                            </label>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- /filter_type -->
        </div>
        <!-- /filter_type -->
        <div class="filter_type version_2">
            <h4><a href="#filter_2" data-bs-toggle="collapse" class="opened">Color</a></h4>
            <div class="collapse show" id="filter_2">
                <ul>
                    <c:forEach var="element" items="${colorSider}">
                        <li>
                            <label class="container_check">${element}
                                <input type="checkbox" name="color" value="${element}">
                                <span class="checkmark"></span>
                            </label>
                        </li>
                    </c:forEach>                                   
                </ul>
            </div>
        </div>
        <!-- /filter_type -->
        <div class="filter_type version_2">
            <h4><a href="#filter_3" data-bs-toggle="collapse" class="closed">Brands</a></h4>
            <div class="collapse" id="filter_3">
                <ul>
                    <c:forEach var="element" items="${brandSider}">
                        <li>
                            <label class="container_check">${element.name}
                                <input type="checkbox" name="brand" value="${element.name}">
                                <span class="checkmark"></span>
                            </label>
                        </li> 
                    </c:forEach>                                   
                </ul>
            </div>
        </div>
        <!-- /filter_type -->
        <div class="filter_type version_2">
            <h4><a href="#filter_4" data-bs-toggle="collapse" class="closed">Price</a></h4>
            <div class="collapse" id="filter_4">
                <ul>
                    <c:forEach var="element" items="${category}">

                    </c:forEach>
                    <li>
                        <label class="container_check">$0 — $50<small>11</small>
                            <input type="checkbox">
                            <span class="checkmark"></span>
                        </label>
                    </li>
                    <li>
                        <label class="container_check">$50 — $100<small>08</small>
                            <input type="checkbox">
                            <span class="checkmark"></span>
                        </label>
                    </li>
                    <li>
                        <label class="container_check">$100 — $150<small>05</small>
                            <input type="checkbox">
                            <span class="checkmark"></span>
                        </label>
                    </li>
                    <li>
                        <label class="container_check">$150 — $200<small>18</small>
                            <input type="checkbox">
                            <span class="checkmark"></span>
                        </label>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /filter_type -->
        <div class="buttons">
            <a href="#0" class="btn_1">Filter</a> <a href="#0" class="btn_1 gray">Reset</a>
        </div>
    </div>
    <div class="col-lg-12">
        <h4 class="mb-3">New products</h4>
        <c:forEach var="element" items="${newProductSider}"> 
            
            <div class="d-flex align-items-center justify-content-start">
                <div class="rounded me-4" style="width: 100px; height: 100px;">
                    <a href="product?service=detail&name=${element.name}&brand=${element.brand_name}">
                        <img src="${element.img1}" class="img-fluid rounded" alt="">
                    </a>
                </div>
                <div>
                    <h6 class="mb-2">${element.name}</h6>
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
                    <div class="price_box">
                        <c:if test="${element.discount_status == 1}">                                              
                            <span class="new_price">$${element.price*(100-element.discount)/100}</span>
                            <span class="old_price">$${element.price}</span>
                        </c:if>
                        <c:if test="${element.discount_status == 0}">                                              
                            <span class="new_price">$${element.price}</span>                                                
                        </c:if> 
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="d-flex justify-content-center my-4">
            <a href="#"
               class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Contact</a>
        </div>
    </div>
</aside>
<!-- /col -->
