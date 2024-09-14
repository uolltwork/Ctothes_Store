<%-- 
    Document   : AddProduct
    Created on : Oct 8, 2022, 8:35:49 PM
    Author     : Le Khanh Bang
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
        <title>Add-Product</title>
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
                padding: 30px 42px;
            }

            .form-heading-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 6px;
                margin-bottom: 12px;
            }

            .form-heading {
                color:rgb(32, 105, 194);
                font-weight: bold;
            }

            .form-group {
                display: flex;
                justify-content: space-between;
            }

            .form-heading-group i {
                font-size: 24px;
                color: rgb(32, 105, 194);

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

            /*            .form-control-size {
                            margin-left: 4px;   
                        }*/

            .form-category-select {
                width: 100%;
                height: 40px;
                font-size: 16px;
            }

            .form-btn-group {
                margin-top: 0px;
                justify-content: end;
            }

            .form-btn-group button {
                margin-left: 12px;
            }

            .primary-btn {
                background-color: rgb(32, 105, 194);
                border-radius: 0px;
                color: white;
                border: none;
                outline: none;
            }

            .primary-btn:hover {
                background-color:  rgb(83, 137, 204);
                color: white;
                border: none;
                cursor: pointer;
            }

            .main-btn a{
                text-decoration: none;
                font-size: 16px;
                color: white;
            }

            .form-product-id-group {
                display: flex;
                align-items: center;
                color: rgb(32, 105, 194);
            }
            
            .form-product-id-group h5 {
                font-size: 18px;
                margin-right: 4px;
            }
            .form-max-product-id {
                width: 46px;
                height: 28px;
                font-size: 16px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <form action="addProduct" method="get">
                <div class="form-heading-group">
                    <h2 class="form-heading">
                        Add Product </i>
                    </h2>
                    <div class="form-product-id-group">
                        <h5>Product ID:</h5>
                        <input
                        class="form-max-product-id"
                        type="text"
                        name="maxProductID"
                        id="maxProductID"
                        value="${sessionScope.maxProductID}";
                        readonly
                        />
                    </div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Product Title:</h4>
                    <input
                        type="text"
                        name="title"
                        id="title"
                        placeholder="Ex: LITN TEE - BLACK"
                        required
                        />
                    <div class="form-error"></div>
                </div>

<!--                <div class="form-control">
                    <h4 class="form-label">Product Image Link:</h4>
                    <input
                        type="file"
                        name="image"
                        id="image"
                        placeholder="Ex: https://bizweb.dktcdn.net.png"
                        required
                        />
                    <div class="form-error"></div>
                </div>-->

                <div class="form-group">
                    <div class="form-control">
                        <h4 class="form-label">Import Price:</h4>
                        <input
                            type="number"
                            name="import-price"
                            id="import-price"
                            placeholder="Ex: 500.000đ"
                            required
                            />
                        <div class="form-error"></div>
                    </div>

                    <div class="form-control">
                        <h4 class="form-label">Sell Price:</h4>
                        <input
                            type="number"
                            name="price"
                            id="price"
                            placeholder="Ex: 700.000đ"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                </div>

                <div class="form-control">
                    <div class="form-control">
                        <h4 class="form-label">Sell Percent:</h4>
                        <input
                            type="number"
                            name="sale-percent"
                            id="sale-percent"
                            placeholder="Ex: 50"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                    <div class="form-control">
                        <h4 class="form-label">Product Description:</h4>
                        <input
                            type="text"
                            name="product-descript"
                            id="product-descript"
                            placeholder="Ex: Nowsaigon/madin Viet Nam/"
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                </div>

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
                            required
                            />
                        <div class="form-error"></div>
                    </div>
                </div>

                <!--<div class="form-group">-->
<!--                    <div class="form-control">
                        <h4 class="form-label">Quantity:</h4>
                        <input
                            type="number"
                            name="quantity"
                            id="quantity"
                            placeholder="Ex: 20"
                            value=""
                            readonly=""
                            />
                        <div class="form-error"></div>
                    </div>-->

                    <div class="form-control">
                        <h4 class="form-label">Category:</h4>
                        <select class="form-category-select" name="categoryID" id="categoryID">
                            <option value="1">Tee</option>                          
                            <option value="2">Sweeter</option>
                            <option value="3">Hoddies</option>
                            <option value="4">Jacket</option>
                            <option value="5">Pant</option>
                            <option value="6">Others</option>
                        </select>
                        <div class="form-error"></div>
                    </div>
                <!--</div>-->

                <div class="form-group">
                    <div class="form-error activeError">${requestScope.productExistMessage}</div>
                </div>

                <div class="form-group form-btn-group">
                    <button class="main-btn " type="button"><a href="manageProduct">Cancel</a></button>
                    <button class="main-btn primary-btn" type="submit">Add product</button>
                </div>
            </form>
        </div>
    </body>
</html>
