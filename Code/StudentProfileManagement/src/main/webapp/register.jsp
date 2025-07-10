<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register | Student Profile Management</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .register-container {
            margin-top: 80px;
        }

        .card {
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-3px);
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
    <main class="container my-0 mb-3">
        <div class="container register-container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <!-- Card -->
                    <div class="card p-4">
                        <h3 class="text-center text-primary mb-3">Student Profile Management</h3>
                        <h5 class="text-center mb-4">Create Account</h5>

                        <form action="register" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Full Name:</label>
                                <input type="text" class="form-control" name="name" id="name" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address:</label>
                                <input type="email" class="form-control" name="email" id="email" required>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary rounded">Register</button>
                            </div>

                            <div class="mt-3 text-center">
                                <p>Already have an account? <a href="index.jsp">Login Here</a></p>
                            </div>

                            <% String msg = request.getParameter("msg");
                               if ("exists".equals(msg)) {
                            %>
                                <div class="alert alert-danger mt-2 text-center">
                                    Email already registered!
                                </div>
                            <% } else if ("success".equals(msg)) { %>
                                <div class="alert alert-success mt-2 text-center">
                                    Registered successfully! Please login.
                                </div>
                            <% } %>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="footer.jsp" />

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
