<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 1/8/2026
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="page-container">
<!-- Banner slideshow  -->
<div class="slideshow-container" id="headerSlideshow">
    <c:forEach var="i" begin="1" end="4">
        <div class="slide">
            <a href="productType">
                <img src="${pageContext.request.contextPath}/assets/img/banner/img${i}.jpg"/>
            </a>
        </div>
    </c:forEach>

    <button class="prev">&#10094;</button>
    <button class="next">&#10095;</button>

    <div class="dots">
        <c:forEach var="i" begin="1" end="4">
            <span class="dot" data-slide="${i}"></span>
        </c:forEach>
    </div>
</div>
<!-- Caterory top section   -->
<c:forEach var="cat" items="${topCategories}">
    <section id="Loai${cat.id}" class="product-section">

        <h2>
            <a href="productType?cid=${cat.id}">
                    ${cat.name}
            </a>
        </h2>

        <div class="product-list">
            <c:forEach var="p" items="${cat.products}">
                <div class="product-card">
                    <a href="productDetail?id=${p.id}">
                        <div class="img-box">
                            <img src="${p.imageUrl}" class="product-img"/>
                        </div>

                        <p class="product-name">${p.name}</p>

                        <div class="price-container">
                            <span class="product-price">
                                <fmt:formatNumber value="${p.originalPrice}" type="number" groupingUsed="true"/> ₫
                            </span>
                        </div>

                        <p class="product-sold">
                            Đã bán ${p.totalSold}
                            <span class="rating">★ ${p.avgRating}</span>
                        </p>
                    </a>
                </div>
            </c:forEach>
        </div>

        <a class="see-more-btn" href="productType?cid=${cat.id}">
            Xem thêm
        </a>
    </section>
</c:forEach>
<!-- Extension section -->
<section id="extension" class="product-section horizontal-section">

    <div class="left-content">
        <h2>DANH MỤC KHÁC</h2>
        <a class="see-more-btn" href="productType">Xem thêm</a>
    </div>

    <div class="right-content">
        <div class="product-slider">

            <!-- 3 category còn lại -->
            <c:forEach var="cat" items="${extraCategories}">
                <div class="product-card category-card">
                    <a href="productType?cid=${cat.id}">
                        <img src="${cat.thumbnailUrl}">
                        <p>${cat.name}</p>
                    </a>
                </div>
            </c:forEach>

            <!-- Category logic: Đánh giá tốt -->
            <div class="product-card category-card">
                <a href="productType?type=topRated">
                    <img src="${pageContext.request.contextPath}/assets/img/category/top-rated.jpg">
                    <p>Sản phẩm đánh giá tốt</p>
                </a>
            </div>

            <!-- Category logic: Sản phẩm mới -->
            <div class="product-card category-card">
                <a href="productType?type=new">
                    <img src="${pageContext.request.contextPath}/assets/img/category/new.jpg">
                    <p>Sản phẩm mới</p>
                </a>
            </div>

        </div>
    </div>
</section>
<!-- Top Selling  -->
<section class="product-section top-selling">
    <h2>MỌI NGƯỜI ĐANG MUA GÌ</h2>

    <div class="product-list">
        <c:forEach var="p" items="${topSellingProducts}">
            <div class="product-card">
                <a href="productDetail?id=${p.id}">
                    <div class="img-box">
                        <img src="${p.imageUrl}" class="product-img"/>
                    </div>

                    <p class="product-name">${p.name}</p>

                    <div class="price-container">
                        <span class="product-price">
                            <fmt:formatNumber value="${p.originalPrice}" type="number" groupingUsed="true"/> ₫
                        </span>
                    </div>

                    <p class="product-sold">
                        Đã bán ${p.totalSold}
                        <span class="rating">★ ${p.avgRating}</span>
                    </p>
                </a>
            </div>
        </c:forEach>
    </div>
</section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
