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

@WebServlet(name = "ProductDetailController", urlPatterns = {"/product"})
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        Product product = productDAO.getProductById(productId);
        List<Category> categories = categoryDAO.getAllCategories();

        request.setAttribute("product", product);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
    }
}

