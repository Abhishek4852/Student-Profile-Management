package servlets;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import model.User;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Get form data from request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the MySQL database
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");

            System.out.println(" connection id is "+conn);
            
            
            // ✅ Create users table if it doesn't exist
            String createTableSQL = "CREATE TABLE IF NOT EXISTS users ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY,"
                    + "name VARCHAR(100),"
                    + "email VARCHAR(100) UNIQUE,"
                    + "password VARCHAR(100))";
            


            java.sql.Statement stmt = conn.createStatement();
            stmt.executeUpdate(createTableSQL);

            // Create a User object with form data
            User user = new User(name, email, password);

            // Use UserDao to register user
            UserDao dao = new UserDao(conn);
            boolean status = dao.registerUser(user);

            // Redirect based on registration result
            if (status) {
                response.sendRedirect("register.jsp?msg=success");
            } else {
                response.sendRedirect("register.jsp?msg=exists");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=error");
        }
    }
}
