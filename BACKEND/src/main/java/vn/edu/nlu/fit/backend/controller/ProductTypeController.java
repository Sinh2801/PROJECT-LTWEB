package vn.edu.nlu.fit.backend.controller;

import vn.edu.nlu.fit.backend.dao.CategoryDAO;
import vn.edu.nlu.fit.backend.dao.ProductDAO;
import vn.edu.nlu.fit.backend.model.Category;
import vn.edu.nlu.fit.backend.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductTypeController", urlPatterns = {"/category"})
public class ProductTypeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int categoryId = Integer.parseInt(request.getParameter("id"));

        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Product> products = productDAO.getProductsByCategory(categoryId);
        List<Category> categories = categoryDAO.getAllCategories();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("categoryId", categoryId);

        request.getRequestDispatcher("productType.jsp").forward(request, response);
    }
}

