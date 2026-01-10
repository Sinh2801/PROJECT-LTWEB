package vn.edu.nlu.fit.backend.controller;

import vn.edu.nlu.fit.backend.dao.ProductDAO;
import vn.edu.nlu.fit.backend.dao.PromotionDAO;
import vn.edu.nlu.fit.backend.dao.ReviewDAO;
import vn.edu.nlu.fit.backend.model.Product;
import vn.edu.nlu.fit.backend.model.Promotion;
import vn.edu.nlu.fit.backend.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/productDetail")
public class ProductDetailServlet extends HttpServlet {

    private ProductDAO productDAO;
    private PromotionDAO promotionDAO;
    private ReviewDAO reviewDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
        promotionDAO = new PromotionDAO();
        reviewDAO = new ReviewDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy id sản phẩm
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("home");
            return;
        }

        int productId;
        try {
            productId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("home");
            return;
        }

        // 2. Lấy dữ liệu từ DB
        Product product = productDAO.getProductById(productId);
        if (product == null) {
            response.sendRedirect("home");
            return;
        }

        Promotion promotion = promotionDAO.getActivePromotionByProductId(productId);
        List<Review> reviews = reviewDAO.getReviewsByProductId(productId);

        // 3. Gửi dữ liệu sang JSP
        request.setAttribute("product", product);
        request.setAttribute("promotion", promotion);
        request.setAttribute("reviews", reviews);

        // 4. Forward sang JSP
        request.getRequestDispatcher("/WEB-INF/views/productDetail.jsp")
                .forward(request, response);
    }
}
