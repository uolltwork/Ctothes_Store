<%-- 
    Document   : Register
    Created on : Sep 23, 2022, 10:44:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./assert/css/loginRegister.css" />
        <title>Register</title>
    </head>
    <body>
        <div class="container">
            <form action="register" method="get" onsubmit="return checkRegister();">
                <h2 class="form-heading">Đăng kí tài khoản</h2>
                <p class="form-decrit">
                    Đăng kí tài khoản Nowsaigon để thanh toán.
                </p>
                <div class="form-control">
                    <h4 class="form-label">Họ tên:</h4>
                    <input
                        type="text"
                        name="fullName"
                        id="fullName"
                        placeholder="VD: Trần Đăng Khoa"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Điện thoại:</h4>
                    <input
                        type="text"
                        name="phone"
                        id="phone"
                        placeholder="VD: 0123456789"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Email:</h4>
                    <input
                        type="email"
                        name="email"
                        id="email"
                        placeholder="VD: khoatdce160367@fpt.edu.vn"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Password:</h4>
                    <input
                        type="password"
                        name="password"
                        id="password"
                        placeholder="VD: Abcdef123"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Địa chỉ:</h4>
                    <input
                        type="text"
                        name="address"
                        id="address"
                        placeholder="VD: Vàm hồ, an thạnh nam, cù lao dung, sóc trăng"
                        required
                        />
                    <div class="form-error"></div>
                </div>
                
                 <div class="form-control">
                    <div class="form-error activeError">${accountExitMessage}</div>
                </div>

                <p class="form-decrit">
                    Nếu bạn đã có tài khoản hãy đăng nhập
                    <a href="Login.jsp" class="form-link">tại đây</a>
                </p>
                <button class="main-btn" type="submit">ĐĂNG KÍ</button>
            </form>
        </div>
    </body>

    <script>
        // Primary variables
        var fullName = document.querySelector("#fullName");
        var phone = document.querySelector("#phone");
        var email = document.querySelector("#email");
        var password = document.querySelector("#password");
        var address = document.querySelector("#address");
        var form = document.querySelector("form");

        function showError(inputID, errorMessage) {
            let parent = inputID.parentElement;
            let formError = parent.querySelector(".form-error");
            let formInput = parent.querySelector("input");
            formError.classList.add("activeError"); // add class "activeError" into formError.
            formInput.classList.add("activeErrorOnInput"); // add class "activeError" into formError.
            formError.innerText = errorMessage; // set message into formError.
        }

        function showSuccess(inputID) {
            let parent = inputID.parentElement;
            let formError = parent.querySelector(".form-error");
            let formInput = parent.querySelector("input");
            formError.classList.remove("activeError"); // add class "activeError" into formError.
            formInput.classList.remove("activeErrorOnInput"); // add class "activeError" into formError.
            formError.innerText = ""; // set message into formError.
        }

        // // 1. Check empty
        // function checkEmptyError(listInput) {
        //   let isEmptyError = false;
        //   listInput.forEach((input) => {
        //     input.value = input.value.trim();
        //     if (input.value == "") {
        //       showError(input, "Vui lòng nhập trường này!!!");
        //       isEmptyError = true;
        //     } else {
        //       showSuccess(input);
        //     }
        //   });
        //   return isEmptyError;
        // }

        // 2. Check Email;
        function checkEmailValid(input) {
            const regexEmail = /^\w+([\.-_]\w+)*@\w+([\.-_]\w+)*(\.\w{2,3})+$/;
            input.value = input.value.trim();
            var isEmailValid = regexEmail.test(input.value);
            if (!isEmailValid) {
                showError(input, "Email không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isEmailValid;
        }

        // 3. Check name valid
        function checkNameValid(input) {
            const regexName =
                    /^[a-zA-Z][a-zA-Z0-9 _ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/;
            input.value = input.value.trim();
            var isNameValid = regexName.test(input.value);

            if (!isNameValid) {
                showError(input, "Tên không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isNameValid;
        }

        // 2. Check Email;
        function checkPhoneValid(input) {
            const regexPhone = /^0[1-9]\d{8,9}$/;
            input.value = input.value.trim();
            var isPhoneValid = regexPhone.test(input.value);
            if (!isPhoneValid) {
                showError(input, "Số điện thoại không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isPhoneValid;
        }

        // 2. Check Password;
        function checkPasswordValid(input) {
            const regexPassword =
                    /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
            input.value = input.value.trim();
            var isPasswordValid = regexPassword.test(input.value);
            if (!isPasswordValid) {
                showError(input, "Mật khẩu không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isPasswordValid;
        }

        // 2. Check Address;
        function checkAddressValid(input) {
            const regexAddress = /^([a-zA-Z0-9 _/]+[,][a-zA-Z0-9 _/]*){2,4}$/;
            input.value = input.value.trim();
            var isAddressValid = regexAddress.test(input.value);
            if (!isAddressValid) {
                showError(input, "Địa chỉ không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isAddressValid;
        }

        // 3. Check all in form
        function checkRegister() {
            let isNameValid = checkNameValid(fullName);
            let isEmailValid = checkEmailValid(email);
            let isPhoneValid = checkPhoneValid(phone);
            let isPasswordValid = checkPasswordValid(password);
            let isAddressValid = checkAddressValid(address);
            
            if(isNameValid && isEmailValid && isPhoneValid && isPasswordValid && isAddressValid) {
                return true;
            }
            return false;
        }
    </script>
</html>
