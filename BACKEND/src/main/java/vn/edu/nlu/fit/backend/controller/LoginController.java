package vn.edu.nlu.fit.backend.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.backend.dao.UserDAO;
import vn.edu.nlu.fit.backend.model.User;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Luôn hiện trang login khi vào đường dẫn /login bằng trình duyệt
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy dữ liệu từ thẻ <input name="username"> và "password" trong login.jsp
        String u = request.getParameter("username");
        String p = request.getParameter("password");

        // 2. Gọi lớp UserDAO để kiểm tra thông tin
        UserDAO dao = new UserDAO();
        User authUser = dao.login(u, p);

        if (authUser != null) {


            HttpSession session = request.getSession();
            session.setAttribute("userInSession", authUser);
            response.sendRedirect(request.getContextPath() + "/home/homepage.jsp");
        } else {
            // TRƯỜNG HỢP SAI:
            // - Gửi attribute "error" trùng với biến ${error} ở login.jsp
            request.setAttribute("error", "Email hoặc mật khẩu không chính xác!");

            // - Dùng forward để giữ lại trang và hiện dòng chữ đỏ báo lỗi
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}