<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Student Profile Management</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Modern & attractive custom styles -->
    <style>
        body {
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            display: flex;
            flex-direction: column;
        }

        .page-wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
        }

        .login-container {
            margin-top: 80px;
        }

        .card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.15rem rgba(0, 123, 255, 0.25);
        }
    </style>
</head>
<body>

<div class="page-wrapper">

    <!-- ✅ Navbar include -->
    <%@ include file="navbar.jsp" %>

    <!-- ✅ Main login form -->
    <main class="container login-container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <h3 class="text-center text-primary mb-2">Student Profile Management</h3>
                    <h5 class="text-center mb-4">🔐 Login</h5>

                    <form action="login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>

                        <div class="mt-3 text-center">
                            <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
                        </div>

                        <% String error = request.getParameter("error");
                           if ("1".equals(error)) { %>
                           <div class="alert alert-danger text-center mt-2">
                               Invalid email or password.
                           </div>
                        <% } %>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- ✅ Footer include -->
    <jsp:include page="footer.jsp" />
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
