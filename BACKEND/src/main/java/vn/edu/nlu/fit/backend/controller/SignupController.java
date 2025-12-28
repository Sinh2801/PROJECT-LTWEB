package vn.edu.nlu.fit.backend.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.backend.dao.UserDAO;
import java.io.IOException;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Điều hướng người dùng đến trang đăng ký
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy dữ liệu từ các thẻ <input name="..."> trong signup.jsp
        String fullName = request.getParameter("full_name");
        String username = request.getParameter("username"); // Đây là Email
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // 2. KIỂM TRA ĐỊNH DẠNG (VALIDATION)

        // Kiểm tra định dạng Email bằng Regular Expression
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        if (username == null || !username.matches(emailRegex)) {
            request.setAttribute("error", "Định dạng Email không hợp lệ!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra độ dài mật khẩu tối thiểu 8 ký tự
        if (password == null || password.length() < 8) {
            request.setAttribute("error", "Mật khẩu bảo mật phải có ít nhất 8 ký tự!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu xác nhận có khớp không
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không trùng khớp!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // 3. GỌI DAO ĐỂ LƯU VÀO CƠ SỞ DỮ LIỆU
        UserDAO dao = new UserDAO();
        boolean isRegistered = dao.register(username, password, fullName);

        if (isRegistered) {
            // Đăng ký thành công -> Chuyển về trang login kèm thông báo
            request.setAttribute("success", "Đăng ký thành công! Bạn có thể đăng nhập ngay.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Thất bại (có thể do Email đã tồn tại trong hệ thống)
            request.setAttribute("error", "Đăng ký thất bại! Email này đã được sử dụng.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}