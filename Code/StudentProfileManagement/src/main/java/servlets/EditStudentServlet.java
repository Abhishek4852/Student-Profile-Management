package servlets;

import dao.StudentDao;
import model.Student;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editStudent")
public class EditStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");


            StudentDao dao = new StudentDao(conn);
            Student student = dao.getStudentById(id);

            request.setAttribute("student", student);
            request.getRequestDispatcher("editStudent.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewStudents.jsp");
        }
    }
}
