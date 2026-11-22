Create DATABASE university_db;

CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50)  NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    registration_time TIME DEFAULT CURRENT_TIME,
    created_at DATETIME DEFAULT NOW(),
    CONSTRAINT check_age CHECK (age >=18)
);

INSERT INTO students(full_name, age, email) VALUES ("Houssein", 29, "houssein@example.com");
INSERT INTO students(full_name, age, email) VALUES ("Ali", 30, "ali@example.com");

DROP DATABASE university_db;

CREATE DATABASE university_db;

CREATE TABLE departments(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);

CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL
);

CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE health_records(
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT UNIQUE,
    blood_type VARCHAR(5),
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

INSERT INTO departments(dept_name) VALUES
('computer science'),
('mathematics'),
('physics');

INSERT INTO courses(course_name, credits, dept_id) VALUES
('database systems', 4 ,1),
('algorithms', 3 ,1),
('calculus', 4 ,2),
('quantum mechanics', 5 ,3);

INSERT INTO students (student_name) VALUES
('alice'),
('bob'),
('charlie'),
('samy'),
('eva');

INSERT INTO enrollments(student_id,course_id) VALUES 
(1,1),
(1,2),
(2,1),
(3,2),
(3,3),
(4,3),
(4,4);

INSERT INTO health_records(student_id,blood_type)VALUES 
(1,"A+"),
(2,"B+"),
(3,"O-"),
(4,"AB+"),
(5,"A-");