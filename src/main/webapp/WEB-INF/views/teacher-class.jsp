<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Teacher Class Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }
        .d-flex {
            display: flex;
            align-items: flex-start; /* Align items to the start of the container */
        }
        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            background-color: #6ba748;
            padding: 20px;
            color: #ffffff;
            overflow-y: auto;
        }
        .sidebar h2, .sidebar a {
            color: #ffffff;
            margin-bottom: 20px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            color: #ddd;
        }
        .content {
            margin-left: 270px; /* Account for the sidebar width */
            padding: 40px;
            flex-grow: 1;
        }
        h2 {
            color: #343a40;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="d-flex">
        <div class="sidebar">
            <h2 class="text-white">EduTrack Insights</h2>
            <a href="teacher.jsp">Home</a>
            <a href="Profile.jsp">Profile</a>
            <a href="Classes.jsp">Classes</a>
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

                <!-- Assignment Cards with Submissions List -->
                <div class="assignment-card">
                    <h5>Homework 1</h5>
                    <p>Due Date: <strong>October 25, 2024</strong></p>
                    <button class="btn btn-info assignment-btn" onclick="toggleSubmissions('homework1')">View Submissions</button>
                    <button class="btn btn-danger assignment-btn" onclick="deleteAssignment()">Delete Assignment</button>
                    
                    <!-- Submissions List for Homework 1 -->
                    <div id="homework1" class="submission-list" style="display:none;">
                        <div class="submission-card">
                            <h6>John Doe</h6>
                            <p>Uploaded on: <strong>October 22, 2024</strong></p>
                            <button class="btn btn-primary submission-btn">View Submission</button>
                            <button class="btn btn-success submission-btn" data-toggle="modal" data-target="#gradeModal">Grade</button>
                        </div>
                        <div class="submission-card">
                            <h6>Jane Smith</h6>
                            <p>Uploaded on: <strong>October 23, 2024</strong></p>
                            <button class="btn btn-primary submission-btn">View Submission</button>
                            <button class="btn btn-success submission-btn" data-toggle="modal" data-target="#gradeModal">Grade</button>
                        </div>
                        <div class="submission-card">
                            <h6>Michael Brown</h6>
                            <p>Uploaded on: <strong>October 24, 2024</strong></p>
                            <button class="btn btn-primary submission-btn">View Submission</button>
                            <button class="btn btn-success submission-btn" data-toggle="modal" data-target="#gradeModal">Grade</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Grade Modal -->
    <div class="modal fade" id="gradeModal" tabindex="-1" aria-labelledby="gradeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="gradeModalLabel">Grade Submission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="gradeForm">
                        <div class="form-group">
                            <label for="gradeInput">Grade (1-10)</label>
                            <input type="number" class="form-control" id="gradeInput" min="1" max="10" required>
                        </div>
                        <div class="form-group">
                            <label for="feedbackInput">Feedback</label>
                            <textarea class="form-control" id="feedbackInput" rows="3" placeholder="Enter feedback..."></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-success" onclick="submitGrade()">Submit Grade</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function getClassFromURL() {
            const params = new URLSearchParams(window.location.search);
            const className = params.get('class');
            document.getElementById('class-name').innerText = "Class Name: " + className.replace(/([A-Z])/g, ' $1').trim();
        }

        window.onload = getClassFromURL;

        function toggleSubmissions(id) {
            const submissionList = document.getElementById(id);
            submissionList.style.display = submissionList.style.display === "none" ? "block" : "none";
        }

        function deleteAssignment() {
            alert('Assignment deleted successfully.');
        }

        function submitGrade() {
            const grade = document.getElementById('gradeInput').value;
            const feedback = document.getElementById('feedbackInput').value;

            if (grade) {
                alert(`Grade: ${grade}\nFeedback: ${feedback}`);
                $('#gradeModal').modal('hide');
                document.getElementById('gradeForm').reset();
            } else {
                alert('Please enter a valid grade.');
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
