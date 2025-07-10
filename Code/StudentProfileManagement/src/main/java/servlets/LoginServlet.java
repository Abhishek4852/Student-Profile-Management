package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Get form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to MySQL database (change credentials if needed)
            Connection conn = DriverManager.getConnection(
            		 "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");

            // Use UserDao to authenticate
            UserDao dao = new UserDao(conn);
            String name = dao.authenticateUser(email, password);

            if (name != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", name); // store name instead of email
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("index.jsp?error=1"); // invalid login
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=2"); // internal error
        }
    }
}
