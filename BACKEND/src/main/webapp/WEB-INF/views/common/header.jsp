<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="header-wrapper">
    <header class="header-container page-container">

        <!-- ================= USER BAR ================= -->
        <div class="user-bar">
            <div class="right">
                <a href="login" class="login">Đăng nhập</a>
                <span>|</span>
                <a href="register" class="register">Đăng ký</a>
            </div>
        </div>

        <!-- ================= MAIN HEADER ================= -->
        <div class="main-header">

            <!-- ===== LEFT: MENU DROPDOWN + LOGO ===== -->
            <div class="left">

                <!-- Menu button -->
                <button id="menuBtn" class="menu-toggle" aria-label="Mở menu">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Dropdown menu (ALL categories) -->
                <div class="dropdown-menu" id="dropdownMenu" aria-hidden="true">
                    <c:forEach var="c" items="${categories}">
                        <a href="product-type?id=${c.id}">
                                ${c.name}
                        </a>
                    </c:forEach>
                </div>

                <!-- Logo -->
                <div class="logo">
                    <a href="../../../home">
                        <img src="assets/images/logo.png" alt="INOLA Logo" height="36">
                    </a>
                </div>
            </div>

            <!-- ===== CENTER: SEARCH ===== -->
            <div class="center">
                <div class="search-wrapper">
                    <form action="search" method="get">
                        <input type="text"
                               name="keyword"
                               placeholder="Tìm kiếm sản phẩm..."
                               class="search-bar"
                               autocomplete="off">
                        <button class="search-btn" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>

                    <!-- search dropdown (giữ UI – xử lý JS sau) -->
                    <div class="search-dropdown" id="searchDropdown">
                        <div class="dropdown-top">
                            <span class="history-title">Tìm kiếm gần đây</span>
                            <span class="clear-all">Xóa tất cả</span>
                        </div>

                        <div class="empty-state">
                            <img src="assets/images/empty-search.png" alt="Empty">
                            <p>Không có từ khóa tìm kiếm gần đây</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===== RIGHT: CART ===== -->
            <div class="right">
                <div class="cart">
                    <a href="cart" class="cart-link" aria-label="Giỏ hàng">
                        <i class="fa fa-shopping-cart"></i>
                        <span class="cart-count">0</span>
                    </a>
                </div>
            </div>

        </div>

        <!-- ================= MENU BAR ================= -->
        <!-- 5 CATEGORY BÁN CHẠY NHẤT -->
        <nav class="menu-bar">
            <c:forEach var="c" items="${topCategories}" varStatus="status">
                <a href="#Loai${status.index + 1}" class="menu-link">
                        ${c.name}
                </a>
            </c:forEach>

            <a href="#extension" class="menu-link">
                Mọi Người Đang Mua Gì
            </a>
        </nav>

    </header>
</div>

<!-- overlay -->
<div id="headerOverlay" class="overlay"></div>
