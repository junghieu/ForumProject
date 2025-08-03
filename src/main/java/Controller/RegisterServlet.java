package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Model.UserDAO;
import Model.User;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra input
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ tên và mật khẩu.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra trùng tài khoản
        if (UserDAO.getUserByUsername(username) != null) {
            request.setAttribute("errorMessage", "Tên người dùng đã tồn tại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Mã hóa mật khẩu
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Tạo user mới và lưu
        User newUser = new User(username, hashedPassword);
        boolean success = UserDAO.register(newUser);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
