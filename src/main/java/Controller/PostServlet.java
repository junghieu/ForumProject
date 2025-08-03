package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Model.PostDAO;
import Model.Post;

@WebServlet("/post")
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // GET: hiển thị danh sách bài viết (home.jsp)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Post> posts = PostDAO.getAllPosts();
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    // POST: xử lý đăng bài viết mới
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Kiểm tra input
        if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Tiêu đề và nội dung không được để trống.");
            request.getRequestDispatcher("new_post.jsp").forward(request, response);
            return;
        }

        // Tạo bài viết mới
        Post post = new Post(title, content, username);
        PostDAO.createPost(post);

        // Chuyển về trang bài viết chi tiết
        int postId = PostDAO.getLastPostId(); // hoặc trả ID từ createPost
        response.sendRedirect("post_detail.jsp?postId=" + postId);
    }
}
