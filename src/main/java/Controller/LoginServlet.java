package Controller;

import Model.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            UserDAO dao = new UserDAO();
            if (dao.checkLogin(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
}
