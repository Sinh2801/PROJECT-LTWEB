package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.util.DBContext;
import vn.edu.nlu.fit.backend.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT id, product_name, price, old_price, image, category_id FROM products";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getDouble("price"),
                        rs.getDouble("old_price"),
                        rs.getString("image"),
                        rs.getInt("category_id")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Lấy 1 sản phẩm theo ID
    public Product getProductById(int productId) {
        String sql = "SELECT id, product_name, price, old_price, image, category_id FROM products WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("product_name"),
                        rs.getDouble("price"),
                        rs.getDouble("old_price"),
                        rs.getString("image"),
                        rs.getInt("category_id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}