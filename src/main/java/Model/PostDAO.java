package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Post;
import Util.DBConnection;

public class PostDAO {

    // Lấy danh sách tất cả bài viết
    public static List<Post> getAllPosts() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("username")
                );
                posts.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }

    // Tìm bài viết theo ID
    public static Post getPostById(int id) {
        String sql = "SELECT * FROM posts WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("username")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Thêm bài viết mới
    public static boolean createPost(Post post) {
        String sql = "INSERT INTO posts (title, content, username) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setString(3, post.getUsername());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // (Tùy chọn) Lấy ID bài viết mới nhất
    public static int getLastPostId() {
        String sql = "SELECT MAX(id) AS max_id FROM posts";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("max_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }
}
