use movies;
--1
SELECT name
FROM STARSIN JOIN MOVIESTAR ON name = starname
WHERE gender = 'M' AND movietitle = 'The Usual Suspects'

--2
SELECT starname
FROM movie JOIN starsin ON title = movietitle
WHERE YEAR = 1995 AND studioname = 'MGM'

--3
SELECT DISTINCT name
FROM movieexec JOIN movie ON PRODUCERC# = CERT#
WHERE STUDIONAME = 'MGM'

--4
SELECT m1.title
FROM movie AS m1 JOIN movie AS m2 ON m2.title = 'Star Wars'
WHERE m1.length > m2.LENGTH

--5
SELECT me1.name
FROM MOVIEEXEC AS me1 JOIN MOVIEEXEC AS me2 ON me2.name = 'Stephen Spielberg'
WHERE me1.NETWORTH > me2.NETWORTH

----------
use pc;
--1
SELECT maker, speed
FROM laptop JOIN product ON laptop.model = product.model
WHERE hd >= 9

--2
(
SELECT product.model, price
FROM product JOIN laptop ON product.model = laptop.model
WHERE maker = 'B'
)
UNION
(
SELECT product.model, price
FROM product JOIN pc ON product.model = pc.model
WHERE maker = 'B'
)
UNION
(
SELECT product.model, price
FROM product JOIN printer ON product.model = printer.model
WHERE maker = 'B'
)

--3
SELECT maker
FROM product JOIN laptop ON product.model = laptop.model
EXCEPT
SELECT maker
FROM product JOIN pc ON product.model = pc.model

--4
SELECT DISTINCT pc1.hd
FROM pc as pc1 JOIN pc as pc2 ON pc1.hd = pc2.hd
WHERE pc1.code != pc2.code

--5
SELECT pc1.model, pc2.model
FROM pc as pc1 JOIN pc as pc2 ON pc1.speed = pc2.speed AND pc1.ram = pc2.ram
WHERE pc1.model < pc2.model

--6
SELECT DISTINCT p1.maker
FROM (pc AS pc1 JOIN product as p1 ON pc1.model = p1.model)
JOIN (pc AS pc2 JOIN product as p2 ON pc2.model = p2.model)
ON p1.maker = p2.maker
WHERE pc1.speed >= 400 AND pc2.speed >= 400 AND pc1.code != pc2.code

----------
use ships;
--1
SELECT name
FROM ships JOIN classes ON ships.class = classes.class
WHERE DISPLACEMENT > 50000

--2
SELECT s.NAME, c.DISPLACEMENT, c.NUMGUNS
FROM (CLASSES AS c JOIN ships AS s ON c.CLASS = s.CLASS)
JOIN (BATTLES as b JOIN OUTCOMES as o ON b.name = battle)
ON s.name = o.ship
WHERE b.NAME = 'Guadalcanal'

--3 --bb and bc
SELECT DISTINCT c1.country
FROM classes as c1 JOIN classes as c2 ON c1.COUNTRY = c2.COUNTRY
WHERE (c1.type = 'bb' AND c2.type = 'bc')

--4
SELECT o1.SHIP
FROM (OUTCOMES as o1 JOIN BATTLES as b1 ON o1.BATTLE = b1.NAME)
JOIN (OUTCOMES as o2 JOIN BATTLES as b2 ON o2.BATTLE = b2.NAME)
ON o1.SHIP = o2.SHIP
WHERE o1.RESULT = 'damaged' AND b1.DATE < b2.DATE
