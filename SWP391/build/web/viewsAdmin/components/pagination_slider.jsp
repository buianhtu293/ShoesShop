<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<form action="sliderList">
    <input type="text" name="search" value="${search}" hidden="">
    <ul class="pagination">
        <c:choose>
            <c:when test="${cp != 1}">
                <li class="page-item">
                    <a class="page-link" href="sliderList?currentPage=1">Head</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="sliderList?currentPage=1">Head</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:if test="${cp > 1}">
            <li class="page-item">
                <input type="submit"  class="page-link"  name="currentPage" value="${cp-1}" />
            </li>
        </c:if>
        <li class="page-item active">
            <input type="submit"  class="page-link"  name="currentPage" value="${cp}" />
        </li>
        <c:if test="${cp < totalPage}">
            <li class="page-item">
                <input type="submit"  class="page-link"  name="currentPage" value="${cp+1}" />
            </li>
        </c:if>

        <c:if  test="${cp < totalPage - 1}">
            <li class="page-item">
                <input type="submit"  class="page-link"  name="currentPage" value="${totalPage}" />
            </li>
        </c:if>
        <c:choose>
            <c:when test="${cp != totalPage}">
                <li class="page-item ">
                    <a class="page-link" href="sliderList?currentPage=${totalPage}">Last</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="sliderList?currentPage=${totalPage}">Last</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</form>