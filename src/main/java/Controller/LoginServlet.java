package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Model.UserDAO;
import Model.User;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra đầu vào
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ tên và mật khẩu.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Lấy user từ DB
        User user = UserDAO.getUserByUsername(username);

        boolean isAuthenticated = false;

        if (user != null) {
            String hashedPassword = user.getPassword(); // Lưu ý: password đã hash
            isAuthenticated = BCrypt.checkpw(password, hashedPassword);
        }

        if (isAuthenticated) {
            HttpSession session = request.getSession();
            session.invalidate(); // Xóa session cũ
            session = request.getSession(true); // Tạo session mới
            session.setAttribute("username", username);
            session.setAttribute("loggedIn", true);
            response.sendRedirect("home.jsp"); // hoặc "/post" tùy luồng chính
        } else {
            request.setAttribute("errorMessage", "Sai tên người dùng hoặc mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
