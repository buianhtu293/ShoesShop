<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<div class="text-center col-md-6 mt-5" style="margin-left: 40%">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                <a class="page-link" href="${thisPage}?page=1&searchQuery=${searchQuery}" aria-label="First">
                    <span aria-hidden="true">&laquo;&laquo;</span>
                </a>
            </li>
            <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                <a class="page-link" href="${thisPage}?page=${currentPage - 1}&searchQuery=${searchQuery}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <c:forEach var="i" begin="1" end="${totalPages}">
                <li class="page-item <c:if test="${currentPage == i}">active</c:if>">
                    <a class="page-link" href="${thisPage}?page=${i}&searchQuery=${searchQuery}">${i}</a>
                </li>
            </c:forEach>

            <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                <a class="page-link" href="${thisPage}?page=${currentPage + 1}&searchQuery=${searchQuery}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                <a class="page-link" href="${thisPage}?page=${totalPages}&searchQuery=${searchQuery}" aria-label="Last">
                    <span aria-hidden="true">&raquo;&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
