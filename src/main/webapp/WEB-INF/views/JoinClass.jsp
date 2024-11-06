<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack Insights - Join/Create Classes</title>
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
        }
        h2 {
            color: #343a40;
        }
        .chart-container {
            width: 100%;
            margin-top: 20px;
        }
        canvas {
            max-width: 100%;
        }
        .hidden {
            display: none;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .team-list {
            margin-top: 30px;
        }
        .team-list ul {
            max-height: 300px;
            overflow-y: auto;
        }
        .team-list li {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            margin-bottom: 10px;
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
            <a href="Classes.jsp">Classes</a>
            <a href="JoinClass.jsp">Join/Create Classes</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Join or Create Classes</h2>

            <!-- Join Class Section -->
            <div class="form-section">
                <h4>Join an Existing Class</h4>
                <form action="JoinClassServlet" method="post">
                    <div class="form-group">
                        <label for="classCode">Enter Class Code:</label>
                        <input type="text" class="form-control" id="classCode" name="classCode" placeholder="Enter class code here">
                    </div>
                    <button type="submit" class="btn btn-primary submit-btn">Join Class</button>
                </form>
            </div>

            <!-- Create Class Section -->
            <div class="form-section">
                <h4>Create a New Class</h4>
                <form action="CreateClassServlet" method="post">
                    <div class="form-group">
                        <label for="className">Class Name:</label>
                        <input type="text" class="form-control" id="className" name="className" placeholder="Enter class name">
                    </div>
                    <div class="form-group">
                        <label for="classDescription">Class Description:</label>
                        <textarea class="form-control" id="classDescription" name="classDescription" rows="3" placeholder="Enter class description"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="classType">Class Type:</label>
                        <select class="form-control" id="classType" name="classType">
                            <option value="project">Project-Based</option>
                            <option value="lecture">Lecture-Based</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success submit-btn">Create Class</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
