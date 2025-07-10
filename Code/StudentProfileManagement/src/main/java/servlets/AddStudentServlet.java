package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import dao.StudentDao;
import model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        int age = Integer.parseInt(request.getParameter("age"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
            		 "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");
            
            Student student = new Student(name, email, course, age);
            StudentDao dao = new StudentDao(conn);

            boolean status = dao.addStudent(student);

            if (status) {
                response.sendRedirect("home.jsp?msg=student_added");
            } else {
                response.sendRedirect("addStudent.jsp?msg=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addStudent.jsp?msg=error");
        }
    }
}
