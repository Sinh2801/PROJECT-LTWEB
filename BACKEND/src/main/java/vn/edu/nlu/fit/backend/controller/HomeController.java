package vn.edu.nlu.fit.backend.controller;

import vn.edu.nlu.fit.backend.dao.BannerDAO;
import vn.edu.nlu.fit.backend.dao.ProductDAO; // Thêm import này
import vn.edu.nlu.fit.backend.model.Banner;
import vn.edu.nlu.fit.backend.model.Product; // Thêm import này

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value ="/home") // Bạn nên đổi value thành /home cho chuyên nghiệp
public class HomeController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy danh sách Banner để chạy Slide

        BannerDAO bannerDAO = new BannerDAO();
        List<Banner> activeBanners = bannerDAO.getActiveBanners();
        request.setAttribute("bannerList", activeBanners);

        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("productList", products);

        // 3. Chuyển hướng
        request.getRequestDispatcher("/home/homepage.jsp").forward(request, response);
    }
}