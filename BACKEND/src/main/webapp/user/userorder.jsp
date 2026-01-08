<main class="account-content">
    <nav class="order-tabs">
        <a href="#" class="tab-item active">Tất cả</a>
    </nav>
    <div class="order-content">
        <table class="order-list-table">
            <thead>
            <tr>
                <th>Mã Đơn Hàng</th>
                <th>Sản phẩm</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td><a href="#">#${order.id}</a></td>
                    <td>
                        <div class="product-cell">
                            <img src="${pageContext.request.contextPath}/${order.imageThumb}" alt="Sản phẩm">
                            <div class="product-info">
                                <strong>${order.productName}</strong>
                                <span>x${order.quantity}</span>
                            </div>
                        </div>
                    </td>
                    <td>${order.orderDate}</td>
                    <td>${order.totalPrice} VND</td>
                    <td><div class="badge success">${order.status}</div></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>