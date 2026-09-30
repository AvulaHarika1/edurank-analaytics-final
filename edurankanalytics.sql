CREATE DATABASE edurank_analytics;
USE edurank_analytics;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Admin','Teacher') NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE students (
    student_id VARCHAR(20) PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    department VARCHAR(50),
    year INT,
    semester INT,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE subjects (
    subject_id VARCHAR(20) PRIMARY KEY,
    subject_name VARCHAR(100),
    department VARCHAR(50),
    semester INT,
    credits INT
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20),
    subject_id VARCHAR(20),
    internal_marks DECIMAL(5,2),
    assignment_marks DECIMAL(5,2),
    semester_marks DECIMAL(5,2),
    total_marks DECIMAL(5,2),
    grade VARCHAR(5),

    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20),
    total_classes INT,
    attended_classes INT,
    attendance_percentage DECIMAL(5,2),

    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20),
    subject_id VARCHAR(20),
    assignment_name VARCHAR(100),
    marks DECIMAL(5,2),

    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE participation (
    participation_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20),
    activity VARCHAR(100),
    score DECIMAL(5,2),

    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

CREATE TABLE analytics (
    analytics_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20),
    overall_score DECIMAL(5,2),
    performance_level VARCHAR(30),
    remarks VARCHAR(255),

    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

INSERT INTO users(username,password,role,full_name,email)
VALUES
('admin','admin123','Admin','System Administrator','admin@gmail.com'),
('teacher','teacher123','Teacher','Teacher','teacher@gmail.com');

INSERT INTO students
(student_id, student_name, gender, department, year, semester, phone, email)
VALUES
('S001','Rahul Kumar','Male','CSE',3,5,'9876543210','rahul@gmail.com'),
('S002','Priya Sharma','Female','CSE',3,5,'9876543211','priya@gmail.com'),
('S003','Arjun Reddy','Male','ECE',3,5,'9876543212','arjun@gmail.com'),
('S004','Sneha Rao','Female','ECE',3,5,'9876543213','sneha@gmail.com'),
('S005','Kiran Kumar','Male','ECE',3,5,'9876543214','kiran@gmail.com');

INSERT INTO subjects (subject_id, subject_name, department, semester, credits)
VALUES
('SUB101','Python Programming','CSE',5,4),
('SUB102','Database Management System','CSE',5,4),
('SUB103','Data Structures','CSE',4,4),
('SUB104','Digital Electronics','ECE',4,3),
('SUB105','Microprocessors','ECE',5,4);

DELETE FROM marks;

INSERT INTO marks
(student_id, subject_id, internal_marks, assignment_marks, semester_marks, total_marks, grade)
VALUES
('S001','SUB101',24,18,46,88,'A'),
('S002','SUB101',22,17,43,82,'A'),
('S003','SUB104',20,16,40,76,'B'),
('S004','SUB104',25,19,48,92,'A+'),
('S005','SUB105',18,15,38,71,'B');

DELETE FROM attendance;

INSERT INTO attendance
(student_id, total_classes, attended_classes, attendance_percentage)
VALUES
('S001',100,92,92.00),
('S002',100,88,88.00),
('S003',100,81,81.00),
('S004',100,95,95.00),
('S005',100,78,78.00);


SHOW TABLES;

SELECT * FROM users;
SELECT * FROM students;
SELECT * FROM subjects;
SELECT * FROM marks;
SELECT * FROM attendance;
SELECT * FROM assignments;
SELECT * FROM participation;
SELECT * FROM analytics;