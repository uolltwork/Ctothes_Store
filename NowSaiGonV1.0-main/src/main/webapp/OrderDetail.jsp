<%-- 
    Document   : CustomerInfo
    Created on : Oct 24, 2022, 8:28:01 PM
    Author     : PC
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css"/>
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <link rel="stylesheet" href="./assert/css/style.css" />
        <style>

            .cus-info-wrapper {
                margin-top: 56px;
                margin-bottom: 56px;
            }

            .product-paying-img img {
                width: 56px;
                height: 56px;
            }

            .cus-info {
                width: 100%;
                border: 1px solid rgb(165, 161, 161);
                box-shadow: 10px 10px rgb(222, 221, 221);
                padding: 24px;
                border-radius: 3px;
            }

            .cus-info a img {
                width: 80px;
                height: 36px;
            }

            .cus-heading {
                color: #666;
                min-width: 120px;
            }

            .cus-heading-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 32px;
            }

            .cus-info-group {
                display: flex;
                align-items: center;
                margin-bottom: 14px;
            }

            .cus-info-group input {
                flex: 1;
                height: 36px;
                font-weight: 500;
                padding-left: 8px;
            }

            .cus-info-label {
                min-width: 90px;
                margin-left: 10px;
                font-weight: 500;
                color: #666;
            }

            .cus-info-group span i {
                font-size: 13px;
                color: var(--main-btn-color);
                min-width: 16px;
            }

            .cus-info-btn-group {
                margin: 36px 0 0 0;
            }

            .cus-info-group button {
                padding: 10px 16px;
                width: 100%;
            }

            .cus-info-group button a {
                color: white;
                text-decoration: none;
                font-weight: 500;
            }

            /* Orders table */
            .align-middle {
                text-align: center;
            }

            .table-product-header {
                color: #444;
            }

            .form-heading {
                margin-bottom: 12px;
            }

            .table-product thead {
                background-color: rgb(182, 183, 185);
                font-size: 16px;
            }

            .product-paying-price {
                font-weight: bold;
            }

            .cus-info-note {
                margin-top: 24px;
            }

            .form-heading {
                margin-bottom: 24px;
            }

            .primary-btn {
                padding: 10px 24px;
                border-radius: 0px;
                border: none;
                outline: none;
                background-color: var(--primary-btn-color);
                margin-top: 24px;
            }

            .primary-btn:hover {
                background-color: var(--primary-btn-hover-color);
            }

            .primary-btn a {
                text-decoration: none;
                color: white;
                font-weight: bold;
            }

            .product-paying-date {
                min-width: 120px;
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

            .no-order-message {
                color: #666;
                font-size: 16px;
            }

            .product-paying-title a{
                text-decoration: none;
                font-weight: 500;
                color: #444;
            }
            
            .product-paying-img {
                width: 48px;
                height: 48px;
            }
        </style>
        <title>Document</title>
    </head>

    <body>

        <!-- 1. Navigation -->
        <jsp:include page="Navigation.jsp"></jsp:include>
        <jsp:include page="Logo.jsp"></jsp:include>
        <jsp:include page="HomeFiltter.jsp"></jsp:include>

            <div class="container cus-info-wrapper">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="product-cart">
                            <div class="form-heading-group">
                                <h4 class="form-heading">CHI TIẾT ĐƠN HÀNG (Mã đơn: ${orderID})</h4>
                        </div>
                        <table class="table table-bordered align-middle table-product">
                            <thead>
                                <tr>
                                    <th scope="col" class="table-product-header">Ngày đặt</th>
                                    <th scope="col" class="table-product-header">Tên khách hàng</th>
                                    <th scope="col" class="table-product-header">Điện thoại</th>
                                    <th scope="col" class="table-product-header">Địa chỉ</th>
                                    <th scope="col" class="table-product-header">Tên</th>
                                    <th scope="col" class="table-product-header">Ảnh</th>
                                    <th scope="col" class="table-product-header">Size</th>
                                    <th scope="col" class="table-product-header">Số lượng</th>
                                    <th scope="col" class="table-product-header">Tình trạng</th>
                                    <th scope="col" class="table-product-header">Note</th>
                                    <th scope="col" class="table-product-header">Đơn giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listOrderOfCustomer}" var="o">
                                    <tr>
                                        <td class="product-paying-date">${o.date}</td>
                                        <td class="product-paying-date">${customer.name}</td>
                                        <td class="product-paying-status">${customer.phone}</td>                                                                               
                                        <td class="product-paying-status">${customer.address}</td>
                                        <td class="product-paying-status">${o.title}</td> 
                                        <td class="product-paying-status">
                                            <img
                                                class="product-paying-img"
                                                src="img/${o.product_id}.webp"
                                                alt=""
                                                /></td>
                                        <td class="product-paying-status">${o.size}</td>                                    
                                        <td class="product-paying-status">${o.quantity}</td> 
                                        <td class="product-paying-status">${o.status}</td> 
                                        <td class="product-paying-status">${o.note}</td> 
                                        <td class="product-paying-price">
                                            <fmt:formatNumber type="number" pattern="###,###" value="${o.price}" />đ
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${listOrderOfCustomerSize == 0}">
                                    <tr>
                                        <td colspan="8" class="no-order-message">Bạn chưa có đơn hàng nào. Cùng đặt hàng thôi nào!!!</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <button class="btn primary-btn">
                            <a href="loadCustomerInfo">Trở về đơn hàng</a>
                        </button>
                        <div class="row justify-content-end">
                            <div class="col-md-4">
                                <table class="table table-bordered align-middle">
                                    <tbody>
                                        <tr>
                                            <td class="product-cart-price-label">TẠM TÍNH</td>
                                            <td>
                                                <fmt:formatNumber type="number" pattern="###,###" value="${totalPrice}" />đ
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="product-cart-price-label">PHÍ VẬN CHUYỂN</td>
                                            <td>
                                                +<fmt:formatNumber type="number" pattern="###,###" value="30000" />đ
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="product-cart-price-label">TỔNG TIỀN</td>
                                            <td class="product-cart-price-total">
                                                <fmt:formatNumber type="number" pattern="###,###" value="${totalPrice + 30000}" />đ
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->    
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</body>
</html>
