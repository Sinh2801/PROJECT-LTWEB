<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 12/23/2025
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Đăng Nhập</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    /* style.css */
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
    }

    .input-group {
        margin-bottom: 15px;
        text-align: left;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        border: none;
        color: white;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }

</style>
<body>
<div class="login-container">
    <h2>Đăng Nhập</h2>
    <form id="loginForm">
        <div class="input-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required placeholder="Nhập email của bạn">
        </div>
        <div class="input-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required placeholder="Nhập mật khẩu">
        </div>
        <button type="submit">Đăng Nhập</button>
    </form>
    <p id="error-message" style="color: red;"></p>
</div>
<script>
    // app.js
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Ngừng gửi form mặc định

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const errorMessage = document.getElementById('error-message');

        // Kiểm tra thông tin đăng nhập (có thể thay đổi theo yêu cầu thực tế)
        if (email === 'user@example.com' && password === '123456') {
            alert('Đăng nhập thành công!');
            // Chuyển hướng đến trang khác (nếu cần)
            // window.location.href = "homepage.html";
        } else {
            errorMessage.textContent = 'Email hoặc mật khẩu không chính xác!';
        }
    });

</script>
</body>
</html>

