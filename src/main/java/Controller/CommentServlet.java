package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Model.CommentDAO;
import Model.Comment;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra người dùng đã đăng nhập chưa
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy dữ liệu từ form
        String postIdStr = request.getParameter("postId");
        String content = request.getParameter("content");
        String username = (String) session.getAttribute("username");

        // Kiểm tra dữ liệu đầu vào
        if (postIdStr == null || content == null || content.trim().isEmpty()) {
            response.sendRedirect("post_detail.jsp?postId=" + postIdStr); // hoặc báo lỗi
            return;
        }

        int postId = Integer.parseInt(postIdStr);

        // Tạo comment và lưu
        Comment comment = new Comment(postId, username, content);
        CommentDAO.addComment(comment);

        // Chuyển hướng về lại trang bài viết
        response.sendRedirect("post_detail.jsp?postId=" + postId);
    }

    // Nếu cần có GET (không bắt buộc):
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home.jsp");
    }
}
