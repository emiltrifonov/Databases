--zad 1
CREATE TABLE Product (
	maker CHAR(1),
	model CHAR(4),
	type VARCHAR(7)
);

CREATE TABLE Printer (
	code INT,
	model CHAR(4),
	price DECIMAL(10, 2)
);

INSERT INTO Product VALUES
('A', '1000', 'PC'),
('A', '1100', 'Laptop'),
('B', '1200', 'PC'),
('C', '1100', 'Printer'),
('C', '1300', 'Printer')

INSERT INTO Printer VALUES
(123, '1100', 150),
(142, '1300', 280)

ALTER TABLE Printer ADD type VARCHAR(6)
CHECK (type IN ('laser', 'matrix', 'jet'))

ALTER TABLE Printer ADD color CHAR(1) DEFAULT 'n'
ALTER TABLE Printer ADD CONSTRAINT chk_color CHECK (color IN ('y', 'n'))

ALTER TABLE Printer DROP COLUMN price

DROP TABLE Product
DROP TABLE Printer

--zad 2
CREATE TABLE Users (
	id INT PRIMARY KEY,
	email VARCHAR(50),
	password VARCHAR(25),
	regdate DATE
);

CREATE TABLE Friends (
	id1 INT,
	id2 INT,
	PRIMARY KEY(id1, id2)
);

CREATE TABLE Walls (
	wall_user_id INT,
	writer_id INT,
	text VARCHAR(250),
	PRIMARY KEY (wall_user_id, writer_id, text)
);

CREATE TABLE Groups (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	description VARCHAR(100)
);

CREATE TABLE GroupMembers (
	gid INT,
	uid INT,
	PRIMARY KEY(gid, uid)
);

INSERT INTO Users VALUES
(1, 'imeil1@abv.bg', 'parolaa', '2024-10-20'),
(2, 'biq4a@gmail.com', '123123', '2024-12-01'),
(3, 'sofronii@yahoo.com', 'kartofi', '2025-04-28')
SELECT * FROM Users

INSERT INTO Friends VALUES
(1,2), (1,3)
SELECT * FROM Friends

INSERT INTO Walls VALUES
(1, 2, 'Tekstovo suobshtenie'), (3, 1, 'Zdraveite Stoqn')
SELECT * FROM Walls

INSERT INTO Groups VALUES
(1, 'Pulna grupa', 'Tuk sme trimata'),
(2, 'Bez smeshnika 3', '3 e smeshen')
SELECT * FROM Groups

INSERT INTO GroupMembers VALUES
(1,1),(1,2),(1,3),(2,1),(2,2)
SELECT * FROM GroupMembers
