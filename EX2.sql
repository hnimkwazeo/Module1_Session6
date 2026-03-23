create database UniversityDB;

create schema university;

create table Students(
	student_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	birth_date Date,
	email varchar(255) not null unique
);

create table Courses(
	course_id serial primary key,
	course_name varchar(100) not null,
	credits int 
);

create table Enrollment(
	enrollment_id serial primary key,
	student_id int references students(student_id),
	course_id int references courses(course_id),
	enroll_date Date
);

SELECT datname 
FROM pg_database;

SELECT schema_name
FROM information_schema.schemata;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'students';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'courses';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'enrollment';