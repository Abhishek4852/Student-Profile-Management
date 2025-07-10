<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student | Student Profile Management</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            margin-top: 60px;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-4px);
        }

        .page-wrapper {
            min-height: 100vh;
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

    <!-- Main content -->
    <main class="container my-4">
        <div class="container col-md-5 form-container">
            <h3 class="text-center text-primary mb-4">➕ Add New Student</h3>

            <form action="addStudent" method="post">
                <div class="mb-3">
                    <label class="form-label">Name:</label>
                    <input type="text" name="name" class="form-control" required />
                </div>
                <div class="mb-3">
                    <label class="form-label">Email:</label>
                    <input type="email" name="email" class="form-control" required />
                </div>
                <div class="mb-3">
                    <label class="form-label">Course:</label>
                    <input type="text" name="course" class="form-control" required />
                </div>
                <div class="mb-3">
                    <label class="form-label">Age:</label>
                    <input type="number" name="age" class="form-control" required />
                </div>

                <button type="submit" class="btn btn-success w-100">Add Student</button>
            </form>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="footer.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
