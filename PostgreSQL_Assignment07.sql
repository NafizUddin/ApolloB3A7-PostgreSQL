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

