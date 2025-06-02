use master;
--1
create database FurnitureCompany;
use FurnitureCompany;

create table CUSTOMER (
	Customer_ID INT IDENTITY PRIMARY KEY,
	Customer_Name varchar(50),
	Customer_Address varchar(50),
	Customer_City varchar(50),
	City_Code char(4)
);

create table PRODUCT (
	Product_ID INT PRIMARY KEY,
	Product_Description varchar(50),
	Product_Finish varchar(50),
	Standard_Price decimal,
	Product_Line_ID INT,
	CHECK (Product_Finish IN ('cheresha', 'estestven yasen', 'byal yasen',
	'cherven dub', 'estestven dub', 'oreh'))
);

create table ORDER_T (
	Order_ID INT PRIMARY KEY,
	Order_Date date,
	Customer_ID INT references Customer(Customer_ID)
);

create table ORDER_LINE (
	Order_ID INT references ORDER_T(Order_ID),
	Product_ID INT references Product(Product_ID),
	Ordered_Quantity INT
);

--2
select p.product_id, p.product_description, count(ol.Product_ID) as times_ordered
from product p join ORDER_LINE ol on p.Product_ID = ol.Product_ID
group by p.Product_ID, p.Product_Description

--3
select p.product_id, p.product_description, count(ol.Product_ID) as times_ordered
from product p left join ORDER_LINE ol on p.Product_ID = ol.Product_ID
group by p.Product_ID, p.Product_Description

--4
select c.Customer_Name, sum(p.standard_price) order_amount from
CUSTOMER c join ORDER_T ot on c.Customer_ID = ot.Customer_ID
join ORDER_LINE ol on ol.Order_ID = ot.Order_ID
join PRODUCT p on p.Product_ID = ol.Product_ID
group by c.Customer_ID, c.Customer_Name
order by order_amount

use pc;
--5
select distinct maker from product where model in (select model from printer)
INTERSECT
select distinct maker from product where model in (select model from laptop)

select distinct p.maker from printer pr join product p on pr.model = p.model
INTERSECT
select distinct p.maker from laptop l join product p on l.model = p.model

--6
update pc set price = 0.95 * price
where model in (SELECT model FROM product WHERE type = 'PC' and maker in (
select maker from product p join printer pr on p.model = pr.model group by maker having avg(price) > 800))

--7
select hd, min(price) min_price from pc where hd between 10 and 30 group by hd


use ships;
--8
--a)
CREATE VIEW v_more_ships_than_guadalcanal
AS
SELECT battle FROM (SELECT DISTINCT ship, battle from outcomes) o
group by battle
having count(ship) > (SELECT count(*) FROM (SELECT DISTINCT ship, battle from outcomes) o where battle = 'Guadalcanal')
 
--b)
CREATE VIEW v_more_countries_than_guadalcanal
AS
SELECT battle FROM (SELECT DISTINCT c.country, o.battle from outcomes o join ships s on o.ship = s.NAME join classes c ON c.class = s.class) o
group by battle
having count(country) > (SELECT count(*) FROM
(SELECT DISTINCT c.country, o.battle from outcomes o join ships s on o.ship = s.NAME join classes c ON c.class = s.class) o
WHERE o.BATTLE = 'Guadalcanal')

select * from v_more_countries_than_guadalcanal

--9
DELETE FROM OUTCOMES
WHERE battle IN (
	SELECT battle FROM (SELECT DISTINCT ship, battle FROM OUTCOMES) o group by o.battle having count(*) = 1
)

--10
CREATE VIEW v_nums_sunk
AS
SELECT ship FROM outcomes WHERE result = 'sunk' group by ship having count(ship) >= 2


DELETE FROM OUTCOMES
WHERE result = 'sunk' AND ship in (select ship from v_nums_sunk)

--11
CREATE VIEW v_countries_in_battles
AS
SELECT DISTINCT battle, c.country FROM
OUTCOMES o join ships s on o.SHIP = s.NAME join CLASSES c on c.CLASS = s.CLASS

select distinct battle from v_countries_in_battles v
where 
v.battle != 'Guadalcanal' 
AND 
(select count(*) from
(select country from v_countries_in_battles where battle = 'Guadalcanal'
EXCEPT
select country from v_countries_in_battles v1 where v1.battle = v.battle) as q1) = 0
AND 
(select count(*) from
(select country from v_countries_in_battles v2 where v2.battle = v.battle
EXCEPT
select country from v_countries_in_battles where battle = 'Guadalcanal') as q2) = 0

--12
select c.COUNTRY, count(DISTINCT o.battle) as battles_in_count
from outcomes o join ships s on o.SHIP = s.NAME right join CLASSES c on c.CLASS = s.CLASS
group by c.COUNTRY
