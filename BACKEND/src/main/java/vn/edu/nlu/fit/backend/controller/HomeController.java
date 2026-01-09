package vn.edu.nlu.fit.backend.controller;

import vn.edu.nlu.fit.backend.dao.HomeDAO;
import vn.edu.nlu.fit.backend.model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    private HomeDAO HomeDAO;

    @Override
    public void init() throws ServletException {
        HomeDAO = new HomeDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Section chính: 5 category bán chạy
        List<Category> topCategories = HomeDAO.getTopCategoriesForHome();

        // Extension section
        List<Category> extensionCategories = HomeDAO.getExtensionSections();

        request.setAttribute("topCategories", topCategories);
        request.setAttribute("extensionCategories", extensionCategories);

        request.getRequestDispatcher("/views/home.jsp").forward(request, response);

    }
}
