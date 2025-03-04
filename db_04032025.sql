use movies;
--1
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'F' AND NAME IN (SELECT NAME FROM MOVIEEXEC WHERE NETWORTH > 10000000)

--2
SELECT name
FROM moviestar
WHERE name NOT in (SELECT name from MOVIEEXEC)

--3
SELECT title
FROM movie
WHERE length > ALL (SELECT length from movie where title = 'Star Wars')

--4
SELECT title, name
FROM movie join movieexec on PRODUCERC# = CERT#
WHERE networth > (select networth from MOVIEEXEC where name = 'Merv Griffin')


use pc;
--1
SELECT maker
FROM product
WHERE model in (select model from pc where speed > 500)

--2
SELECT code, model, price
from printer
WHERE price >= ALL (select price from printer)

--3
SELECT * FROM laptop
WHERE speed < ALL (select speed from pc)


--4
SELECT TOP 1 *
FROM
(SELECT model, price FROM laptop where price >= ALL (select price from laptop)
UNION
SELECT model, price FROM printer where price >= ALL (select price from printer)
UNION
SELECT model, price FROM pc where price >= ALL (select price from pc)) AS t
ORDER BY price DESC

--5
SELECT maker
FROM product JOIN (SELECT price, model FROM printer WHERE color = 'y') as cp
ON product.model = cp.model
WHERE price <= ALL (SELECT price FROM printer WHERE color = 'y')

--6
SELECT DISTINCT maker
FROM (SELECT maker, speed FROM product JOIN pc 
		ON product.model = pc.model WHERE ram <= ALL (SELECT RAM FROM pc)) as mr
WHERE speed >= ALL (SELECT SPEED FROM 
					(SELECT * FROM pc WHERE ram <= ALL (SELECT RAM FROM pc)) as s)


use ships;
--1
SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM CLASSES)

--2
SELECT DISTINCT CLASS 
FROM SHIPS
WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'sunk')

--3
SELECT NAME, CLASS
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES WHERE BORE = 16)

--4
SELECT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME FROM SHIPS WHERE CLASS = 'Kongo')

--5
SELECT C.CLASS, NAME
FROM CLASSES AS C JOIN SHIPS AS S ON C.CLASS = S.CLASS
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM CLASSES WHERE BORE = C.BORE)
ORDER BY CLASS