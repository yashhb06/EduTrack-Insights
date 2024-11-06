<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Create Assignment</title>
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
        .form-section {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .form-control, .form-select {
            margin-bottom: 15px;
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
            <h2>Create Assignment</h2>
            <div class="form-section mt-4">
                <form id="create-assignment-form" method="post" action="createAssignment.jsp">
                    <div class="form-group">
                        <label for="assignmentTitle">Assignment Title</label>
                        <input type="text" class="form-control" id="assignmentTitle" name="assignmentTitle" placeholder="Enter assignment title" required>
                    </div>
                    <div class="form-group">
                        <label for="assignmentDescription">Description</label>
                        <textarea class="form-control" id="assignmentDescription" name="assignmentDescription" rows="4" placeholder="Enter assignment description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="dueDate">Due Date</label>
                        <input type="date" class="form-control" id="dueDate" name="dueDate" required>
                    </div>
                    <div class="form-group">
                        <label for="attachment">Attach File</label>
                        <input type="file" class="form-control-file" id="attachment" name="attachment">
                    </div>
                    <button type="submit" class="btn btn-success">Create Assignment</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Form submission logic
        document.getElementById('create-assignment-form').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent default form submission

            // Capture form data
            const title = document.getElementById('assignmentTitle').value;
            const description = document.getElementById('assignmentDescription').value;
            const dueDate = document.getElementById('dueDate').value;
            const attachment = document.getElementById('attachment').files[0];

            // Here, you can handle the data (e.g., send it to the server or save it locally)
            alert(`Assignment Created!\nTitle: ${title}\nDescription: ${description}\nDue Date: ${dueDate}\nAttachment: ${attachment ? attachment.name : 'None'}`);
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
