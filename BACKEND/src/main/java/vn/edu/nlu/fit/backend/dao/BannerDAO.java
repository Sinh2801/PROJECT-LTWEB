package vn.edu.nlu.fit.backend.dao;

import vn.edu.nlu.fit.backend.model.Banner;
import vn.edu.nlu.fit.backend.util.DBContext; // Giả sử bạn để DBContext ở đây

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BannerDAO {

    // 1. Lấy danh sách tất cả Banner
    public List<Banner> getAll() {
        List<Banner> list = new ArrayList<>();
        String sql = "SELECT * FROM banner ORDER BY position ASC";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Banner b = new Banner();
                b.setId(rs.getInt("id"));
                b.setImageUrl(rs.getString("image_url"));
                b.setTitle(rs.getString("title"));
                b.setPosition(rs.getInt("position"));
                b.setStatus(rs.getInt("status") == 1);

                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Lấy Banner theo ID
    public Banner getById(int id) {
        String sql = "SELECT * FROM banner WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Banner b = new Banner();
                    b.setId(rs.getInt("id"));
                    b.setImageUrl(rs.getString("image_url"));
                    b.setTitle(rs.getString("title"));
                    b.setPosition(rs.getInt("position"));
                    b.setStatus(rs.getInt("status") == 1);
                    return b;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 3. Thêm mới Banner
    public boolean insert(Banner b) {
        String sql = "INSERT INTO banner (image_url, title, position, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, b.getImageUrl());
            ps.setString(2, b.getTitle());
            ps.setInt(3, b.getPosition());
            ps.setInt(4, b.isStatus() ? 1 : 0);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 4. Cập nhật Banner
    public boolean update(Banner b) {
        String sql = "UPDATE banner SET image_url=?, title=?, position=?, status=? WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, b.getImageUrl());
            ps.setString(2, b.getTitle());
            ps.setInt(3, b.getPosition());
            ps.setInt(4, b.isStatus() ? 1 : 0);
            ps.setInt(5, b.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 5. Xóa Banner
    public boolean delete(int id) {
        String sql = "DELETE FROM banner WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<Banner> getActiveBanners() {
        List<Banner> list = new ArrayList<>();
        String sql = "SELECT * FROM banner WHERE status = 1 ORDER BY position";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Banner b = new Banner();
                b.setId(rs.getInt("id"));
                b.setImageUrl(rs.getString("image_url"));
                b.setTitle(rs.getString("title"));
                list.add(b);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}