<%-- 
    Document   : Login
    Created on : Sep 23, 2022, 10:44:44 PM
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
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <form action="login" method="GET" onsubmit="return validationForm()">
                <h2 class="form-heading">Đăng nhập tài khoản</h2>

                <div class="form-control">
                    <h4 class="form-label">Điện thoại:</h4>
                    <input
                        type="text"
                        name="phone"
                        id="phone"
                        value="${oldPhone}"
                        placeholder="VD: 0123456789"
                        required
                        />
                    <div class="form-error"></div>
                </div>

                <div class="form-control">
                    <h4 class="form-label">Mật khẩu:</h4>
                    <input
                        type="password"
                        name="password"
                        id="password"
                        value="${oldPassword}"
                        placeholder="VD: Abcdef123"
                        required
                        />
                    <div class="form-error"></div>
                </div>
                        
                        
                <div class="form-control">
                    <div class="form-error activeError">${loginFailMessage}</div>
                </div>
                
                <p class="form-decrit">
                    Nếu bạn chưa có tài khoản hãy đăng kí
                    <a href="Register.jsp" class="form-link">tại đây</a>
                </p>
                <button class="main-btn" type="submit">ĐĂNG NHẬP</button>
            </form>
        </div>
    </body>

    <script type="text/javascript">
        var phone = document.querySelector("#phone");
        var password = document.querySelector("#password");
        var form = document.querySelector("form");

        function showError(inputID, errorMessage) {
            let parent = inputID.parentElement;
            console.log(parent);
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

        // 2. Check Email;
        function checkPhoneValid(input) {
            const regexPhone = /^0[1-9]\d{8,9}$/;
            input.value = input.value.trim();
            var isPhoneValid = regexPhone.test(input.value);
            console.log(isPhoneValid);
            if (!isPhoneValid) {
                showError(input, "Số điện thoại không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isPhoneValid;
        }

        // 2. Check Email;
        function checkPasswordValid(input) {
            const regexPassword =
                    /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
            input.value = input.value.trim();
            var isPasswordValid = regexPassword.test(input.value);

            console.log(isPasswordValid);
            if (!isPasswordValid) {
                showError(input, "Mật khẩu không hợp lệ!!!");
            } else {
                showSuccess(input);
            }
            return isPasswordValid;
        }

        function validationForm() {
            let isPhoneValid = checkPhoneValid(phone);
            let isPasswordValid = checkPasswordValid(password);
            if (isPhoneValid && isPasswordValid) {
                return true;
            }
            return false;
        }
    </script>
</html>
