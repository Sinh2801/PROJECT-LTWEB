<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu - INOLA</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/User.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageFooter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageAlter.css">
</head>
<body>

<c:if test="${empty sessionScope.userInSession}">
    <c:redirect url="/login.jsp"/>
</c:if>

<div class="page-container">
    <jsp:include page="/header.jsp" />

    <div class="account-container">
        <jsp:include page="/user/sidebar.jsp" />

        <main class="account-content">
            <div class="profile-card">
                <h2>Thay đổi mật khẩu</h2>

                <form class="password-form" action="${pageContext.request.contextPath}/change-password" method="post">

                    <c:if test="${not empty error}">
                        <p style="color: red; margin-bottom: 10px;">${error}</p>
                    </c:if>
                    <c:if test="${not empty success}">
                        <p style="color: green; margin-bottom: 10px;">${success}</p>
                    </c:if>

                    <div class="form-group">
                        <label for="old-password">Mật khẩu cũ</label>
                        <input type="password" name="oldPassword" id="old-password" placeholder="Nhập mật khẩu cũ" required>
                    </div>
                    <div class="form-group">
                        <label for="new-password">Mật khẩu mới</label>
                        <input type="password" name="newPassword" id="new-password" placeholder="Nhập mật khẩu mới" minlength="8" required>
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Xác nhận mật khẩu mới</label>
                        <input type="password" name="confirmPassword" id="confirm-password" placeholder="Xác nhận lại mật khẩu mới" required>
                    </div>

                    <button type="submit" class="btn-save">Lưu thay đổi</button>
                </form>
            </div>
        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>

</body>
</html>