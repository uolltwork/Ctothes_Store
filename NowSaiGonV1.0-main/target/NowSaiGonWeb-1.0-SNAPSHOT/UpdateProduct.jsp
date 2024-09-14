<%-- 
    Document   : UpdateProduct
    Created on : Oct 8, 2022, 8:51:15 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <title>Update-Product</title>
        <style>
            :root {
                --success-color: #2691d9;
                --error-color: #e74c3c;
            }

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                height: 100vh;
                background-color: #999;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                width: 480px;
                border-radius: 0;
                border: none;
                background-color: white;
                padding: 18px 42px;
            }

            .form-heading-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 12px;
                margin-bottom: 20px;
            }

            .form-group {
                display: flex;
                justify-content: space-between;
            }

            .form-heading {
                color:rgb(32, 105, 194);
                font-weight: bold;
                font-size: 26px;
            }

            .form-heading-group i {
                font-size: 24px;
                color: #2691d9;
            }

            .form-control {
                margin-bottom: 15px;
            }

            .form-label {
                margin-bottom: 4px;
                color: #666;
                font-size: 18px;
            }

            .form-control input {
                width: 100%;
                height: 40px;
                font-size: 16px;
                padding: 0 12px;
            }

            .form-control input:focus {
                border: 2px solid #2691d9;
            }

            .form-error {
                font-size: 18px;
                margin-top: 4px;
                color: #e74c3c;
                display: none;
            }

            .form-decrit {
                font-size: 19px;
                margin-bottom: 12px;
            }

            .main-btn {
                width: 120px;
                height: 46px;
                font-size: 14px;
                background-color: #ed1c24;
                color: white;
                border: none;
                outline: none;
                font-weight: 580;
            }

            .main-btn:hover {
                cursor: pointer;
                background-color: rgb(0, 115, 255);
            }

            .activeError {
                display: block;
            }

            .activeErrorOnInput {
                border: 1px solid #e74c3c;
            }

            .form-group .form-control {
                width: 48%;
            }

            .form-category-select {
                width: 100%;
                height: 40px;
                font-size: 16px;
            }

            .form-btn-group {
                margin-top: 16px;
                justify-content: end;
            }

            .form-btn-group button {
                margin-left: 12px;
            }

            .primary-btn {
                background-color: rgb(0, 115, 255);
                border-radius: 0px;
                color: white;
                border: none;
                outline: none;
            }

            .primary-btn:hover {
                background-color:  rgb(32, 105, 194);
                color: white;
                border: none;
                cursor: pointer;
            }

            .main-btn a{
                text-decoration: none;
                font-size: 16px;
                color: white;
            }

            .product-id-group {
                display: flex;
            }

            .product-id-group h4 {
                margin: 6px 4px 0 0;
            }
            .input-product-id {
                max-width: 40px;
                font-size: 16px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <form action="updateProduct" method="get">
                <div class="form-heading-group">
                    <h2 class="form-heading">
                        Update Product </i>
                    </h2>
                    <div class="product-id-group">
                        <h4 class="form-label">Product ID:</h4>
                        <input type="text" name="id" value="${productDetail.ID}" class="input-product-id" readonly>
                    </div>
                </div>
                <div class="form-control">
                    <h4 class="form-label">Product Title:</h4>
                    <input
                        type="text"
                        name="title"
                        id="title"
                        value="${productDetail.title}"
                        placeholder="Ex: LITN TEE - BLACK"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <!--                <div class="form-control">
                                    <h4 class="form-label">Product Image Link:</h4>
                                    <input
                                        type="text"
                                        name="image"
                                        id="image"
                                        value=""
                                        placeholder="Ex: https://bizweb.dktcdn.net.png"
                                        required
                                        />
                                    <div class="form-error"></div>
                                </div>-->


                <div class="form-group">
                    <div class="form-control">
                        <h4 class="form-label">Product Import Price:</h4>
                        <input
                            type="number"
                            name="import-price"
                            id="import-price"
                            value="${productDetail.importPrice}"
                            placeholder="Ex: 500.000đ"
                            required
                            />
                        <div class="form-error"></div>
                    </div>

                    <div class="form-control">
                        <h4 class="form-label">Product Sell Price:</h4>
                        <input
                            type="number"
                            name="price"
                            id="price"
                            value="${productDetail.price}"
                            placeholder="Ex: 700.000đ"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Sell Percent:</h4>
                    <input
                        type="number"
                        name="sale-percent"
                        id="sale-percent"
                        value="${productDetail.salePercent}"
                        placeholder="Ex: 50"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Product Description</h4>
                    <input
                        type="text"
                        name="descript"
                        id="descript"
                        value="${productDetail.decript}"
                        placeholder="Ex: NEEDS OF WISDOM®"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <!--<div class="form-group">-->
                <!--                    <div class="form-control">
                                        <h4 class="form-label">Quantity:</h4>
                                        <input
                                            type="number"
                                            name="quantity"
                                            id="quantity"
                                            value=""
                                            placeholder="Ex: 20"
                                            required
                                            />
                                        <div class="form-error"></div>
                                    </div>-->
                <div class="form-group">
                    <div class="form-control">
                        <h4 class="form-label">Size S:</h4>
                        <input
                            type="number"
                            name="size-s"
                            id="size-s"
                            placeholder="Ex: 20"
                            min="0"
                            max="20"
                            value="${productDetail.sizeS}"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                    <div class="form-control">
                        <h4 class="form-label">Size M:</h4>
                        <input
                            type="number"
                            name="size-m"
                            id="size-m"
                            placeholder="Ex: 20"
                            min="0"
                            max="20"
                            value="${productDetail.sizeM}"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                    <div class="form-control">
                        <h4 class="form-label">Size L:</h4>
                        <input
                            type="number"
                            name="size-l"
                            id="size-l"
                            placeholder="Ex: 20"
                            min="0"
                            max="20"
                            value="${productDetail.sizeL}"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                    <div class="form-control">
                        <h4 class="form-label">Size XL:</h4>
                        <input
                            type="number"
                            name="size-xl"
                            id="size-xl"
                            placeholder="Ex: 20"
                            min="0"
                            max="20"
                            value="${productDetail.sizeXL}"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Category:</h4>
                    <select class="form-category-select" id="categoryID" name="categoryID">
                        <c:forEach items="${requestScope.listCategory}" var="c">
                            <option value="${c.ID}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <div class="form-error"></div>
                </div>
                <!--</div>-->

                <div class="form-group form-btn-group">
                    <button class="main-btn " type="submit"><a href="manageProduct">Cancel</a></button>
                    <button class="main-btn primary-btn" type="submit">Update product</button>
                </div>
            </form>
        </div>
    </body>
</html>

