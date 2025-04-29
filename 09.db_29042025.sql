CREATE TABLE Airport (
	code VARCHAR(10) PRIMARY KEY,
	name VARCHAR(50),
	country VARCHAR(50),
	city VARCHAR(50),
	UNIQUE (country, name)
);

CREATE TABLE Customer (
	id INT PRIMARY KEY,
	fname VARCHAR(20),
	lname VARCHAR(20),
	email VARCHAR(30),
	CHECK (email LIKE '______?'
	AND email LIKE '%@%' AND email LIKE '%.%')
);

CREATE TABLE Agency (
	name varchar(30) PRIMARY KEY,
	country varchar(50),
	city varchar(50),
	phone VARCHAR(15)
);

CREATE TABLE Airline (
	code VARCHAR(10) PRIMARY KEY,
	name varchar(50) UNIQUE,
	country varchar(50)
);

CREATE TABLE Airplane (
	code varchar(10) primary key,
	type varchar(20),
	seats int,
	year date,
	CHECK (seats > 0)
);

CREATE TABLE Flight (
	fnumber int primary key,
	airline_operator varchar(10) references Airline(code),
	dep_airport varchar(10) references Airport(code),
	arr_airport varchar(10) references Airport(code),
	flight_time smalldatetime,
	flight_duration int, --in minutes
	airplane varchar(10) references Airplane(code)
);

CREATE TABLE Booking (
	code int primary key,
	agency varchar(30) references Agency(name),
	airline_code varchar(10) references Airline(code),
	flight_number int references Flight(fnumber),
	customer_id int references Customer(id),
	booking_date smalldatetime,
	flight_date smalldatetime,
	price float,
	status int,
	CHECK (flight_date > booking_date),
	CHECK (status IN (0,1))
);
