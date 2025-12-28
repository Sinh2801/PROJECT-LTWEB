<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="settings-tabs">
    <a href="${ctx}/admin/setting/general"
       class="tab-btn ${param.activeTab == 'general' ? 'active' : ''}">
        Chung
    </a>

    <a href="${ctx}/admin/setting/payment"
       class="tab-btn ${param.activeTab == 'payment' ? 'active' : ''}">
        Thanh toán & Vận chuyển
    </a>

    <a href="${ctx}/admin/setting/notification"
       class="tab-btn ${param.activeTab == 'notification' ? 'active' : ''}">
        Thông báo
    </a>

    <a href="${ctx}/admin/setting/staff"
       class="tab-btn ${param.activeTab == 'staff' ? 'active' : ''}">
        Nhân viên
    </a>
</div>