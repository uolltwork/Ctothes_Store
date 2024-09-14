<%-- 
    Document   : Paying
    Created on : Sep 23, 2022, 10:44:17 PM
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
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css" />
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <link rel="stylesheet" href="./assert/css/style.css" />
        <link rel="stylesheet" href="./assert/css/cart.css" />
        <title>Paying</title>
        <style>
            *{
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

            .cart-heading {
                font-size: 18px;
                color: #666;
                margin-bottom: 24px;
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

            .continue-btn {
                margin-top: 0px;
                background-color: rgb(0, 115, 255);
            }

            .continue-btn:hover {
                background-color: rgb(32, 105, 194);
            }

            .continue-btn a {
                text-decoration: none;
                color: white;
            }

            .product-cart-add {
                width: 17px;
                height: 17px;
            }

            .justify-content-space-between {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <!-- 1. Navigation -->
        <jsp:include page="Navigation.jsp"></jsp:include>
        <jsp:include page="Logo.jsp"></jsp:include>
        <jsp:include page="HomeFiltter.jsp"></jsp:include>

            <!-- Paying -->
            <div class="container">
                <form action="orderLoad" method="get">
                    <div class="paying">
                        <div class="row disable">
                            <div class="col-md-12">
                                <div class="customer-info">
                                    <div class="customer-info-img-group">
                                        <img src="./assert/img/letter.png" alt="" />
                                        <img src="./assert/img/letter.png" alt="" />
                                    </div>
                                    <h4 class="customer-info-heading">Thông tin khách hàng</h4>
                                    <div class="customer-info-group">
                                        <span class="customer-info-group-label">Tên: </span>
                                        <span>${customer.name}</span>
                                </div>
                                <div class="customer-info-group">
                                    <span class="customer-info-group-label">Điện thoại: </span>
                                    <span>${sessionScope.accountSeesion.phone}</span>
                                </div>
                                <div class="customer-info-group">
                                    <span class="customer-info-group-label">Email: </span>
                                    <span>${customer.email}</span>
                                </div>
                                <div class="customer-info-group">
                                    <span class="customer-info-group-label">Địa chỉ: </span>
                                    <span>${customer.address}</span>
                                </div>
                                <div class="customer-info-group">
                                    <span class="customer-info-group-label"
                                          >Phương thức thanh toán:
                                    </span>
                                    <span>SHIP CODE(Kiểm tra hàng khi nhận)</span>
                                </div>
                                <div class="customer-info-group">
                                    <span class="customer-info-group-label"
                                          >Đơn vị vận chuyển:
                                    </span>
                                    <span>GHTK (Giao hàng tiết kiệm)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h5 class="cart-heading">GIỎ HÀNG CỦA BẠN</h5>
                            <c:if test="${sessionScope.listCartSize == 0}">
                                <div class="row mb-3 padding ">
                                    <div class="col-xs-12 no-found-product-group">
                                        <img src="./img/no_product_found.png" alt="alt"/>
                                        <h5 class="no-found-product">Bạn chưa có sản phẩm trong giỏ hàng!!!</h5>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.listCartSize != 0}">
                                <div class="product-cart">
                                    <table class="table table-bordered align-middle">
                                        <thead>
                                            <tr>
                                                <th scope="col">ADD</th>
                                                <!--<th scope="col">ID</th>-->
                                                <th scope="col">ẢNH SẢN PHẨM</th>
                                                <th scope="col">TÊN SẢN PHẨM</th>
                                                <th scope="col">SIZE</th>
                                                <th scope="col">GIÁ</th>
                                                <th scope="col">SỐ LƯỢNG</th>
                                                <th scope="col">THÀNH TIỀN</th>
                                                <th scope="col">XÓA</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listCart}" var="c">
                                                <tr>
                                                    <td scope="row"><input class="product-cart-add" name="isPayed" type="checkbox" value="${c.productID},${c.cusID},${c.size}"></td>
                                                    <td scope="row" class="disable">${c.productID}</td>
                                                    <td>
                                                        <img
                                                            class="product-cart-img"
                                                            src="img/${c.productID}.webp"
                                                            alt=""
                                                            />
                                                    </td>
                                                    <td class="product-cart-name">${c.productTitle}</td>
                                                    <td class="product-cart-price">
                                                        ${c.size}
                                                    </td>
                                                    <td class="product-cart-total">
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${c.productPrice}" />đ
                                                    </td>
                                                    <td class="product-cart-quality">${c.quantity}</td>

                                                    <td class="product-cart-total">
                                                        <fmt:formatNumber type="number" pattern="###,###" value="${c.productPrice * c.quantity}" />đ
                                                    </td>
                                                    <td>
                                                        <a title="Delete Product" href="deleteCart?productID=${c.productID}&customerID=${c.cusID}&quantity=${c.quantity}&size=${c.size}&accountID=${sessionScope.accountSeesion.ID}"><i class="fa fa-trash product-cart-delete" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <c:if test="${sessionScope.listCartSize != 0}">
                        <div class="row justify-content-end">
                            <div class="col-md-4">
                                <table class="table table-bordered align-middle">
                                    <tbody>
                                        <tr>
                                            <td class="product-cart-price-label">TẠM TÍNH</td>
                                            <td>
                                                <fmt:formatNumber type="number" pattern="###,###" value="${sumOfProductCart}" />đ
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="product-cart-price-label">THUẾ VAT</td>
                                            <td>-0đ</td>
                                        </tr>
                                        <tr>
                                            <td class="product-cart-price-label">TỔNG TIỀN</td>
                                            <td class="product-cart-price-total">
                                                <fmt:formatNumber type="number" pattern="###,###" value="${sumOfProductCart}" />đ
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row justify-content-space-between">
                            <div class="col-md-2">
                                <button type="button" class="btn primary-btn continue-btn">
                                    <a href="home">TIẾP TỤC MUA HÀNG</a>
                                </button>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn main-btn">TIẾN HÀNH THANH TOÁN</button>
                            </div>
                        </div>
                    </c:if>
                </div>
            </form>
        </div>

        <!-- Footer -->    
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
