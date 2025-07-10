package servlets;

import dao.StudentDao;
import model.Student;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        int age = Integer.parseInt(request.getParameter("age"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");

            Student student = new Student(id, name, email, course, age);
            StudentDao dao = new StudentDao(conn);
            boolean updated = dao.updateStudent(student);

            if (updated) {
                response.sendRedirect("viewStudents.jsp");
            } else {
                response.sendRedirect("editStudent.jsp?id=" + id + "&error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewStudents.jsp");
        }
    }
}
