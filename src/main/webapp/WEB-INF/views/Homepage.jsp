<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack Insights</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }
        .navbar {
            background-color: #6ba748;
        }
        .navbar-brand, .nav-link {
            color: white;
        }
        .navbar-brand:hover, .nav-link:hover {
            color: #ddd;
        }
        .hero {
            background-color: #6ba748;
            color: white;
            padding: 60px 20px;
            text-align: center;
        }
        .hero h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.2em;
        }
        .features {
            padding: 40px 20px;
        }
        .feature-card {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">EduTrack Insights</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Homepage.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login/Sign Up</a> <!-- Link updated to point to login.jsp -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">FAQ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to EduTrack Insights!</h1>
        <p>Your one-stop solution for tracking student progress and insights.</p>
        <a href="login.jsp" class="btn btn-light btn-lg">Get Started</a> <!-- Link updated to point to login.jsp -->
    </div>

    <!-- Features Section -->
    <div class="features container">
        <h2 class="text-center">Features</h2>
        <div class="row">
            <div class="col-md-4 feature-card">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Track Progress</h5>
                        <p class="card-text">Easily monitor and analyze student performance over time.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 feature-card">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Automated Grading</h5>
                        <p class="card-text">Simplify grading with automated tools and feedback.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 feature-card">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Insights & Reports</h5>
                        <p class="card-text">Generate insightful reports for teachers and students.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
