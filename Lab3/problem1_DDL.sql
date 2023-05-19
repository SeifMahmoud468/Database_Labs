CREATE DATABASE Company;

Use Company;

CREATE TABLE EMPLOYEE (
    ssn int NOT NULL,
    fname varchar(255) not null,
    lname varchar(255) not null,
    bdate DATE not null,
    address varchar(255) not null,
    gender varchar(7) not null,
    salary float not null,
    Don int not null,
    PRIMARY KEY (ssn),
    FOREIGN KEY (Don) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE DEPARTMENT (
    Dnumber int NOT null,
    Dname varchar(255) not null,
    mgr_ssn int NOT null,
    mgr_start_date date not null,
    PRIMARY KEY (Dnumber),
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
);

CREATE TABLE PROJECT (
    Pnumber int NOT null,
    Pname varchar(255) not null,
    Plocation varchar(255) not null,
    Dno int not null,
    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dno) REFERENCES department(Dnumber),
    UNIQUE (Pname)
);

ALTER TABLE
    EMPLOYEE
ADD
    FOREIGN KEY (Don) REFERENCES DEPARTMENT(Dnumber);