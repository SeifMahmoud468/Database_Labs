CREATE DATABASE library;

use library;

CREATE TABLE CATEGORY (
    category_id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    PRIMARY KEY (category_id)
);

CREATE TABLE PUBLISHER (
    pub_id int not null,
    name varchar(255) not null,
    address varchar(255) not null,
    PRIMARY KEY (pub_id)
);

CREATE TABLE MEMBER (
    member_id int not null,
    name varchar(255) not null,
    address varchar(255) not null,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id)
);

CREATE TABLE BOOK (
    book_id int not null AUTO_INCREMENT,
    title varchar(255) not null,
    price float not null,
    pub_id int not null,
    category_id int not null,
    PRIMARY KEY (book_id),
    FOREIGN KEY (pub_id) REFERENCES publisher(pub_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE BORROWING_BOOK (
    member_id int not null,
    book_id int not null,
    borrow_date DATETIME not null DEFAULT CURRENT_TIMESTAMP,
    due_date DATETIME not null,
    return_date DATETIME not null,
    PRIMARY KEY (member_id, book_id, borrow_date),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);