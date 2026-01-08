package vn.edu.nlu.fit.backend.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContextT {

    private final String serverName = "localhost";
    private final String dbName = "LTW";
    private final String portNumber = "3306";
    private final String userID = "root";
    private final String password = "";

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }
    public static void main(String[] args) {
        try {
            System.out.println(new DBContextT().getConnection());
            System.out.println("Kết nối CSDL thành công!");
        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }
    }
}