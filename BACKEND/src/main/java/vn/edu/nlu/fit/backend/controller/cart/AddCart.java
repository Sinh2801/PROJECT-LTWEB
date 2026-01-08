package vn.edu.nlu.fit.backend.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.backend.cart.Cart;
import vn.edu.nlu.fit.backend.dao.ProductDAO;
import vn.edu.nlu.fit.backend.model.Product;

import java.io.IOException;

@WebServlet(name = "AddCart", value = "/add-cart")
public class AddCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Phân tích tham số
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // 2. Quản lý Session cho Cart
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        // 3. Lấy dữ liệu sản phẩm (Sử dụng DAO đã có của bạn)
        Product p = new ProductDAO().getProductById(productId);

        if (p != null) {
            // Thêm vào giỏ và lưu lại session
            cart.addItem(p, quantity);
            session.setAttribute("cart", cart);
            // Chuyển hướng sang trang danh sách sản phẩm
            response.sendRedirect("home");
            return;
        }

        // 4. Xử lý lỗi nếu không tìm thấy ID sản phẩm
        request.setAttribute("msg", "Product not found");
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}