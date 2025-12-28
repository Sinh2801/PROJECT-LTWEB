package vn.edu.nlu.fit.backend.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // Hàm băm mật khẩu (Dùng khi Đăng ký)
    public static String hashPassword(String plainPassword) {
        // gensalt() tạo ra một chuỗi muối ngẫu nhiên để tăng độ bảo mật
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // Hàm kiểm tra mật khẩu (Dùng khi Đăng nhập)
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        // So sánh mật khẩu người dùng nhập với chuỗi đã mã hóa trong CSDL
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}