<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Biến ctx để rút gọn đường dẫn --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<aside class="sidebar" id="sidebar">
    <nav class="logo">
        <%-- Lưu ý: Đường dẫn ảnh cần chỉnh lại cho đúng với thư mục trong webapp --%>
        <img src="${ctx}/assets/image/Logo/Logo-removebg-preview.png" alt="logo" width="100">
    </nav>
    <ul class="menu">
        <%-- TỔNG QUAN --%>
        <li class="${param.activePage == 'overview' ? 'active' : ''}">
            <a href="${ctx}/admin/overview">
                <i class="fa-solid fa-chart-line"></i> Tổng quan
            </a>
        </li>

        <%-- SẢN PHẨM --%>
        <li class="${param.activePage == 'product' ? 'active' : ''}">
            <a href="${ctx}/admin/products">
                <i class="fa-solid fa-box"></i> Sản phẩm
            </a>
        </li>

        <%-- ĐƠN HÀNG --%>
        <li class="${param.activePage == 'order' ? 'active' : ''}">
            <a href="${ctx}/admin/orders">
                <i class="fa-solid fa-receipt"></i> Đơn hàng
            </a>
        </li>

        <%-- KHÁCH HÀNG --%>
        <li class="${param.activePage == 'customer' ? 'active' : ''}">
            <a href="${ctx}/admin/customers">
                <i class="fa-solid fa-users"></i> Khách hàng
            </a>
        </li>

        <%-- HỒ SƠ --%>
        <li class="${param.activePage == 'profile' ? 'active' : ''}">
            <a href="${ctx}/admin/profile">
                <i class="fa-solid fa-user-gear"></i> Hồ sơ
            </a>
        </li>

        <%-- CÀI ĐẶT --%>
        <li class="${param.activePage == 'setting' ? 'active' : ''}">
            <a href="${ctx}/admin/setting/general">
                <i class="fa-solid fa-gear"></i> Cài đặt
            </a>
        </li>

        <li class="btn-logout">
            <a href="${ctx}/logout">
                <i class="fa-solid fa-arrow-right-from-bracket"></i> Đăng xuất
            </a>
        </li>
    </ul>
</aside>