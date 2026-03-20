<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-5 col-lg-4">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4">Login</h2>

                        <% if (request.getAttribute("errorMessage") != null && !request.getAttribute("errorMessage").toString().isEmpty()) { %>
                            <div class="alert alert-danger text-center" role="alert">
                                ${errorMessage}
                            </div>
                        <% } %>

                        <form method="post" action="login">
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input type="text" name="userName" class="form-control" placeholder="Enter username" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Login</button>
                                <button type="reset" class="btn btn-outline-secondary">Reset</button>
                            </div>

                            <div class="text-center mt-4">
                                <span class="text-muted">New user?</span>
                                <a href="register" class="text-decoration-none">Register Here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>