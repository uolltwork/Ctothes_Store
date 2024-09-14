<%-- 
    Document   : HomeFiltter
    Created on : Oct 17, 2022, 7:32:59 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Nav-home fitter -->
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container">
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="home"
                       >Home</a
                    >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Top trending</a>
                </li>

                <li class="nav-item top-sale-btn">
                    <a href="saleHandler" class="nav-link">Top sale</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link">Contact us</a>
                </li>
            </ul>
            <form class="d-flex" role="search" action="search" method="get">
                <input
                    class="form-control me-2"
                    type="search"
                    placeholder="Find products"
                    aria-label="Search"
                    name="txtSearch"
                    value="${searchValue}"
                    />
                <button class="btn btn-search" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <c:if test="${sessionScope.accountSeesion != null}">
                    <c:if test="${sessionScope.accountSeesion.ID == 1}">
                    </c:if>
                    <c:if test="${sessionScope.accountSeesion.ID != 1}">
                        <a class="cart" href="cartLoad?accountID=${sessionScope.accountSeesion.ID}">
                            <i class="fa-solid fa-cart-plus"></i>
                            <span class="cart-quantity">${sessionScope.listCartSize}</span>
                        </a>
                    </c:if>
                </c:if> 
                <c:if test="${sessionScope.accountSeesion == null}">
                    <a class="cart" href="home">
                        <i class="fa-solid fa-cart-plus"></i>
                        <span class="cart-quantity">0</span>
                    </a>
                </c:if> 
            </form>
        </div>
    </div>
</nav>
