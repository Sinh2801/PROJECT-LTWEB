package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.Promotion;
import vn.edu.nlu.fit.backend.util.DBContextT;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class PromotionDAO extends DBContextT {

    // Lấy khuyến mãi còn hiệu lực của sản phẩm
    public Promotion getActivePromotionByProductId(int productId) {
        String sql = """
            SELECT *
            FROM promotions
            WHERE product_id = ?
              AND (start_date IS NULL OR start_date <= NOW())
              AND (end_date IS NULL OR end_date >= NOW())
            ORDER BY discount_percent DESC
            LIMIT 1
        """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapPromotion(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Mapping ResultSet -> Promotion
    private Promotion mapPromotion(ResultSet rs) throws Exception {
        return new Promotion(
                rs.getInt("id"),
                rs.getInt("product_id"),
                rs.getInt("discount_percent"),
                rs.getTimestamp("start_date") != null ? Timestamp.valueOf(rs.getTimestamp("start_date").toLocalDateTime()) : null,
                rs.getTimestamp("end_date") != null ? Timestamp.valueOf(rs.getTimestamp("end_date").toLocalDateTime()) : null
        );
    }
}
