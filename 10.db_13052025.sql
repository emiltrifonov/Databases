--1
CREATE VIEW v_confirmations_per_flight
AS
SELECT MAX(F.AIRLINE_OPERATOR) AS airline_operator,
	   F.FNUMBER,
	   COUNT(B.STATUS) AS confirmed_bookings
FROM FLIGHTS F JOIN BOOKINGS B ON B.FLIGHT_NUMBER = F.FNUMBER
WHERE B.STATUS = 1
GROUP BY F.FNUMBER

--2
CREATE VIEW v_most_bookings_per_agenct
AS
SELECT DISTINCT b.AGENCY AS agency, cu.FNAME, cu.LNAME
FROM BOOKINGS b JOIN CUSTOMERS cu
ON b.CUSTOMER_ID = cu.ID
WHERE
(SELECT COUNT(CUSTOMER_ID)
FROM BOOKINGS 
WHERE AGENCY = b.AGENCY AND CUSTOMER_ID = b.CUSTOMER_ID)
>=
ALL((SELECT COUNT(CUSTOMER_ID)
FROM BOOKINGS
WHERE AGENCY = b.AGENCY
GROUP BY AGENCY, CUSTOMER_ID))

SELECT * FROM v_most_bookings_per_agenct ORDER BY agency

--3
CREATE VIEW v_sofia_agencies_info
AS
SELECT * FROM AGENCIES
WHERE AGENCIES.CITY = 'Sofia'
WITH CHECK OPTION

SELECT * FROM v_sofia_agencies_info

--4
CREATE VIEW v_null_num_agencies
AS
SELECT * FROM AGENCIES
WHERE AGENCIES.PHONE IS NULL
WITH CHECK OPTION

SELECT * FROM v_null_num_agencies

--5
INSERT INTO v_sofia_agencies_info
VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
INSERT INTO v_null_num_agencies
VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
INSERT INTO v_sofia_agencies_info -- Varna != Sofia
VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');
INSERT INTO v_null_num_agencies
VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
INSERT INTO v_null_num_agencies -- +359 IS NOT NULL
VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359');



use pc;

--8
CREATE CLUSTERED INDEX idx_product_model ON product(model)


use ships;

--9
CREATE CLUSTERED INDEX idx_classes_class ON CLASSES(class)
CREATE NONCLUSTERED INDEX idx_classes_country ON CLASSES(country) -- for grouping

CREATE CLUSTERED INDEX idx_ships_name ON SHIPS(name)
CREATE NONCLUSTERED INDEX idx_ships_class ON SHIPS(class) -- for joins

CREATE CLUSTERED INDEX idx_battles_name ON BATTLES(name)
CREATE NONCLUSTERED INDEX idx_battles_date ON BATTLES(date) -- for filtering

CREATE CLUSTERED INDEX idx_outcomes_ship_battle ON OUTCOMES(ship,battle)
CREATE NONCLUSTERED INDEX idx_outcomes_result ON OUTCOMES(result) -- for filtering
