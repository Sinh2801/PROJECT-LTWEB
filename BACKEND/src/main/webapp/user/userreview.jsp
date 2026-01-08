<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đánh giá của tôi - INOLA</title>
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
            <nav class="review-tabs">
                <a href="#" class="tab-item active">Tất cả</a>
                <a href="#" class="tab-item">Chưa đánh giá</a>
            </nav>

            <div class="review-list-container">
                <div class="review-card">
                    <div class="review-product-info">
                        <img src="${pageContext.request.contextPath}/assets/image/Product/Hop-qua-tang/imgtra.png" alt="Sản phẩm">
                        <div class="product-details">
                            <strong>Mộc Trà Dưỡng Thân, Trà Gạo Lứt Thảo Mộc...</strong>
                            <p>Phân loại: 10 gói</p>
                        </div>
                    </div>
                    <hr class="review-divider">
                    <div class="review-content">
                        <div class="review-rating">
                            <c:forEach begin="1" end="5">
                                <i class="fa-solid fa-star"></i>
                            </c:forEach>
                        </div>
                        <span class="review-date">Đánh giá ngày 16/11/2025</span>
                        <p class="review-comment">
                            Trà rất ngon và thơm, gói hàng cẩn thận. Giao hàng cũng nhanh nữa. Sẽ tiếp tục ủng hộ shop!
                        </p>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-product-info">
                        <img src="${pageContext.request.contextPath}/assets/image/Product/Hop-qua-tang/imgnen.jpg" alt="Sản phẩm">
                        <div class="product-details">
                            <strong>Nến Thơm Vintage, Hộp Quà Spa Thư Giãn...</strong>
                            <p>Phân loại: Mùi Gỗ Thông</p>
                        </div>
                    </div>
                    <hr class="review-divider">
                    <div class="review-content">
                        <div class="review-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                        </div>
                        <span class="review-date">Đánh giá ngày 15/11/2025</span>
                        <p class="review-comment">
                            Mùi thơm dễ chịu, nhưng nến cháy hơi nhanh. Hộp đựng đẹp.
                        </p>
                    </div>
                </div>

            </div>
        </main>
    </div>

    <jsp:include page="/footer.jsp" />
</div>

</body>
</html>