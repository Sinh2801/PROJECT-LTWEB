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
                            <a href="Signup.html" class="register">Đăng ký</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="main-header">
                <div class="left">
                    <button id="menuBtn" class="menu-toggle" aria-label="Mở menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/homepage">
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
                        <a href="ShoppingCart.html" class="cart-link">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="cart-count">0</span>
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
            </nav>
        </header>
    </div>

    <main class="main-container">
        <div class="slideshow-container" id="headerSlideshow">
            <c:if test="${not empty bannerList}">
                <c:forEach items="${bannerList}" var="b">
                    <div class="slide">
                        <img src="${pageContext.request.contextPath}/${b.imageUrl}" alt="${b.title}" style="width:100%"/>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty bannerList}">
                <div class="slide"><img src="${pageContext.request.contextPath}/assets/image/Banner/img1.jpg" style="width:100%"/></div>
            </c:if>

            <button class="prev">&#10094;</button>
            <button class="next">&#10095;</button>
        </div>
        <hr class="divider">

        <section id="Loai1" class="product-section">
            <h2><a href="#">QUÀ TẶNG CÁ NHÂN HÓA</a></h2>
            <div class="product-list">
                <c:forEach var="i" begin="1" end="4">
                    <div class="product-card">
                        <div class="img-box">
                            <span class="badge-sale">SALE</span>
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Ca-nhan-hoa/imgbut.jpg" alt="Sản phẩm" class="product-img"/>
                        </div>
                        <p class="product-name">Cốc Sứ Mạ Vàng Danh Lam Thắng Cảnh...</p>
                        <div class="price-container">
                            <span class="current-price">225,000 ₫</span>
                            <span class="old-price">250,000 ₫</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="see-more-btn">Xem thêm</button>
        </section>

        <section id="Loai2" class="product-section">
            <h2><a href="#">HỘP QUÀ TẶNG</a></h2>
            <div class="product-list">
                <c:forEach var="i" begin="1" end="4">
                    <div class="product-card">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Hop-qua-tang/imgset.jpg" alt="Sản phẩm" class="product-img"/>
                        </div>
                        <p class="product-name">Set Quà Tặng Hương Thơm, Xà Phòng...</p>
                        <div class="price-container"><span class="product-price">285,000 ₫</span></div>
                    </div>
                </c:forEach>
            </div>
            <button class="see-more-btn">Xem thêm</button>
        </section>

        <section id="Loai3" class="product-section">
            <h2><a href="#">EXCLUSIVE</a></h2>
            <div class="product-list">
                <c:forEach var="i" begin="1" end="4">
                    <div class="product-card">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Ca-nhan-hoa/imgnenthom.jpg" alt="Sản phẩm" class="product-img"/>
                        </div>
                        <p class="product-name">Bật Lửa Cổ Điển Bọc Da Thiết Kế Theo Yêu Cầu...</p>
                        <div class="price-container"><span class="product-price">780,000 ₫</span></div>
                    </div>
                </c:forEach>
            </div>
            <button class="see-more-btn">Xem thêm</button>
        </section>

        <section id="Loai4" class="product-section">
            <h2><a href="#">QUÀ DOANH NGHIỆP</a></h2>
            <div class="product-list">
                <c:forEach var="i" begin="1" end="4">
                    <div class="product-card">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Ca-nhan-hoa/imgmohinh.jpg" alt="Sản phẩm" class="product-img"/>
                        </div>
                        <p class="product-name">Túi Vải Linen Phiên Bản Giới Hạn...</p>
                        <div class="price-container"><span class="product-price">450,000 ₫</span></div>
                    </div>
                </c:forEach>
            </div>
            <button class="see-more-btn">Xem thêm</button>
        </section>

        <section id="Loai5" class="product-section">
            <h2><a href="#">QUÀ LƯU NIỆM</a></h2>
            <div class="product-list">
                <c:forEach var="i" begin="1" end="4">
                    <div class="product-card">
                        <div class="img-box">
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Ca-nhan-hoa/imgdatset.jpg" alt="Sản phẩm" class="product-img"/>
                        </div>
                        <p class="product-name">Tranh Đất Sét Theo Yêu Cầu, Cỡ Nhỏ...</p>
                        <div class="price-container"><span class="product-price">390,000 ₫</span></div>
                    </div>
                </c:forEach>
            </div>
            <button class="see-more-btn">Xem thêm</button>
        </section>

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
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Qua-tang/imgbangai.jpg" alt="E1">
                            <p>Quà tặng bạn gái</p>
                        </div>
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/assets/images/Product/Qua-tang/imgme.jpg" alt="E2">
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