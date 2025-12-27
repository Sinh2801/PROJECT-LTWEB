package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.User;
import vn.edu.nlu.fit.backend.util.DBContext;
import java.sql.*;

public class UserDAO {
    public User login(String user, String pass) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try {
            // Kết nối CSDL thông qua DBContext
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Nếu tìm thấy, trả về đối tượng User chứa tên thật
                return new User(rs.getString("username"), rs.getString("full_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Không tìm thấy
    }
}