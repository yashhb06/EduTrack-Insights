<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Shared Resources</title>
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
        .resource-item {
            background-color: #ffffff;
            border: 1px solid #e2e2e2;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .resource-link {
            text-decoration: none;
            color: #007bff;
        }
        .resource-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="d-flex">
        <div class="sidebar">
            <h2 class="text-white">EduTrack Insights</h2>
            <a href="dashboard.jsp">Home</a>
            <a href="profile.jsp">Profile</a>
            <a href="classes.jsp">Classes</a>
            <a href="JoinClass.jsp">Join/Create Classes</a>
            <a href="class-details.jsp">Class Details</a>
            <a href="team.jsp">Team Management</a>
        </div>

        <div class="content">
            <h2>Shared Resources</h2>
            <div class="mt-4">
                <h4>Upload New Resource</h4>
                <input type="file" id="file-input" class="form-control-file mb-2">
                <button class="btn btn-success" onclick="uploadFile()">Upload File</button>
            </div>
            <div class="resource-list mt-4" id="resource-list">
                <h4>Available Resources</h4>
                <div class="resource-item">
                    <h5>Document 1</h5>
                    <p><a href="#" class="resource-link">View Document 1</a></p>
                </div>
                <div class="resource-item">
                    <h5>Document 2</h5>
                    <p><a href="#" class="resource-link">View Document 2</a></p>
                </div>
                <div class="resource-item">
                    <h5>PDF File</h5>
                    <p><a href="#" class="resource-link">Download PDF File</a></p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function uploadFile() {
            const fileInput = document.getElementById('file-input');
            const file = fileInput.files[0];

            if (!file) {
                alert("Please select a file to upload.");
                return;
            }

            // Here you would normally upload the file to the server
            alert(`File "${file.name}" uploaded successfully!`);

            // Optionally, you could update the resource list dynamically
            const resourceList = document.getElementById('resource-list');
            const newResourceItem = document.createElement('div');
            newResourceItem.className = 'resource-item';
            newResourceItem.innerHTML = `
                <h5>${file.name}</h5>
                <p><a href="#" class="resource-link">View ${file.name}</a></p>
            `;
            resourceList.appendChild(newResourceItem);

            // Clear the file input
            fileInput.value = '';
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
