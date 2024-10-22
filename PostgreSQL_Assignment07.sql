-- Active: 1729599931507@@127.0.0.1@5432@university_db

-- creating students table
CREATE table students (
    student_id  SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    frontend_mark INT NOT NULL,
    backend_mark INT NOT NULL,
    status VARCHAR(50)
);

-- creating courses table
CREATE Table courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL
)

-- creating enrollment table
CREATE Table enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students (student_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    course_id INT NOT NULL REFERENCES courses (course_id)
    ON DELETE CASCADE ON UPDATE CASCADE
)

-- Inserting sample students data
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- inserting sample courses data
INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- inserting sample enrollment data
INSERT INTO enrollment (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);


-- Query-01
-- Insert a new student record
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Niaz', 24, 'niaz@gmail.com', 58, 55, NULL);

-- In the above query,I have added a new student record using insert statement.

-- Query-02
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

SELECT s.student_name from students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

-- In the above query, I have joined the students, enrollment, and courses tables to retrieve the names of the students enrolled in the "Next.js" course. It matches student IDs and course IDs to filter for those specifically enrolled in that course.

-- Query-03
-- Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.

UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);

-- In the above query, I have used subquery to identify the student with the highest total and set status to 'Awarded'.


-- Query-04

-- Query-05

-- Query-06

-- Query-07

-- Query-08

-- Query-09