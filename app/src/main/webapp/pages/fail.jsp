<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Failed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-lg border-0 rounded-4 text-center">
                    <div class="card-body p-5">
                        <h2 class="text-danger fw-bold mb-3">Login Failed</h2>
                        <p class="text-muted mb-4">
                            The username or password you entered is incorrect.
                        </p>
                        <a href="login" class="btn btn-primary px-4">Try Again</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>