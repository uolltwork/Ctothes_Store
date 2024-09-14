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
                    <div class="col-xs-12 col-md-8">
                        <div class="product-cart">
                            <div class="form-heading-group">
                                <h4 class="form-heading">TẤT CẢ ĐƠN HÀNG (${listOrderOfCustomerSize} đơn hàng)</h4>
                        </div>
                        <table class="table table-bordered align-middle table-product">
                            <thead>
                                <tr>
                                    <th scope="col" class="table-product-header">Mã đơn</th>
                                    <th scope="col" class="table-product-header">Ngày đặt</th>
                                    <th scope="col" class="table-product-header">Sản phẩm</th>
                                    <th scope="col" class="table-product-header">Tình trạng</th>
                                    <th scope="col" class="table-product-header">Đơn giá</th>
                                    <th scope="col" class="table-product-header">Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listOrderOfCustomer}" var="o">
                                    <tr>
                                        <td class="product-paying-order">${o.id}</td>
                                        <td class="product-paying-date">${o.date}</td>
                                        <td class="product-paying-date">${o.numberProduct}</td>
                                        <td class="product-paying-status">${o.status}</td>
                                        <td class="product-paying-price">
                                            <fmt:formatNumber type="number" pattern="###,###" value="${o.totalPrice}" />đ
                                        </td>
                                        <td class="product-paying-detail"><a href="loadOrderDetail?oID=${o.id}">Xem chi tiết</a></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${listOrderOfCustomerSize == 0}">
                                    <tr>
                                        <td colspan="8" class="no-order-message">Bạn chưa có đơn hàng nào. Cùng đặt hàng thôi nào!!!</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <p class="cus-info-note"><strong>Note:</strong>Tất cả đơn hàng sẽ được xử lí và giao đến quí khách
                            trong 3-7 ngày. Nếu quí
                            khách cần hỗ trợ tư vấn hay chính sách đổi trả vui lòng liên hệ <Strong>Hotline:
                                0933.782.768.</Strong> Cảm ơn
                            quí khách đã đặt hàng tại Nowsaigon!</p>

                        <button class="btn primary-btn">
                            <a href="home">Trở về trang chủ</a>
                        </button>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="cus-info">
                        <div class="cus-heading-group">
                            <h5 class="cus-heading">TÀI KHOẢN CỦA TÔI</h5>
                            <a href="index.html">
                                <img src="https://bizweb.dktcdn.net/100/318/614/themes/667160/assets/checkout_logo.png?1655706741253"
                                     alt="logo" />
                            </a>
                        </div>

                        <div class="cus-info-group">
                            <span><i class="fa-solid fa-file-signature"></i></span>
                            <span class="cus-info-label">Họ tên:</span>
                            <input type="text" value="${customerInfo.name}" readonly>
                        </div>

                        <div class="cus-info-group">
                            <span><i class="fa-solid fa-phone"></i></span>
                            <span class="cus-info-label">Điện thoại:</span>
                            <input type="text" value="${customerInfo.phone}" readonly>
                        </div>
                        <div class="cus-info-group">
                            <span><i class="fa-solid fa-envelope"></i></span>
                            <span class="cus-info-label">Email:</span>
                            <input type="text" value="${customerInfo.email}" readonly>
                        </div>
                        <div class="cus-info-group">
                            <span><i class="fa-solid fa-location-dot"></i></span>
                            <span class="cus-info-label">Địa chỉ:</span>
                            <input type="text" value="${customerInfo.address}" readonly>
                        </div>
                        <div class="cus-info-group">
                            <span><i class="fa-solid fa-key"></i></span>
                            <span class="cus-info-label">Mật khẩu:</span>
                            <input type="password" value="${accountSeesion.password}" readonly>
                        </div>

                        <div class="cus-info-group cus-info-btn-group">
                            <button type="button" class="btn main-btn">
                                <a href="updateCustomerInfo?accountID=${accountSeesion.ID}">Chỉnh sửa thông tin</a>
                            </button>
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
