package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.util.DBContext;
import vn.edu.nlu.fit.backend.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDAO {


    public Product getProductById(int productId) {


        String sql = "SELECT id, product_name, price, old_price, image, category_id FROM products WHERE id = ?";

        try {
            // 2. Mở kết nối thông qua DBContext
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);

            // 3. Thực thi câu lệnh
            ResultSet rs = ps.executeQuery();

            // 4. Map dữ liệu từ ResultSet sang đối tượng Product
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
            // Log lỗi để kiểm tra nếu có vấn đề về kết nối hoặc tên cột
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy sản phẩm (để Thầy kiểm tra ID)
    }
}