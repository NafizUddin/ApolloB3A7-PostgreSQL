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
-- Delete all courses that no students have enrolled.

DELETE FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM enrollment
);

-- In the above query, I have used DELETE statement with a subquery to identify the courses that no students have enrolled. I applied 'NOT IN' to identify course IDs that do not appear in the enrollment table. 


-- Query-05
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.

SELECT student_name from students
LIMIT 2 OFFSET 2;

-- In the above query, I have used LIMIT 2 to get only 2 names of the students and used OFFSET 2 to get the names of the students starting from the 3rd student.

-- Query-06
-- Retrieve the course names and the number of students enrolled in each course.

SELECT c.course_name, count(e.student_id) as students_enrolled
FROM courses c 
JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- In the above query, I have joined the courses and enrollment tables,made group by course name and used 'count' to display the number of students for each course. 

-- Query-07
-- Calculate and display the average age of all students.

SELECT ROUND(AVG(age), 2) as average_age FROM students;

-- In the above query, I have calculated the average age of students from the students table and rounds the result to two decimal places. The output is labeled as 'average_age.'

-- Query-08
-- Retrieve the names of students whose email addresses contain 'example.com'.

SELECT student_name FROM students
WHERE email LIKE '%example.com%';

-- In thw above query, I have used the LIKE operator with a wildcard to match any email that includes 'example.com'.

