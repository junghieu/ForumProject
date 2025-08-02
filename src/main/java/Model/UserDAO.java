package Model;

import java.sql.*;

public class UserDAO {
    private Connection conn;

    public UserDAO() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/forumdb", "root", "");
    }

    public boolean checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        return rs.next();
    }
}
