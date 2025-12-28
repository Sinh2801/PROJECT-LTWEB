package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.Product;
import vn.edu.nlu.fit.backend.util.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getTopProducts() {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT * FROM product ORDER BY sold DESC LIMIT 5";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setSold(rs.getInt("sold"));
                p.setViewCount(rs.getInt("view_count"));
                p.setRating(rs.getDouble("rating"));
                p.setImage(rs.getString("image"));

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
