<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Class Details</title>
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
        .class-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .assignment-card {
            background-color: #ffffff;
            border: 1px solid #e2e2e2;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }
        .assignment-card:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }
        .assignment-btn {
            margin-top: 10px;
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
            <div class="class-header">
                <h2 id="class-name">Class Name: </h2>
            </div>

            <!-- Assignments Section -->
            <div class="form-section mt-4">
                <h4>Assignments</h4>

                <!-- Tab navigation for Assigned and Submitted -->
                <ul class="nav nav-tabs" id="assignmentTabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="assigned-tab" data-toggle="tab" href="#assigned" role="tab">Assigned</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="submitted-tab" data-toggle="tab" href="#submitted" role="tab">Submitted</a>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content mt-4" id="assignmentTabsContent">
                    <!-- Assigned Tab -->
                    <div class="tab-pane fade show active" id="assigned" role="tabpanel" aria-labelledby="assigned-tab">
                        <div class="assignment-card">
                            <h5>Homework 1</h5>
                            <p>Due Date: <strong>October 25, 2024</strong></p>
                            <button class="btn btn-primary assignment-btn">Upload Submission</button>
                        </div>
                        <div class="assignment-card">
                            <h5>Project Proposal</h5>
                            <p>Due Date: <strong>November 5, 2024</strong></p>
                            <button class="btn btn-primary assignment-btn">Upload Submission</button>
                        </div>
                    </div>

                    <!-- Submitted Tab -->
                    <div class="tab-pane fade" id="submitted" role="tabpanel" aria-labelledby="submitted-tab">
                        <div class="assignment-card">
                            <h5>Midterm Exam</h5>
                            <p>Submitted on: <strong>October 20, 2024</strong></p>
                            <button class="btn btn-primary assignment-btn" data-toggle="modal" data-target="#feedbackMidtermExam">View Feedback</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Feedback Modals -->
            <div class="modal fade" id="feedbackMidtermExam" tabindex="-1" role="dialog" aria-labelledby="feedbackMidtermExamLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="feedbackMidtermExamLabel">Midterm Exam Feedback</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p><strong>Points:</strong> 7/10</p>
                            <p><strong>Feedback:</strong> Good work, but review chapters 3 and 4 for better clarity on complex topics.</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script>
        // Get the class from URL parameter and display
        function getClassFromURL() {
            const params = new URLSearchParams(window.location.search);
            const className = params.get('class');
            document.getElementById('class-name').innerText = "Class Name: " + className.replace(/([A-Z])/g, ' $1').trim();
        }

        // Call the function on page load
        window.onload = getClassFromURL;
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
