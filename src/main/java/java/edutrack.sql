CREATE DATABASE edutrack;
USE edutrack;
-- Create Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create an index on the email column for faster lookups
CREATE INDEX idx_email ON Users(email);

-- Add some sample data (optional)
INSERT INTO Users (name, email, password, role) VALUES
('John Doe', 'john@example.com', 'hashed_password_here', 'teacher'),
('Jane Smith', 'jane@example.com', 'hashed_password_here', 'student');

-- Create Classes Table
CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    teacher_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES Users(user_id)
);

-- Create ClassEnrollments Table (to track which students are in which classes)
CREATE TABLE ClassEnrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    student_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id),
    UNIQUE KEY (class_id, student_id)
);

-- Create Tests Table
CREATE TABLE Tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    test_name VARCHAR(100) NOT NULL,
    test_date DATE NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Create TestScores Table
CREATE TABLE TestScores (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    test_id INT NOT NULL,
    student_id INT NOT NULL,
    score FLOAT NOT NULL,
    FOREIGN KEY (test_id) REFERENCES Tests(test_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id),
    UNIQUE KEY (test_id, student_id)
);

-- Create Projects Table
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Create Teams Table
CREATE TABLE Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    team_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Create TeamMembers Table
CREATE TABLE TeamMembers (
    team_member_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id),
    UNIQUE KEY (team_id, student_id)
);

-- Create WeeklyReports Table
CREATE TABLE WeeklyReports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
    report_content TEXT,
    submission_date DATE NOT NULL,
    grade FLOAT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Create Assignments Table
CREATE TABLE Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    attachment_path VARCHAR(255),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Modify Projects Table to include assignment_id
ALTER TABLE Projects
ADD COLUMN assignment_id INT,
ADD FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id);

-- Modify Classes Table to include additional fields
ALTER TABLE Classes
ADD COLUMN class_code VARCHAR(20) UNIQUE,
ADD COLUMN description TEXT,
ADD COLUMN start_date DATE,
ADD COLUMN end_date DATE;

-- AssignmentAttachments Table (new)
CREATE TABLE AssignmentAttachments (
    attachment_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id)
);

-- StudentAssignments Table (new)
CREATE TABLE StudentAssignments (
    student_assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    submission_date TIMESTAMP,
    grade FLOAT,
    feedback TEXT,
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id),
    UNIQUE KEY (assignment_id, student_id)
    );
    -- Modify the Assignments table to include a status field
ALTER TABLE Assignments
ADD COLUMN status ENUM('active', 'deleted') DEFAULT 'active';

-- Modify the StudentAssignments table to include file information
ALTER TABLE StudentAssignments
ADD COLUMN file_name VARCHAR(255),
ADD COLUMN file_path VARCHAR(255);

-- Create a new table for assignment grades (if not using the grade field in StudentAssignments)
CREATE TABLE AssignmentGrades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_assignment_id INT NOT NULL,
    grade FLOAT,
    feedback TEXT,
    graded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    graded_by INT NOT NULL,
    FOREIGN KEY (student_assignment_id) REFERENCES StudentAssignments(student_assignment_id),
    FOREIGN KEY (graded_by) REFERENCES Users(user_id)
);