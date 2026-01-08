<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<aside class="account-sidebar">
    <div class="sidebar-profile">
        <div class="avatar-container">
            <i class="fa-solid fa-user-circle avatar-placeholder"></i>
        </div>
        <strong>${sessionScope.userInSession.fullName}</strong>
        <span>${sessionScope.userInSession.username}</span>
        <button class="btn-change-avatar">Thay đổi ảnh</button>
    </div>
    <hr class="sidebar-divider">
    <ul class="account-menu">
        <li class="${pageContext.request.requestURI.contains('userprofile') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/user/userprofile.jsp">
                <i class="fa-solid fa-user-circle"></i> Hồ Sơ Của Tôi
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('userorder') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/user/userorder.jsp">
                <i class="fa-solid fa-receipt"></i> Đơn Hàng
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('userfavourite') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/user/userfavourite.jsp">
                <i class="fa-solid fa-heart"></i> Sản Phẩm Yêu Thích
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('userreview') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/user/userreview.jsp">
                <i class="fa-solid fa-star"></i> Đánh Giá Của Tôi
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('userpass') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/user/userpass.jsp">
                <i class="fa-solid fa-key"></i> Đổi Mật Khẩu
            </a>
        </li>
        <li class="btn-logout">
            <a href="${pageContext.request.contextPath}/logout">
                <i class="fa-solid fa-sign-out-alt"></i> Đăng Xuất
            </a>
        </li>
    </ul>
</aside>