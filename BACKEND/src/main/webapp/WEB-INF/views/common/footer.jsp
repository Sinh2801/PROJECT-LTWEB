
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer-wrapper">
    <footer class="footer-container page-container">
        <div class="footer-columns">
            <div class="footer-col">
                <h3>WORK WITH US</h3>
                <a href="#">Affiliate Program</a>
                <a href="#">Partnerships</a>
            </div>

            <div class="footer-col">
                <h3>TEACH WITH US</h3>
                <a href="#">Become a Teacher</a>
                <a href="#">Teacher Help Center</a>
                <a href="#">Teacher Rules</a>
            </div>

            <div class="footer-col">
                <h3>Phương thức thanh toán</h3>
                <div class="icon-row">
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Payment/visa.jpg" alt="Visa"></div>
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Payment/mastercard.png" alt="Mastercard"></div>
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Payment/momo.webp" alt="Momo"></div>
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Payment/vnpay.webp" alt="VNPAY"></div>
                </div>

                <h3 style="margin-top:16px;">Phương thức vận chuyển</h3>
                <div class="icon-row">
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Transport/ghtk.webp" alt="GHTK"></div>
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Transport/ghn.png" alt="GHN"></div>
                    <div class="icon-box"><img src="${pageContext.request.contextPath}/assets/image/Transport/jnt.webp" alt="J&T"></div>
                </div>
            </div>

            <div class="footer-col">
                <h3>Kết nối với INOLA</h3>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" aria-label="TikTok"><i class="fa-brands fa-tiktok"></i></a>
                    <a href="#" aria-label="YouTube"><i class="fa-brands fa-youtube"></i></a>
                </div>

                <h3 style="margin-top:16px;">Nhận tin ưu đãi</h3>
                <div class="subscribe-box">
                    <input type="email" placeholder="Email của bạn" aria-label="Email">
                    <button type="button">→</button>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <p>Address: Đại Học Nông Lâm Thành Phố Hồ Chí Minh</p>
            <p>Responsible for Content Management: Group 32</p>
            <p>@ 2025 - Copyright belongs to Group 32</p>
        </div>
    </footer>
</div>
</body>
</html>
