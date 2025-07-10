package servlets;

import dao.StudentDao;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            // Load JDBC driver and connect
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");

            // DAO call to delete
            StudentDao dao = new StudentDao(conn);
            boolean deleted = dao.deleteStudent(id);

            if (deleted) {
                response.sendRedirect("viewStudents.jsp");
            } else {
                response.sendRedirect("viewStudents.jsp?error=deleteFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewStudents.jsp?error=exception");
        }
    }
}
