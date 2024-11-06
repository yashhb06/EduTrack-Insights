<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Classes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }
        .d-flex {
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #6ba748;
            padding: 20px;
            min-height: 100vh;
        }
        .sidebar h2, .sidebar a {
            color: #ffffff;
            margin-bottom: 20px;
        }
        .sidebar a {
            display: block;
            text-decoration: none;
            transition: color 0.3s;
        }
        .sidebar a:hover {
            color: #ddd;
        }
        .content {
            padding: 40px;
            flex-grow: 1;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h3 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #4CAF50;
        }
        .class-list {
            list-style-type: none;
            padding: 0;
        }
        .class-list li {
            padding: 15px;
            background: linear-gradient(90deg, #6ba748 0%, #5a9440 100%);
            margin-bottom: 15px;
            color: white;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            transition: background 0.3s, transform 0.2s;
        }
        .class-list li:hover {
            background: linear-gradient(90deg, #5a9440 0%, #4b8a3d 100%);
            cursor: pointer;
            transform: translateY(-2px);
        }
        .class-list li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
            .content {
                padding: 20px;
            }
            .class-list li {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="d-flex">
        <div class="sidebar">
            <h2 class="text-white">EduTrack Insights</h2>
            <a href="dashboard.jsp">Home</a>
            <a href="profile.jsp">Profile</a>
            <a href="classes.jsp">Classes</a>
            <a href="JoinClass.jsp">Join/Create Classes</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h3>List of Classes</h3>
            <ul class="class-list">
                <li><a href="class-details.jsp?class=Mathematics101">Mathematics 101</a></li>
                <li><a href="class-details.jsp?class=Science102">Science 102</a></li>
                <li><a href="class-details.jsp?class=History103">History 103</a></li>
                <li><a href="class-details.jsp?class=ComputerScience104">Computer Science 104</a></li>
            </ul>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
