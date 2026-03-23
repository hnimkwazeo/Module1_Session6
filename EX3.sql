create database salesdb;

create schema sales;

create table Customers(
    customer_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(255) not null unique,   
	phone varchar(10) unique
);

create table Products(
	product_id serial primary key,
	product_name varchar(100) not null,
	price decimal(10, 2) not null,
	stock_quantity bigint not null
);

create table Orders(
	order_id serial primary key,
	customer_id int references customers(customer_id),
	order_date Date not null
);

create table OrderItems(
	order_item_id serial primary key,
	order_id int references orders(order_id),
	product_id int references products(product_id),
	quantity bigint check (quantity >= 1)
);

