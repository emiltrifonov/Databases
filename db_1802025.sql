--Movies
use movies;
--1
SELECT ADDRESS FROM STUDIO WHERE NAME = 'Disney'

--2
SELECT BIRTHDATE FROM MOVIESTAR WHERE NAME = 'Jack Nicholson'

--3
SELECT STARNAME FROM STARSIN WHERE MOVIEYEAR = 1980 OR MOVIETITLE LIKE '%Knight%'

--4
SELECT NAME FROM MOVIEEXEC WHERE NETWORTH > 10000000

--5
SELECT NAME FROM MOVIESTAR WHERE GENDER = 'M' OR ADDRESS = 'Prefect Rd.'


--PC
use pc;
--1
SELECT model, speed AS MHz, hd AS GB FROM pc WHERE price < 1200

--2
SELECT DISTINCT maker FROM product WHERE type = 'Printer'

--3
SELECT model, hd, screen FROM laptop WHERE price > 1000

--4
SELECT * FROM printer WHERE color = 'y'

--5
SELECT model, speed, hd FROM pc WHERE price < 1200 AND cd in ('12x', '16x')


--Ships
use ships;
--1
SELECT class, country FROM CLASSES WHERE NUMGUNS < 10

--2
SELECT name AS shipName FROM SHIPS WHERE LAUNCHED < 1918

--3
SELECT ship, battle FROM OUTCOMES WHERE RESULT = 'sunk'

--4
SELECT name FROM SHIPS WHERE name = class

--5
SELECT name FROM SHIPS WHERE name LIKE 'R%'

--6
SELECT name FROM SHIPS WHERE name LIKE '_% _%'
