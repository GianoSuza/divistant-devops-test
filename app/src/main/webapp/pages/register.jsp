<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4">Create Account</h2>

                        <% if (request.getAttribute("message") != null) { %>
                            <div class="alert alert-success text-center" role="alert">
                                ${message}
                            </div>
                        <% } %>

                        <form method="post" action="register">
                            <div class="mb-3">
                                <label class="form-label">First Name</label>
                                <input type="text" name="firstName" class="form-control" placeholder="Enter first name" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Last Name</label>
                                <input type="text" name="lastName" class="form-control" placeholder="Enter last name" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Enter email address" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">User Name</label>
                                <input type="text" name="userName" class="form-control" placeholder="Choose a username" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Register</button>
                                <button type="reset" class="btn btn-outline-secondary">Reset</button>
                            </div>

                            <div class="text-center mt-4">
                                <span class="text-muted">Already registered?</span>
                                <a href="login" class="text-decoration-none">Login Here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>