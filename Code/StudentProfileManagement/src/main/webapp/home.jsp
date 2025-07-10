<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("index.jsp"); // Redirect to login if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Student Profile Management</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .dashboard-container {
            margin-top: 80px;
        }

        .card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            transition: transform 0.3s ease;
            border: 1px solid #dee2e6;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .btn {
            font-weight: 500;
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

    <%@ include file="navbar.jsp" %>

    <main class="container my-4">
        <div class="container dashboard-container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card text-center">
                        <h3 class="text-primary mb-3">Welcome to Student Profile Management</h3>
                        <h5 class="mb-4">Hello, <%= user %> 👋</h5>

                        <div class="d-grid gap-3 col-6 mx-auto">
                            <a href="addStudent.jsp" class="btn btn-success">➕ Add New Student</a>
                            <a href="viewStudents.jsp" class="btn btn-info text-white">📋 View All Students</a>
                            <a href="logout" class="btn btn-danger">🚪 Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
