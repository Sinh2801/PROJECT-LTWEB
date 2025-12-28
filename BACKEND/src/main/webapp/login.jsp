<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - INOLA</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageFooter.css">

    <style>
        .login_right {
            flex: 1;
            background-image: url("${pageContext.request.contextPath}/assets/images/Product/Ca-nhan-hoa/imgbut.jpg");
            background-size: cover;
            background-position: center;
        }
        /* Style cho thông báo lỗi */
        .error-message {
            color: #d9534f;
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="page_login">
    <div class="container">
        <img src="${pageContext.request.contextPath}/assets/images/Logo/Logo-removebg-preview.png" alt="Logo INOLA" style="height:36px; width:auto;">
        <a href="${pageContext.request.contextPath}/homepage.jsp" class="pix_button small_button purple_bg">
            <span>Trung tâm trợ giúp</span>
        </a>
    </div>
</div>

<div class="pixfort_login_1">
    <div class="container">
        <div class="login_wrapper">
            <div class="login_left">
                <h2 class="login_title">ĐĂNG NHẬP</h2>
                <div class="login_illustration">
                    <img src="https://cdn-icons-png.flaticon.com/512/4140/4140048.png" alt="User Illustration">
                </div>

                <c:if test="${not empty error}">
                    <div class="error-message">
                        <i class="fa fa-exclamation-circle"></i> ${error}
                    </div>
                </c:if>

                <form class="login_form" action="${pageContext.request.contextPath}/login" method="post">
                    <div class="input_group">
                        <i class="fa fa-envelope"></i>
                        <input type="text" name="username" placeholder="Email hoặc số điện thoại" required>
                    </div>
                    <div class="input_group">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" placeholder="Mật khẩu" required>
                    </div>
                    <div class="forgot_pass">
                        <a href="step1_forgot_password.html">Quên mật khẩu?</a>
                    </div>
                    <button type="submit" class="btn_login">ĐĂNG NHẬP</button>
                    <button type="button" class="btn_google light_bg">
                        <i class="fa-brands fa-google"></i> Đăng ký với Google
                    </button>
                    <a href="${pageContext.request.contextPath}/signup" class="btn_register light_bg" style="text-decoration: none;">
                        <i class="fa fa-user-plus"></i> Đăng ký tài khoản mới
                    </a>
                </form>
            </div>
            <div class="login_right"></div>
        </div>
    </div>
</div>

<jsp:include page="/footer.jsp" />

</body>
</html>