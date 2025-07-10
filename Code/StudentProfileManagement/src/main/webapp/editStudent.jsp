<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
    if (student == null) {
        response.sendRedirect("viewStudents.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student | Student Profile Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            border-radius: 15px;
            padding: 25px;
            background-color: #ffffff;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #dee2e6;
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-3px);
        }

        .container {
            margin-top: 60px;
        }

        html, body {
            height: 100%;
        }

        .page-wrapper {
            min-height: 100%;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }

        label {
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="page-wrapper">

    <!-- navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- ✅ Main content -->
    <main class="container my-4">
        <div class="card col-md-6 offset-md-3">
            <h3 class="text-center text-primary mb-4">✏️ Edit Student</h3>
            <form action="updateStudent" method="post">

                <!-- Hidden ID -->
                <input type="hidden" name="id" value="<%= student.getId()%>">

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" value="<%= student.getName() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="<%= student.getEmail() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Course</label>
                    <input type="text" name="course" class="form-control" value="<%= student.getCourse() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Age</label>
                    <input type="number" name="age" class="form-control" value="<%= student.getAge() %>" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-warning">Update Student</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <a href="viewStudents.jsp" class="btn btn-secondary">⬅ Back</a>
            </div>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="footer.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
