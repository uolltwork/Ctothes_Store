<%-- 
    Document   : ManageProduct.jsp
    Created on : Oct 6, 2022, 1:18:11 AM
    Author     : PC
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <link rel="stylesheet" href="./assert/css/style.css" />
        <title>Manager Product</title>

        <style>
            .home-filter {
                background-color: rgb(143, 145, 147);
                color: black;
                align-items: center;
                padding: 24px;
                margin-bottom: 24px;
            }

            .nav-heading {
                margin: 10px 12px 2px 0px;
                color: #555;
            }

            .btn-add {
                width: 300px;
                height: 50px;
                padding: 12px;
                box-sizing: border-box;
                background-color: var(--main-btn-color);
                color: white;
                margin-right: 16px;
            }

            .primary-btn {
                width: 200px;
                padding: 12px 12px;
                margin-right: 12px;
                font-weight: 500;
                text-decoration: none;
            }

            .primary-btn i {
                font-size: 14px;
                margin-right: 4px;
            }

            .search-input {
                width: 220px;
            }

            .nav-total-product {
                min-width: 190px;
                background-color: var(--primary-btn-color);
                color: white;
                text-align: center;
                height: 46px;
                line-height: 46px;
                font-weight: 500;
            }

            .btn-group {
                margin: 24px 0px;
            }

            .align-middle {
                text-align: center;
            }

            .category {
                display: flex;
                justify-content: space-between;
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

            .table {
                margin-top: 18px;
                font-size: 14px;
            }

            .table-product-heading {
                height: 50px;
                line-height: 50px
            }

            .product-cart-sale-percent {
                max-width: 40px;
            }

            .product-cart-price, .product-cart-import-price {
                font-weight: bold;
                min-width: 100px;
            }

            .product-cart-price, .total-price {
                color: var(--main-btn-color);
            }

            .product-cart-category-id {
                min-width: 60px;
            }

            .justify-content-between {
                display: flex;
                justify-content: space-between;
            }

            .total-label,
            .total-price,
            .total-import-price {
                margin-top: 12px;
                font-weight: bold;
                padding: 24px;

            }

            .form-add-btn {
                color: white;
                font-size: 16px;
                text-decoration: none;
            }
            .form-add-btn:hover {
                color: white;
            }

            .product-cart-id {
                min-width: 60px;
            }

            .product-cart-img img{
                width: 80px;
                height: 80px;
            }
        </style>
    </head>
    <body>
        <!-- Nav and logo -->
        <jsp:include page="Navigation.jsp"></jsp:include>
        <jsp:include page="Logo.jsp"></jsp:include>

            <!-- Nav-home fitter -->
            <nav class="navbar home-filter navbar-expand-lg bg-light">
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
                                <h4 class="nav-heading">Manage Product</h4>
                            </li>
                            <li class="nav-item">
                                <div class="nav-total-product">Product quantity: ${requestScope.listProductSize}</div>
                        </li>
                    </ul>
                    <form class="d-flex" action="searchProduct" method="get">
                        <button class="btn primary-btn" type="button">
                            <i class="fa-sharp fa-solid fa-plus"></i>
                            <a class="form-add-btn" href="AddProduct.jsp">Add new product</a>
                        </button>
                        <input
                            class="form-control me-2 search-input"
                            type="text"
                            name="txtSearchProduct"
                            placeholder="Enter product's title"
                            aria-label="Search"
                            value="${txtSearchProduct}"
                            />
                        <button class="btn btn-search" type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- Category -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="category">
                        <div class="category-btn">
                            <button class="btn btn-dark">
                                <a href="manageProduct">All items</a>
                            </button>
                            <c:forEach items="${requestScope.listCategory}" var="i">
                                <button class="btn btn-dark ${activeByID == i.ID ? "active" :""}">
                                    <a href=categoryAdmin?categoryId=${i.ID}>${i.name}</a>
                                </button>
                            </c:forEach>
                        </div>

                        <div class="category-sort">
                            <span>Sort product by</span>
                            <i class="fa-solid fa-sort"></i>
                            <div class="category-sort-option">
                                <ul>
                                    <h5>
                                        Import Price
                                        <i class="fa-solid fa-caret-up"></i>
                                    </h5>
                                    <li><a href="sortProductAdmin?typeSort=1">Ascending</a></li>
                                    <li><a href="sortProductAdmin?typeSort=2">Descending</a></li>
                                </ul>
                                <ul>
                                    <h5>
                                        Selling Price
                                        <i class="fa-solid fa-caret-down"></i>
                                    </h5>
                                    <li><a href="sortProductAdmin?typeSort=3">Ascending</a></li>
                                    <li><a href="sortProductAdmin?typeSort=4">Descending</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <table class="table  table-bordered align-middle">
                        <thead>
                            <tr class="table-product-heading">
                                <th scope="col">ID</th>
                                <th scope="col">TITLE</th>
                                <th scope="col">IMAGE</th>
                                <th scope="col">DESCRIPTION</th>
                                <th scope="col">QUANTITY</th>
                                <th scope="col">C-ID</th>
                                <th scope="col">SALE</th>
                                <th scope="col">I-PRICE</th>
                                <th scope="col">PRICE</th>
                                <th scope="col">EDIT</th>
                                <th scope="col">DELETE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listProduct}" var="o">
                                <tr>
                                    <td scope="row" class="product-cart-id">${o.ID}</td>
                                    <td class="product-cart-name">${o.title}</td>
                                    <td class="product-cart-img"><img src="./img/${o.ID}.webp" alt=""></td>

                                    <td class="product-cart-decript">${o.decript}</td>
                                    <td class="product-cart-quanlity">${o.quantity}</td>
                                    <td class="product-cart-category-id">${o.categoryID}</td>
                                    <td class="product-cart-sale-percent">${o.salePercent}</td>
                                    <td class="product-cart-import-price">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${o.importPrice}"/>đ
                                    </td>
                                    <td class="product-cart-price">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${o.price}"/>đ
                                    </td>
                                    <td>
                                        <a title="Edit Product" href="editProduct?productID=${o.ID}">
                                            <i class="fa-sharp fa-solid fa-pen"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a title="Delete Product" href="deleteProduct?productID=${o.ID}">
                                            <i
                                                class="fa fa-trash product-cart-delete"
                                                aria-hidden="true"
                                                ></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-sm-2">
                    <div class="btn-group">
                        <button class="btn primary-btn" type="submit"><a class="primary-btn" href="home">Back to home</a></button>
                    </div>
                </div>
                <div class="col-sm-4">
                    <table class="table table-bordered align-middle">
                        <tbody>
                            <tr>
                                <td class="total-label">Total</td>
                                <td class="total-import-price">
                                    <fmt:formatNumber type="number" pattern="###,###" value="${requestScope.totalImportPrice}"/>đ
                                </td>
                                <td class="total-price">
                                    <fmt:formatNumber type="number" pattern="###,###" value="${requestScope.totalPrice}"/>đ
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Footer -->    
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="./bootstrap/js/bootstrap.js"></script>
</html>
