package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.Review;
import vn.edu.nlu.fit.backend.util.DBContextT;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO extends DBContextT {

    // Lấy danh sách đánh giá theo sản phẩm
    public List<Review> getReviewsByProductId(int productId) {
        List<Review> list = new ArrayList<>();

        String sql = """
            SELECT *
            FROM reviews
            WHERE product_id = ?
            ORDER BY created_at DESC
        """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapReview(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Mapping ResultSet -> Review
    private Review mapReview(ResultSet rs) throws Exception {
        return new Review(
                rs.getInt("id"),
                rs.getInt("product_id"),
                rs.getInt("user_id"),
                rs.getInt("rating"),
                rs.getString("comment"),
                Timestamp.valueOf(rs.getTimestamp("created_at").toLocalDateTime())
        );
    }
}
