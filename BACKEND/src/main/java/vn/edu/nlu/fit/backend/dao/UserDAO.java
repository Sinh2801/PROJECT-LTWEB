package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.User;
import vn.edu.nlu.fit.backend.util.DBContext;
import vn.edu.nlu.fit.backend.util.PasswordUtil;

import java.sql.*;

public class UserDAO {


    public User login(String username, String password) {

        String sql = "SELECT * FROM users WHERE username = ?";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPasswordFromDB = rs.getString("password");

                // 2. Dùng PasswordUtil để so sánh mật khẩu người dùng nhập với chuỗi đã mã hóa
                // [Hàm này sẽ tự giải mã và so sánh cho bạn]
                if (PasswordUtil.checkPassword(password, hashedPasswordFromDB)) { // Nếu đúng, trả về đối tượng User để Controller xử lý
                    User user = new User();
                    user.setUsername(rs.getString("username"));
                    user.setFullName(rs.getString("full_name"));
                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Trả về null nếu sai mật khẩu hoặc không thấy username
    }


public boolean register(String username, String password, String fullName) {
    String sql = "INSERT INTO users (username, password, full_name) VALUES (?, ?, ?)";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        // Mã hóa mật khẩu bằng BCrypt trước khi lưu vào CSDL
        String hashedPassword = PasswordUtil.hashPassword(password);

        ps.setString(1, username);
        ps.setString(2, hashedPassword);
        ps.setString(3, fullName);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
}