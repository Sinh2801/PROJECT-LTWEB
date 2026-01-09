package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.Category;
import vn.edu.nlu.fit.backend.model.Product;

import java.sql.*;
import java.util.*;

public class HomeDAO {
    private final CategoryDAO categoryDAO;
    private final ProductDAO productDAO;

    public HomeDAO() {
        this.categoryDAO = new CategoryDAO();
        this.productDAO = new ProductDAO();
    }

    /**
     * Section chính:
     * - 5 category bán chạy nhất
     * - Mỗi category có danh sách sản phẩm bán chạy
     */
    public List<Category> getTopCategoriesForHome() {
        List<Category> categories = categoryDAO.getTopSellingCategories(5);
        for (Category category : categories) {
            List<Product> products = productDAO.getTopSellingByCategory(category.getId(), 8);
            category.setProducts(products);
        }
        return categories;
    }

    /**
     * Extension section:
     * - Các category chưa nằm trong top bán chạy
     * - Category logic: Sản phẩm đánh giá tốt
     * - Category logic: Sản phẩm mới
     */
    public List<Category> getExtensionSections() {
        List<Category> result = new ArrayList<>();
        List<Integer> topCategoryIds = new CategoryDAO().getTopSellingCategoryIds(5);

        // 1. Các category chưa hiển thị ở section chính
        List<Category> remainCategories = categoryDAO.getCategoriesNotIn(topCategoryIds);

        for (Category category : remainCategories) {
            List<Product> products =
                    productDAO.getTopSellingByCategory(
                            category.getId(), 8
                    );
            category.setProducts(products);
            result.add(category);
        }

        // 2. Category logic: Sản phẩm đánh giá tốt
        Category topRated = new Category();
        topRated.setId(-1); // ID ảo
        topRated.setName("SẢN PHẨM ĐÁNH GIÁ TỐT");
        topRated.setProducts(productDAO.getTopRatedProducts(8));
        result.add(topRated);

        // 3. Category logic: Sản phẩm mới
        Category newest = new Category();
        newest.setId(-2); // ID ảo
        newest.setName("SẢN PHẨM MỚI");
        newest.setProducts(productDAO.getNewestProducts(8));
        result.add(newest);
        return result;
    }
}
