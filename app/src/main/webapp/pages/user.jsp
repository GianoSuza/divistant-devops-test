<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome to iwayQ Technology</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container py-5">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <h1 class="text-primary fw-bold">iwayQ.com | Instant Information Site</h1>
                    <p class="text-muted mt-3 mb-0">Welcome, <strong>${username}</strong></p>
                </div>

                <div class="row g-3 mt-4">
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com" class="btn btn-primary w-100">Home</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/gallery/gallery.html" class="btn btn-outline-primary w-100">Gallery</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/videos/videos.html" class="btn btn-outline-primary w-100">Videos</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/videos/videos.html" class="btn btn-outline-primary w-100">Articles</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/videos/videos.html" class="btn btn-outline-success w-100">Tutorials</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/videos/videos.html" class="btn btn-outline-success w-100">Assessment</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/videos/videos.html" class="btn btn-outline-warning w-100">Poll &amp; Survey</a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="http://www.iwayq.com/videos/videos.html" class="btn btn-outline-dark w-100">Chat</a>
                    </div>
                </div>

                <div class="text-center mt-5">
                    <a href="login" class="btn btn-link text-decoration-none">Back to Login</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>