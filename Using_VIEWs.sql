CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
  	PRICE_IN_DOLLARS DECIMAL,
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, PRICE_IN_DOLLARS, RELEASEDT, PHONENUM ) VALUES
(111114,'LADA', 'КРАСНЫЙ', 18927, date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', 64324, date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', 132492, date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', 55205, date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', 45000, date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', 78345, date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', 14980, date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', 96023, date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', 16700, date'2017-01-01', 9213333331),
(111120,'SKODA', 'ЗЕЛЕНЫЙ', 30927, date'2008-01-01', '9152222221'),
(111118,'SKODA', 'ЧЕРНЫЙ', 29001, date'2013-01-01', '9173333334');

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW c_class_cars
AS SELECT *
FROM AUTO
WHERE PRICE_IN_DOLLARS < 25000;

-- Измените в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW c_class_cars 
AS SELECT MARK, PRICE_IN_DOLLARS
FROM AUTO
WHERE PRICE_IN_DOLLARS < 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW skoda_and_audi
AS SELECT *
FROM AUTO
WHERE MARK='SKODA' OR MARK='AUDI';
