package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    static {
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                com.mysql.cj.jdbc.AbandonedConnectionCleanupThread.checkedShutdown();
            } catch (Exception e) {
                System.err.println("Lỗi khi cleanup JDBC thread:");
                e.printStackTrace();
            }
        }));
    }

    private static final String URL = "jdbc:mysql://localhost:3306/forumdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Không thể kết nối CSDL:");
            e.printStackTrace();
            return null;
        }
    }
}
