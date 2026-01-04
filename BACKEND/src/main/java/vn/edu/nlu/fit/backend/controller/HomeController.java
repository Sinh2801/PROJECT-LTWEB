package vn.edu.nlu.fit.backend.controller;

import vn.edu.nlu.fit.backend.dao.BannerDAO;
import vn.edu.nlu.fit.backend.model.Banner;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value ="/homepage")
public class HomeController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy danh sách Banner đang ACTIVE (status = 1)
        BannerDAO bannerDAO = new BannerDAO();
        List<Banner> activeBanners = bannerDAO.getActiveBanners();

        // 2. Đẩy dữ liệu sang JSP
        request.setAttribute("bannerList", activeBanners);

        // 3. Chuyển hướng về homepage.jsp
        request.getRequestDispatcher("/homepage.jsp").forward(request, response);
    }
}
