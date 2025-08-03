package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Comment;
import Util.DBConnection;

public class CommentDAO {

    // Thêm một bình luận mới
    public static boolean addComment(Comment comment) {
        String sql = "INSERT INTO comments (postId, username, content) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, comment.getPostId());
            stmt.setString(2, comment.getUsername());
            stmt.setString(3, comment.getContent());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy danh sách bình luận theo postId
    public static List<Comment> getCommentsByPostId(int postId) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE postId = ? ORDER BY id ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment(
                        rs.getInt("id"),
                        rs.getInt("postId"),
                        rs.getString("username"),
                        rs.getString("content")
                );
                comments.add(comment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return comments;
    }
}
