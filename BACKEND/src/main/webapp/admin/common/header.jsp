<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<header class="header">
    <div class="menu-toggle" id="menu-toggle">
        <i class="fa-solid fa-bars"></i>
    </div>

    <div class="user-info">
        <i class="fa-solid fa-bell"></i>
        <img src="https://i.pravatar.cc/40" alt="user">
    </div>
</header>