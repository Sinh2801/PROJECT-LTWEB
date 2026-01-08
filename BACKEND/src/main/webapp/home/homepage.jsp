<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - INOLA</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageFooter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageMain.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageSlip.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/STT.css">
</head>
<body>
<div class="page-container">
    <div class="header-wrapper">
        <header class="header-container page-container">
            <div class="user-bar">
                <div class="right">
                    <c:choose>
                        <c:when test="${not empty sessionScope.userInSession}">
                            <span style="font-weight: 600; color: #5a2d81;">Chào mừng, ${userInSession.fullName}</span>
                            <span>|</span>
                            <a href="${pageContext.request.contextPath}/logout" class="login">Đăng xuất</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login.jsp" class="login">Đăng nhập</a>
                            <span>|</span>
                            <a href="${pageContext.request.contextPath}/signup.jsp" class="register">Đăng ký</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="main-header">
                <div class="left">
                    <button id="menuBtn" class="menu-toggle"><i class="fa fa-bars"></i></button>
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/home">
                            <img src="${pageContext.request.contextPath}/assets/image/Logo/Logo-removebg-preview.png" alt="INOLA Logo" height="36">
                        </a>
                    </div>
                </div>

                <div class="center">
                    <input type="text" id="search" placeholder="Tìm kiếm sản phẩm..." class="search-bar">
                    <button class="search-btn"><i class="fa fa-search"></i></button>
                </div>

                <div class="right">
                    <div class="cart">
                        <a href="${pageContext.request.contextPath}/shoppingcart.jsp" class="cart-link">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="cart-count">
                                ${not empty sessionScope.cart ? sessionScope.cart.totalQuantity() : 0}
                            </span>
                        </a>
                    </div>
                </div>
            </div>

            <nav class="menu-bar">
                <a href="#Loai1" class="menu-link">Quà Tặng Cá Nhân Hóa</a>
                <a href="#Loai2" class="menu-link">Hộp Quà Tặng</a>
                <a href="#Loai3" class="menu-link">Trang Sức Và Phụ Kiện</a>
                <a href="#Loai4" class="menu-link">Đồ Trang Trí Và Thủ Công</a>
                <a href="#Loai5" class="menu-link">Quà Lưu Niệm Nhỏ Gọn</a>
                <a href="#extension" class="menu-link">Mọi Người Đang Mua Gì</a>
            </nav>
        </header>
    </div>

    <main class="main-container">
        <div class="slideshow-container" id="headerSlideshow">
            <c:forEach items="${bannerList}" var="b">
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/${b.imageUrl}" alt="${b.title}" style="width:100%"/>
                </div>
            </c:forEach>
            <c:if test="${empty bannerList}">
                <div class="slide"><img src="${pageContext.request.contextPath}/assets/image/Banner/img1.jpg" style="width:100%"/></div>
            </c:if>
            <button class="prev">&#10094;</button>
            <button class="next">&#10095;</button>
        </div>

        <hr class="divider">

        <c:set var="catNames" value="QUÀ TẶNG CÁ NHÂN HÓA,HỘP QUÀ TẶNG,EXCLUSIVE,QUÀ DOANH NGHIỆP,QUÀ LƯU NIỆM" />
        <c:forEach var="name" items="${catNames}" varStatus="status">
            <section id="Loai${status.index + 1}" class="product-section">
                <h2><a href="#">${name}</a></h2>
                <div class="product-list">
                    <c:forEach items="${productList}" var="p">
                        <c:if test="${p.categoryId == (status.index + 1)}">
                            <div class="product-card">
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}">
                                    <div class="img-box">
                                        <c:if test="${p.oldPrice > p.price}"><span class="badge-sale">SALE</span></c:if>
                                        <img src="${pageContext.request.contextPath}/${p.image}" alt="${p.productName}" class="product-img"/>
                                    </div>
                                    <p class="product-name">${p.productName}</p>
                                    <div class="price-container">
                                        <span class="current-price">${p.price} ₫</span>
                                        <c:if test="${p.oldPrice > 0}"><span class="old-price">${p.oldPrice} ₫</span></c:if>
                                    </div>
                                </a>
                                <a href="${pageContext.request.contextPath}/add-cart?productId=${p.id}&quantity=1" class="see-more-btn" style="text-decoration:none; display:block; text-align:center;">Thêm vào giỏ</a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </section>
        </c:forEach>

        <section id="extension" class="product-section horizontal-section">
            <div class="left-content">
                <h2>GỢI Ý QUÀ Ý NGHĨA</h2>
                <button class="see-more-btn">Xem thêm</button>
            </div>
            <div class="right-content">
                <button class="arrow left" id="prevBtn">‹</button>
                <div class="product-slider-wrapper">
                    <div class="product-slider" id="slider">
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/assets/image/Product/Hộp%20quà%20tặng/imgskin.jpg" alt="E1">
                            <p>Quà tặng bạn gái</p>
                        </div>
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/assets/image/Product/Hộp%20quà%20tặng/imgset.jpg" alt="E2">
                            <p>Quà tặng mẹ</p>
                        </div>
                    </div>
                </div>
                <button class="arrow right" id="nextBtn">›</button>
            </div>
        </section>
    </main>

    <jsp:include page="/footer.jsp" />

    <a href="#"><button id="scrollToTopBtn"><i class="fas fa-chevron-up"></i></button></a>
</div>

<script src="${pageContext.request.contextPath}/assets/js/HeaderAfter.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/HomePage.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/Header.js"></script>
</body>
</html>