<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Teacher's Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>EduTrack Insights</h2>
            <a href="teacher.jsp">Home</a>
            <a href="Profile.jsp">Profile</a>
            <a href="Classes.jsp">Classes</a>
            <a href="JoinClass.jsp">Join/Create Classes</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Teacher Dashboard - Class Analytics & Create Teams</h2>

            <!-- Class Selection Dropdown -->
            <div class="form-group">
                <label for="classSelect">Select Class:</label>
                <select id="classSelect" class="form-control" onchange="updateClassAnalytics()">
                    <option value="">Select a class</option>
                    <option value="Class 1">Class 1</option>
                    <option value="Class 2">Class 2</option>
                    <option value="Class 3">Class 3</option>
                </select>
            </div>

            <!-- Analytics Section -->
            <div class="chart-container mt-5 hidden" id="analyticsSection">
                <h3>Class Analytics</h3>
                <canvas id="averageScoreChart"></canvas> <!-- Average Score Chart -->
                <canvas id="overallPerformanceChart" class="mt-4"></canvas> <!-- Overall Performance Line Chart -->
            </div>

            <!-- Button to Show Create Team Section -->
            <button class="btn btn-primary mt-4" id="createTeamBtn" onclick="toggleTeamCreation()">Create Teams</button>

            <!-- Team Creation Section (hidden initially) -->
            <div class="team-container hidden" id="teamCreationSection">
                <h3>Create Student Teams</h3>
                <label for="projectName">Enter Project Name:</label>
                <input type="text" id="projectName" placeholder="Enter project name" class="form-control">

                <label for="studentSelect">Select Students:</label>
                <div id="studentList" class="form-group">
                    <label><input type="checkbox" onchange="selectAllStudents(this)"> Select All</label><br>
                    <label><input type="checkbox" class="student-checkbox" value="Student 1"> Student 1</label><br>
                    <label><input type="checkbox" class="student-checkbox" value="Student 2"> Student 2</label><br>
                    <label><input type="checkbox" class="student-checkbox" value="Student 3"> Student 3</label><br>
                    <label><input type="checkbox" class="student-checkbox" value="Student 4"> Student 4</label><br>
                    <label><input type="checkbox" class="student-checkbox" value="Student 5"> Student 5</label><br>
                </div>

                <!-- Add Team Button -->
                <button class="btn btn-success mt-3" onclick="createTeam()">Create Team</button>
            </div>

            <!-- List of Created Teams -->
            <div class="team-list mt-4">
                <h3>Created Teams</h3>
                <ul id="teamList" class="list-group">
                    <!-- Dynamically filled with created teams -->
                </ul>
            </div>
        </div>
    </div>

    <script>
        // Mock data for class performance and average scores
        const classPerformanceData = {
            'Class 1': [85, 90, 78, 92, 88],
            'Class 2': [75, 80, 70, 85, 90],
            'Class 3': [80, 82, 86, 89, 91]
        };
        const studentNames = ['Student 1', 'Student 2', 'Student 3', 'Student 4', 'Student 5'];
        const averageScores = {
            'Class 1': [16, 18, 15, 19, 17], // Average scores for each student
            'Class 2': [12, 14, 11, 15, 16],
            'Class 3': [14, 15, 18, 17, 19]
        };
        const labels = ['Test 1', 'Test 2', 'Test 3', 'Test 4', 'Test 5'];
        let averageScoreChart;
        let overallPerformanceChart;

        // Function to update class analytics
        function updateClassAnalytics() {
            const selectedClass = document.getElementById('classSelect').value;
            if (selectedClass) {
                const ctx1 = document.getElementById('averageScoreChart').getContext('2d');
                const ctx2 = document.getElementById('overallPerformanceChart').getContext('2d');

                if (averageScoreChart) {
                    averageScoreChart.destroy(); // Clear existing average score chart if it exists
                }
                if (overallPerformanceChart) {
                    overallPerformanceChart.destroy(); // Clear existing overall performance chart if it exists
                }

                // Average score chart
                averageScoreChart = new Chart(ctx1, {
                    type: 'bar',
                    data: {
                        labels: studentNames,
                        datasets: [{
                            label: 'Average Scores',
                            data: averageScores[selectedClass],
                            backgroundColor: '#007bff',
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Average Score'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Students'
                                }
                            }
                        }
                    }
                });

                // Overall performance line chart
                overallPerformanceChart = new Chart(ctx2, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: selectedClass,
                            data: classPerformanceData[selectedClass],
                            borderColor: '#FF5733',
                            fill: false
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Scores'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Tests'
                                }
                            }
                        }
                    }
                });

                // Show analytics section
                document.getElementById('analyticsSection').classList.remove('hidden');
            }
        }

        // Function to toggle team creation section
        function toggleTeamCreation() {
            const teamCreationSection = document.getElementById('teamCreationSection');
            teamCreationSection.classList.toggle('hidden');
        }

        // Function to create team
        function createTeam() {
            const projectName = document.getElementById('projectName').value;
            const selectedStudents = Array.from(document.querySelectorAll('.student-checkbox:checked')).map(checkbox => checkbox.value);
            if (projectName && selectedStudents.length > 0) {
                const teamList = document.getElementById('teamList');
                const teamItem = document.createElement('li');
                teamItem.className = 'list-group-item';
                teamItem.textContent = `${projectName}: ${selectedStudents.join(', ')}`;
                teamList.appendChild(teamItem);
                document.getElementById('projectName').value = ''; // Clear input
                document.querySelectorAll('.student-checkbox').forEach(checkbox => checkbox.checked = false); // Clear checkboxes
            } else {
                alert('Please enter a project name and select at least one student.');
            }
        }

        // Function to select all students
        function selectAllStudents(checkbox) {
            const checkboxes = document.querySelectorAll('.student-checkbox');
            checkboxes.forEach(stuCheckbox => stuCheckbox.checked = checkbox.checked);
        }
    </script>

</body>
</html>
