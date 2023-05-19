Create Database Lab5;

CREATE TABLE department(
    dept_id INT NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(dept_id)
);

CREATE TABLE student(
    student_id INT NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    major VARCHAR(255),
    LEVEL VARCHAR(255),
    age INT,
    PRIMARY KEY(student_id)
);

CREATE TABLE professor(
    prof_id INT NOT NULL,
    prof_name VARCHAR(255) NOT NULL,
    dept_id INT NOT NULL,
    PRIMARY KEY(prof_id),
    FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

CREATE TABLE course(
    course_code VARCHAR(25) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PRIMARY KEY(course_code)
);

CREATE TABLE semester_course(
    course_code VARCHAR(25) NOT NULL,
    QUARTER VARCHAR(25) NOT NULL,
    `year` INT NOT NULL,
    prof_id INT NOT NULL,
    PRIMARY KEY(course_code, QUARTER, `year`),
    FOREIGN KEY(course_code) REFERENCES course(course_code),
    FOREIGN KEY(prof_id) REFERENCES professor(prof_id)
);

CREATE TABLE enrolled(
    student_id INT NOT NULL,
    course_code VARCHAR(25) NOT NULL,
    QUARTER VARCHAR(25) NOT NULL,
    `year` INT NOT NULL,
    enrolled_at DATE NOT NULL,
    PRIMARY KEY(
        student_id,
        course_code,
        QUARTER,
        `year`
    ),
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(course_code, QUARTER, `year`) REFERENCES semester_course(course_code, QUARTER, `year`)
);