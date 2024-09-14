<%-- 
    Document   : ProductDetail
    Created on : Sep 23, 2022, 10:44:01 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css"/>
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <link rel="stylesheet" href="./assert/css/style.css" />       
        <link rel="stylesheet" href="./assert/css/productDetail.css" />
        <title>Product-Detail</title>
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

            .size-btn-group {
                position: relative;
            }

            .sold-out-size {
                position: absolute;
                width: 38px;
                height: 2px;
                background-color: black;
                top: 12px;
                left: -3px;
                display: none;
            }

            .active-sold-out-size {
                display: block;
            }

            .btn-sold-out {
                background-color: #444;
            }
        </style>
    </head>
    <body>
        <!-- 1. Navigation -->
        <jsp:include page="Navigation.jsp"></jsp:include>
        <jsp:include page="Logo.jsp"></jsp:include>
        <jsp:include page="HomeFiltter.jsp"></jsp:include>

            <!-- 2. Product Detail -->
            <div class="container">
                <form action="cartHandler" method="get">
                    <div class="product-detail">
                        <div class="row">
                            <div class="col-xs-12 col-md-5">
                                <img class="product-img" src="img/${productDetail.ID}.webp" alt="" />
                        </div>
                        <div class="col-xs-12 col-md-7">
                            <ul class="product-detail-container">
                                <li class="product-detail-item">
                                    <h3 class="product-detail-title">${productDetail.title}</h3>
                                </li>
                                <li class="product-detail-item">
                                    <p class="product-detail-brand">
                                        <span class="product-detail-label">Thương hiệu:</span>
                                        <span class="product-detail-brand-name"
                                              >NEEDS OF WISDOM®</span
                                        >
                                    </p>
                                </li>
                                <li class="product-detail-item">
                                    <span class="product-detail-price">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${productDetail.price - (productDetail.price * productDetail.salePercent /100)}" />đ
                                    </span>
                                    <span class="product-detail-sale ${productDetail.salePercent == 0 ? "disable" :""}">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${productDetail.price}" />đ
                                    </span>
                                </li>
                                <li class="product-detail-item">
                                    <div class="product-detail-size">
                                        <span class="product-detail-label">Kích thướt:</span>
                                        <div class="size-btn-group">
                                            <input
                                                id="swatch-0-S"
                                                type="radio"
                                                name="option"
                                                value="S"
                                                checked=""
                                                class="available "
                                                ${productDetail.sizeS <= 0 ? "disabled" :""}
                                                />
                                            <label for="swatch-0-S">S</label>
                                            <div class="sold-out-size ${productDetail.sizeS <= 0 ? "active-sold-out-size" :""}"></div>
                                        </div>
                                        <div class="size-btn-group">
                                            <input
                                                id="swatch-0-M"
                                                type="radio"
                                                name="option"
                                                value="M"
                                                checked=""
                                                class="available"
                                                ${productDetail.sizeM <= 0 ? "disabled" :""}
                                                />
                                            <label for="swatch-0-M">M</label>
                                            <div class="sold-out-size ${productDetail.sizeM <= 0 ? "active-sold-out-size" :""}"></div>
                                        </div>
                                        <div class="size-btn-group">
                                            <input
                                                id="swatch-0-S"
                                                type="radio"
                                                name="option"
                                                value="L"
                                                checked=""
                                                class="available"
                                                ${productDetail.sizeL <= 0 ? "disabled" :""}
                                                />
                                            <label for="swatch-0-L">L</label>
                                            <div class="sold-out-size ${productDetail.sizeL <= 0 ? "active-sold-out-size" :""}"></div>
                                        </div>
                                        <div class="size-btn-group">
                                            <input
                                                id="swatch-0-XL"
                                                type="radio"
                                                name="option"
                                                value="XL"
                                                checked=""
                                                class="available"
                                                ${productDetail.sizeXL <= 0 ? "disabled" :""}
                                                />
                                            <label for="swatch-0-XL">XL</label>
                                            <div class="sold-out-size ${productDetail.sizeXL <= 0 ? "active-sold-out-size" :""}"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="product-detail-item">
                                    <span class="product-detail-label">Mô tả:</span>
                                    <span>
                                        ${productDetail.decript}
                                    </span
                                    >
                                </li>
                                <li class="product-detail-item">
                                    <div class="product-detail-quality">
                                        <span class="product-detail-label">Số lượng:</span>
                                        <input type="number" name="product-quantity" id="" min="1" max="10" required/>
                                    </div>
                                </li>
                                <input class="disable" type="number" value="${productDetail.ID}" name="productID" id=""/>
                                <input class="disable" type="number" value="${sessionScope.accountSeesion.ID}" name="accountID" id=""/>
                                <li class="product-detail-item">
                                    <c:if test="${sessionScope.accountSeesion == null}">
                                        <button type="button" class="btn btn-add-cart">
                                            <a href="Register.jsp">Thêm vào giỏ hàng</a>
                                        </button>
                                    </c:if>
                                    <c:if test="${sessionScope.accountSeesion != null}">
                                        <c:if test="${sessionScope.accountSeesion.ID != 1}">
                                            <button type="submit" class="btn btn-add-cart">
                                                Thêm vào giỏ hàng
                                            </button>
                                        </c:if>
                                    </c:if>
                                    <button class="btn btn-continue" type="button">
                                        <a href="home">Tiếp tục mua hàng</a>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>

            <div class="container product-detail-decript">
                <h4 class="product-detail-heading">Bảng size chi tiết</h4>
                <div class="row">
                    <div class="col-md-4">
                        <img class="tee-size" src="./assert/img/teeSize.png" alt="" />
                    </div>
                    <div class="col-md-4">
                        <img class="tee-size" src="./assert/img/shirt.png" alt="" />
                    </div>
                    <div class="col-md-4">
                        <img class="tee-size" src="./assert/img/sweaterSize.png" alt="" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <img class="tee-size" src="./assert/img/jacketSize.png" alt="" />
                    </div>
                    <div class="col-md-4">
                        <img class="tee-size" src="./assert/img/hoodieSize.png" alt="" />
                    </div>
                    <div class="col-md-4">
                        <img class="tee-size" src="./assert/img/pantSize.png" alt="" />
                    </div>
                </div>
            </div>
        </div>

        <--<!-- Footer -->    
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

