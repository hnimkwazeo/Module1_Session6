create database HotelDB;

create schema hotel;

create table RoomTypes(
	room_type_id serial primary key,
	type_name varchar(50) not null unique,
	price_per_night numeric(10,2) check (price_per_night > 0),
	max_capacity int check (max_capacity > 0)
);

create table Rooms(
	room_id serial primary key,
	room_number varchar(10) not null unique,
	room_type_id int references roomtypes(room_type_id),
	status varchar(20) check (status IN ('Available','Occupied','Maintenance'))
);

create table Customers(
	customer_id serial primary key,
	full_name varchar(100) not null,
	email varchar(100) unique not null,
	phone varchar(15) not null
);

create table Bookings(
	booking_id serial primary key,
	customer_id int references customers(customer_id),
	room_id int references rooms(room_id),
	check_in Date not null,
	check_out Date not null,
	status varchar(20) check (status IN ('Pending','Comfirmed','Cancelled'))
);

create table Payments(
	payment_id serial primary key,
	booking_id int references bookings(booking_id),
	amount numeric(10,2) check (amount >= 0),
	payment_date Date not null,
	methods varchar(20) check (methods IN ('Credit Card','Cash','Bank Transfer'))
);

