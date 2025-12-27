package vn.edu.nlu.fit.backend.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// Chỉ chặn trang chủ và các trang cần bảo mật, KHÔNG chặn toàn bộ /*
@WebFilter(urlPatterns = {"/homepage.jsp", "/home"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // Kiểm tra đăng nhập
        boolean loggedIn = (session != null && session.getAttribute("userInSession") != null);

        // In ra console để debug (kiểm tra trong tab Tomat Localhost Log)
        System.out.println("Đang truy cập: " + req.getServletPath() + " - LoggedIn: " + loggedIn);

        // Chống lưu cache (quan trọng để nút Back không xem lại được trang cũ)
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);

        if (loggedIn) {
            chain.doFilter(request, response); // Cho phép đi tiếp
        } else {
            // Nếu chưa đăng nhập, đá về trang login
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}