<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTrack - Team Management</title>
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
        .todo-list {
            margin-top: 20px;
        }
        .todo-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            border: 1px solid #e2e2e2;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .completed {
            text-decoration: line-through;
            color: #6c757d;
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
            <a href="shared-resources.jsp">Shared Resources</a>
        </div>

        <div class="content">
            <div class="mb-3">
                <a href="team.jsp" class="btn btn-info">Team</a>
            </div>
            <h2>Team Management</h2>
            <div class="todo-list">
                <h4>To-Do List</h4>
                <div id="todo-items">
                    <!-- Todo items will be added here dynamically -->
                </div>
                <div class="input-group mb-3">
                    <input type="text" id="task-input" class="form-control" placeholder="Add new task...">
                    <input type="text" id="member-input" class="form-control" placeholder="Assign to...">
                    <button class="btn btn-success" onclick="addTask()">Add Task</button>
                </div>
            </div>

            <div class="mt-4">
                <h4>Shared Resources</h4>
                <a href="shared-resources.jsp" class="btn btn-primary">Open Shared Resources Folder</a>
            </div>
        </div>
    </div>

    <script>
        const todoItems = [];

        function addTask() {
            const taskInput = document.getElementById('task-input').value;
            const memberInput = document.getElementById('member-input').value;

            if (taskInput.trim() === "") {
                alert("Please enter a task.");
                return;
            }

            const task = {
                text: taskInput,
                assignedTo: memberInput,
                completed: false
            };

            todoItems.push(task);
            document.getElementById('task-input').value = '';
            document.getElementById('member-input').value = '';
            renderTasks();
        }

        function completeTask(index) {
            todoItems[index].completed = true;
            renderTasks();
        }

        function renderTasks() {
            const todoListDiv = document.getElementById('todo-items');
            todoListDiv.innerHTML = '';

            todoItems.forEach((item, index) => {
                const todoItemDiv = document.createElement('div');
                todoItemDiv.className = 'todo-item';
                todoItemDiv.innerHTML = `
                    <span class="${item.completed ? 'completed' : ''}">${item.text} (Assigned to: ${item.assignedTo})</span>
                    <button class="btn btn-danger btn-sm" onclick="completeTask(${index})" ${item.completed ? 'disabled' : ''}>
                        ${item.completed ? 'Done' : 'Complete'}
                    </button>
                `;
                todoListDiv.appendChild(todoItemDiv);
            });
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
