<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ của tôi - INOLA</title>
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
    <jsp:include page=" /WEB-INF/views/common/header.jsp" />

    <div class="account-container">
        <jsp:include page="/user/sidebar.jsp" />

        <main class="account-content">
            <div class="profile-card">
                <h2>Thông tin cá nhân</h2>
                <form class="profile-form" action="${pageContext.request.contextPath}/update-profile" method="post">
                    <div class="form-group">
                        <label for="fullname">Họ và tên</label>
                        <input type="text" id="fullname" name="fullName" value="${sessionScope.userInSession.fullName}" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" value="${sessionScope.userInSession.username}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone" value="0987654321">
                    </div>
                    <div class="form-group radio-group">
                        <label>Giới tính</label>
                        <input type="radio" id="male" name="gender" value="male" checked> <label for="male">Nam</label>
                        <input type="radio" id="female" name="gender" value="female"> <label for="female">Nữ</label>
                    </div>
                    <div class="form-group">
                        <label for="dob">Ngày sinh</label>
                        <input type="date" id="dob" name="dob">
                    </div>
                    <button type="submit" class="btn-save">Lưu thay đổi</button>
                </form>
            </div>

            <div class="profile-card">
                <div class="card-header">
                    <h2>Địa chỉ</h2>
                    <button class="btn-add"><i class="fa-solid fa-plus"></i> Thêm địa chỉ mới</button>
                </div>

                <div class="address-item">
                    <div class="address-info">
                        <div class="info-header">
                            <strong>${sessionScope.userInSession.fullName}</strong>
                            <span class="default-badge">Mặc định</span>
                        </div>
                        <p class="phone-number">SĐT: 0987654321</p>
                        <p class="address-text">Kiên Ngãi, Bình An, Gia Lai</p>
                    </div>
                    <div class="address-actions">
                        <button class="btn-link">Cập nhật</button>
                        <button class="btn-link btn-delete">Xóa</button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>