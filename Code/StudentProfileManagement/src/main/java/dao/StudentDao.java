package dao;

import model.Student;
import java.sql.*;
import java.util.*;

public class StudentDao {
    private Connection conn;

    public StudentDao(Connection conn) {
        this.conn = conn;
    }

    public boolean addStudent(Student s) {
        try {
            // Create table if not exists
            String createTable = "CREATE TABLE IF NOT EXISTS students ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY,"
                    + "name VARCHAR(100),"
                    + "email VARCHAR(100),"
                    + "course VARCHAR(100),"
                    + "age INT)";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(createTable);

            // Insert data
            String query = "INSERT INTO students(name, email, course, age) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getCourse());
            ps.setInt(4, s.getAge());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM students";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student s = new Student(
                	rs.getInt("id"),   
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("course"),
                    rs.getInt("age")
                );
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Student getStudentById(int id) {
        Student s = null;
        try {
            String sql = "SELECT * FROM students WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Student(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("course"),
                    rs.getInt("age")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public boolean updateStudent(Student s) {
        boolean status = false;
        try {
            String sql = "UPDATE students SET name=?, email=?, course=?, age=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getCourse());
            ps.setInt(4, s.getAge());
            ps.setInt(5, s.getId());

            int rows = ps.executeUpdate();
            status = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public boolean deleteStudent(int id) {
        boolean status = false;
        try {
            String sql = "DELETE FROM students WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int rows = ps.executeUpdate();
            status = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    
    
}
