<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng của bạn - INOLA</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ShoppingCart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/HomePageFooter.css">
</head>
<body>

<div class="page-wrapper">
    <div class="cart-layout">
        <div class="cart-items-section">
            <div class="continue-shopping">
                <a href="${pageContext.request.contextPath}/home/homepage.jsp"><i class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm</a>
            </div>

            <div class="section-header">
                <h2 class="section-title">Giỏ hàng của bạn</h2>
                <div class="select-all-items">
                    <label>Tổng cộng: ${sessionScope.cart.totalQuantity()} sản phẩm</label>
                </div>
            </div>

            <c:if test="${empty sessionScope.cart || sessionScope.cart.totalQuantity() == 0}">
                <div style="text-align: center; padding: 50px;">
                    <p>Giỏ hàng của bạn đang trống.</p>
                    <a href="${pageContext.request.contextPath}/home/homepage.jsp" class="checkout-btn" style="text-decoration: none; display: inline-block; width: auto; padding: 10px 20px;">Mua sắm ngay</a>
                </div>
            </c:if>

            <c:forEach items="${sessionScope.cart.getItems()}" var="item">
                <div class="cart-item-card">
                    <input type="checkbox" class="item-checkbox">
                    <div class="item-image">
                        <img src="${pageContext.request.contextPath}/${item.product.image}" alt="${item.product.productName}">
                    </div>
                    <div class="item-details">
                        <h3 class="item-title">${item.product.productName}</h3>
                        <p class="item-variant">Đơn giá: ${item.price}₫</p>
                        <span class="item-status status-available">Còn hàng</span>
                    </div>
                    <div class="item-price-quantity">
                        <span class="item-price">${item.subTotal}₫</span>
                        <div class="quantity-selector">
                            <button class="qty-btn minus-btn"><i class="fa-solid fa-minus"></i></button>
                            <input type="number" value="${item.quantity}" min="1" class="qty-input">
                            <button class="qty-btn plus-btn"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/remove-cart?productId=${item.product.id}"
                       class="remove-item-btn" style="text-decoration: none; color: inherit;"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                        <i class="fa-solid fa-trash-can"></i> Xóa
                    </a>
                </div>
            </c:forEach>
        </div>

        <div class="order-summary-section">
            <div class="summary-card">
                <h2 class="summary-card-title">Tóm tắt đơn hàng</h2>

                <div class="voucher-input-group">
                    <input type="text" placeholder="Nhập mã giảm giá..." class="voucher-input">
                    <button class="apply-voucher-btn">Áp dụng</button>
                </div>

                <div class="summary-details">
                    <div class="summary-row">
                        <span>Tạm tính</span>
                        <span>${sessionScope.cart.total()}₫</span>
                    </div>
                    <div class="summary-row">
                        <span>Phí vận chuyển</span>
                        <span>Miễn phí</span>
                    </div>
                    <div class="summary-total-row">
                        <span>Tổng cộng</span>
                        <span class="final-total">${sessionScope.cart.total()}₫</span>
                    </div>
                </div>

                <button class="checkout-btn">
                    <a href="${pageContext.request.contextPath}/shoppingcart.jsp"
                       style="color: white; text-decoration: none; font-weight: bold;"
                       onclick="return confirm('Bạn xác nhận thanh toán đơn hàng này?')">
                        XÁC NHẬN THANH TOÁN
                    </a>
                </button>
            </div>
        </div>
    </div>

    <jsp:include page="/footer.jsp" />
</div>

</body>
</html>