<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edgeF" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css"/>
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <link rel="stylesheet" href="./assert/css/style.css" type="text/css">
        <style>

            * {
                font-family: monospace;
                font-size: 16px;
            }

            .cart {
                text-decoration: none;
                position: relative;
                margin-left: 12px;
                display: flex;
                align-items: center;
            }

            .cart i{
                font-size: 24px;
                color: black;
                position: relative;
                text-decoration: none;
            }

            .cart-quantity {
                display: block;
                width: 22px;
                background-color: var(--main-btn-color);
                color: white;
                text-align: center;
                font-size: 12px;
                font-weight: bold;
                border-radius: 6px;
                position: absolute;
                top: -4px;
                right: -10px;
            }

            .no-found-product-group {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .no-found-product {
                font-size: 16px;
                margin-top: 24px;
                margin-bottom: 56px;
                color: #666;
            }

            .card-btn button a {
                text-decoration: none;
                color: white;
            }

            .card-body .card-title a {
                display: block;
                --line-height: 20px;
                line-height: var(--line-height);
                height: var(--line-height);
                overflow: hidden;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 1;
            }

            .page-item {
                margin: 0px 4px;
            }

            .page-item .page-link {
                padding: 10px 18px;
                font-size: 16px;
                background-color: #f2f2f2;
                color: black;
                font-weight: bold;
            }

            .acctivePage {
                background-color: var(--main-btn-color) !important;
                color: white !important;
            }

            .card-sold-out {
                position: absolute;
                width: 110px;
                height: 32px;
                background-color: #333;
                border-radius: 2px;
                text-align: center;
                left: -8px;
                top: 10px;
                display: none;
            }

            .card-sold-out span {
                font-weight: bold;
                color: white;
                line-height: 32px;
                font-size: 14px;
            }

            .card-sold-out::before {
                content: "";
                display: block;
                position: absolute;
                border-top: 8px solid #555;
                border-left: 8px solid transparent;
                top: 100%;
                left: 0;
            }

            .active-soud-out {
                display: block;
            }


            .category-sort {
                width: 180px;
                height: 40px;
                text-align: center;
                border: 1px solid black;
                line-height: 40px;
                font-weight: 500;
                font-size: 15px;
                position: relative;
            }

            .category-sort i {
                margin-left: 4px;
            }

            .category-btn button {
                margin-bottom: 0;
            }

            .category-btn button a {
                color: black !important;
                font-weight: 400;
            }

            .category-sort-option {
                background-color: rgb(247, 246, 246);
                text-align: start;
                border-radius: 2px;
                box-shadow: 2px 2px rgb(229, 229, 229);
                position: absolute;
                right: 0;
                top: 46px;
                width: 180px;
                z-index: 10;
                display: none;
            }

            .category-sort span::before {
                content: "";
                width: 170px;
                height: 16px;
                background-color: transparent;
                position: absolute;
                bottom: -8px;
                right: 0;
            }

            .category-sort-option ul h5 {
                font-size: 16px;
                padding: 2px 32px;
                margin: 4px 0px;
                display: flex;
            }

            .category-sort-option ul h5 i {
                margin-left: 6px;
                margin-top: 4px;
            }

            .category-sort-option ul {
                padding-left: 0;
            }
            .category-sort-option ul li {
                width: 100%;
                height: 28px;
                list-style: none;
                padding-left: 0;
                padding: 0px 32px !important;
                display: flex;
                align-items: center;
            }

            .category-sort-option ul li a {
                text-decoration: none;
                color: rgb(102, 101, 101);
                font-size: 14px !important;
            }

            .category-sort-option ul li:hover {
                background-color: rgb(217, 214, 214);
            }

            .category-sort:hover .category-sort-option {
                display: block;
            }

        </style>
        <title>Now-Sai-Gon</title>
    </head>
    <body>
        <!-- Container contains all website -->
        <div class="app">

            <!-- 1. Navigation -->
            <jsp:include page="Navigation.jsp"></jsp:include>
            <jsp:include page="Logo.jsp"></jsp:include>
            <jsp:include page="HomeFiltter.jsp"></jsp:include>

                <!-- 2.Category - Product items -->
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="category">
                                <h5 class="category-heading">COLTHING:</h5>
                                <div class="category-btn">
                                    <button class="btn btn-dark">
                                        <a href="paggingHandler?currentPage=1">All items</a>
                                    </button>
                                <c:forEach items="${requestScope.listCategory}" var="i">
                                    <button class="btn btn-dark ${activeByID == i.ID ? "active" :""}"><a href="category?categoryId=${i.ID}">${i.name}</a></button>
                                    </c:forEach> 
                            </div>

<!--                            <div class="category-sort">
                                <span>Sắp xếp</span>
                                <i class="fa-solid fa-sort"></i>
                                <div class="category-sort-option">
                                    <ul>
                                        <li><a href="sortProductCus?typeSort=1">Giá tăng dần</a></li>
                                        <li><a href="sortProductCus?typeSort=2">Giá giảm dần</a></li>
                                    </ul>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>

            <!-- separator -->
            <div class="container container-sep">
                <div class="separator"></div>
            </div>

            <!-- 2. Container -->
            <div class="container">

                <!-- List products -->
                <div class="row mb-3 padding">
                    <c:forEach items="${requestScope.listProduct}" var="o"  >
                        <div class="col-xs-6 col-md-4 col-lg-3">
                            <div class="card">
                                <img
                                    class="card-img-top"
                                    src="img/${o.ID}.webp"
                                    alt=""
                                    />
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="detail?productID=${o.ID}" class="card-link">${o.title}</a>
                                    </h5>
                                    <p class="card-text">
                                        <strong>
                                            <fmt:formatNumber type="number" pattern="###,###" value="${o.price - (o.price * o.salePercent / 100)}" />đ
                                        </strong>
                                        <span class="old-price ${o.salePercent == 0 ? "disable" :""}">
                                            <fmt:formatNumber type="number" pattern="###,###" value="${o.price}" />đ
                                        </span>
                                    </p>
                                </div>
                                <div class="card-btn">
                                    <button class="btn btn-danger main-btn ">
                                        <a href="detail?productID=${o.ID}">Xem nhanh</a>
                                    </button>
                                    <button class="btn btn-danger main-btn">
                                        <a href="detail?productID=${o.ID}">Thêm vào giỏ</a>
                                    </button>
                                </div>
                                <div class="card-sale ${o.salePercent == 0 ? "disable" :""} ">
                                    <span class="card-sale-percent">-${o.salePercent}%</span>
                                </div> 
                                <div class="card-sold-out ${(o.sizeS + o.sizeM + o.sizeL + o.sizeXL  <= 0) ? "active-soud-out" :""} ">
                                    <span>Hết hàng</span>
                                </div>      
                            </div>
                        </div>
                    </c:forEach> 
                </div>

                <c:if test="${noFoundProduct == 0}">
                    <div class="row mb-3 padding ">
                        <div class="col-xs-12 no-found-product-group">
                            <img src="./img/no_product_found.png" alt="alt"/>
                            <h5 class="no-found-product">Không tìm thấy sản phẩm!!!</h5>
                        </div>
                    </div>
                </c:if>

                <c:if test="${noFoundProduct != 0}">
                    <!-- Pagination-->
                    <div class="row mb-3 padding row-page">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">

                                <c:if test="${indexPage == 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="paggingHandler?currentPage=${indexPage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${indexPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="paggingHandler?currentPage=${indexPage -1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="1" end="${maxPage}" var="pageNumber">
                                    <li class="page-item">
                                        <a class="page-link ${indexPage == pageNumber ? "acctivePage" : ""}" href="paggingHandler?currentPage=${pageNumber}">${pageNumber}</a>
                                    </li>
                                </c:forEach>


                                <c:if test="${indexPage == maxPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="paggingHandler?currentPage=${indexPage}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${indexPage != maxPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="paggingHandler?currentPage=${indexPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </c:if>
            </div>

            <!-- Footer -->    
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script src="./bootstrap/js/bootstrap.js"></script>
    </body>
</html>

