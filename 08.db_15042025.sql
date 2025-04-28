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
