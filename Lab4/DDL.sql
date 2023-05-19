CREATE DATABASE lab4;

USE lab4;

CREATE TABLE customer (
    customer_id int not null AUTO_INCREMENT,
    customer_name varchar(255) not null,
    city varchar(255),
    PRIMARY KEY (customer_id)
);

CREATE TABLE `order`(
    order_id INT NOT NULL AUTO_INCREMENT,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE item (
    item_id int not null,
    unit_price float not null,
    PRIMARY KEY (item_id)
);

CREATE TABLE order_item(
    order_id int not null,
    item_id int not null AUTO_INCREMENT,
    quantity int not null,
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);

CREATE TABLE warehouse (
    warehouse_id int not null AUTO_INCREMENT,
    warehouse_city varchar(255) not null,
    PRIMARY KEY (warehouse_id)
);

CREATE TABLE shipment (
    order_id int not null,
    warehouse_id int not null,
    ship_date datetime not null DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);