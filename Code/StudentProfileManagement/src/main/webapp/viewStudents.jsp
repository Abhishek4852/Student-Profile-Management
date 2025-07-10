<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.StudentDao, model.Student, java.sql.*" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    List<Student> students = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://sql12.freesqldatabase.com/sql12788808", "sql12788808", "g5gSmUQiFx");
        StudentDao dao = new StudentDao(conn);
        students = dao.getAllStudents();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Students | Student Profile Management</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme styling -->
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 60px;
        }

        .card {
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-3px);
        }

        .table thead th {
            background-color: #0d6efd;
            color: white;
        }

        .page-wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }
    </style>
</head>
<body>
<div class="page-wrapper">

    <!-- navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Main content -->
    <main class="container my-4">
        <div class="card">
            <h3 class="text-center text-primary mb-4">📋 All Registered Students</h3>

            <% if (students.isEmpty()) { %>
                <p class="text-center text-danger fw-bold">No student records found.</p>
            <% } else { %>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped align-middle text-center">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Course</th>
                                <th>Age</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (Student s : students) {
                            %>
                            <tr>
                                <td><%= count++ %></td>
                                <td><%= s.getName() %></td>
                                <td><%= s.getEmail() %></td>
                                <td><%= s.getCourse() %></td>
                                <td><%= s.getAge() %></td>
                                <td>
                                    <a href="editStudent?id=<%= s.getId() %>" class="btn btn-sm btn-warning">✏️ Edit</a>
                                    <a href="deleteStudent?id=<%= s.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this student?');">🗑 Delete</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>

            <div class="text-center mt-4">
                <a href="home.jsp" class="btn btn-secondary">⬅ Back to Home</a>
            </div>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="footer.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
