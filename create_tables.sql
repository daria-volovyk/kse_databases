#creeating 5 tables
DROP DATABASE IF EXISTS assigment;
CREATE DATABASE assigment;
use assigment;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    email VARCHAR(100),
    department_id INT,
    enrollment_year YEAR);

DROP TABLE IF EXISTS courses;
CREATE TABLE courses(
course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    professor_id INT,
    department_id INT);
    

DROP TABLE IF EXISTS professors;
CREATE TABLE professors(
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department_id INT);


DROP TABLE IF EXISTS enrollments;
CREATE TABLE enrollments(
enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade FLOAT);
    

DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
   department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    building VARCHAR(50),
    budget DECIMAL(10,2));