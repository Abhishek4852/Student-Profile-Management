
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Navbar Styling -->
<style>
  body {
    padding-top: 70px; /* Prevent content from hiding under the navbar */
  }
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="home.jsp">SPM</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="addStudent.jsp">Add Student</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewStudents.jsp">View Students</a>
        </li>
        <li class="nav-item">
          <a class="nav-link btn btn-sm btn-danger text-white ms-2" href="logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
