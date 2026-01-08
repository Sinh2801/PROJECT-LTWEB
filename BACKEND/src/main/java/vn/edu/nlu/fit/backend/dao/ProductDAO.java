package vn.edu.nlu.fit.backend.dao;


import vn.edu.nlu.fit.backend.util.DBContextT;
import vn.edu.nlu.fit.backend.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContextT {

    // ----- HomePage
    // Sản phẩm bán chạy
    public List<Product> getBestSellingProducts(int limit) {
        String sql = "SELECT * FROM products ORDER BY total_sold DESC LIMIT ?";
        return getProductsByLimit(sql, limit);
    }

    // ----- ProductType
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapProduct(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ----- Product
    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapProduct(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /* ================= COMMON ================= */
    private List<Product> getProductsByLimit(String sql, int limit) {
        List<Product> list = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapProduct(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private Product mapProduct(ResultSet rs) throws Exception {
        return new Product(
                rs.getInt("id"),
                rs.getObject("category_id") != null ? rs.getInt("category_id") : null,
                rs.getString("name"),
                rs.getString("description"),
                rs.getDouble("original_price"),
                rs.getString("image_url"),
                rs.getInt("stock_quantity"),
                rs.getInt("total_sold"),
                rs.getDouble("avg_rating"),
                rs.getInt("review_count")
        );
    }
}
