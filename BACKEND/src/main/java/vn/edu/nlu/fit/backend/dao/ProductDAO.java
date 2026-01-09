package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.Product;
import vn.edu.nlu.fit.backend.util.DBContextT;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContextT {

    /* ================= HOME PAGE ================= */

    // Sản phẩm bán chạy
    public List<Product> getBestSellingProducts(int limit) {
        String sql = """
            SELECT *
            FROM products
            ORDER BY total_sold DESC
            LIMIT ?
        """;
        return getProductsByLimit(sql, limit);
    }

    // Sản phẩm bán chạy theo từng Category (HomePage)
    public List<Product> getTopSellingByCategory(int categoryId, int limit) {
        String sql = """
            SELECT *
            FROM products
            WHERE category_id = ?
            ORDER BY total_sold DESC
            LIMIT ?
        """;

        List<Product> list = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            ps.setInt(2, limit);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapProduct(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    // sản phẩm mới
    public List<Product> getNewestProducts(int limit) {
        String sql = """
        SELECT *
        FROM products
        ORDER BY id DESC
        LIMIT ?
    """;
        return getProductsByLimit(sql, limit);
    }
    // sẩn phẩm đánh giá cao
    public List<Product> getTopRatedProducts(int limit) {
        String sql = """
        SELECT *
        FROM products
        ORDER BY avg_rating DESC, review_count DESC
        LIMIT ?
    """;
        return getProductsByLimit(sql, limit);
    }

    /* ================= PRODUCT TYPE ================= */

    // Danh sách sản phẩm theo Category
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = """
            SELECT *
            FROM products
            WHERE category_id = ?
            ORDER BY total_sold DESC
        """;

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

    /* ================= PRODUCT DETAIL ================= */

    // Lấy chi tiết sản phẩm
    public Product getProductById(int id) {
        String sql = """
            SELECT *
            FROM products
            WHERE id = ?
        """;

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

    // Dùng cho các truy vấn có LIMIT
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

    // Mapping ResultSet -> Product
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
