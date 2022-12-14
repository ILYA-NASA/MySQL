-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
CREATE TABLE time 
  (time_id INT PRIMARY KEY AUTO_INCREMENT, 
  seconds INT);

INSERT INTO time (seconds) 
VALUES (123456),
       (234567),
       (345678);

DELIMITER |
CREATE FUNCTION format_time(val INT)
RETURNS char(45)
DETERMINISTIC
BEGIN
	DECLARE DD char(3);
	DECLARE HH, MI, SS char(2);
	DECLARE result char(50);
	set DD = cast(floor(val/60/60/24) as char(3));
	set HH = cast(floor(mod(val/60/60/24,1)*24) as char(2));
	set MI = cast(floor(mod(mod(val/60/60/24,1)*24,1)*60) as char(2));
	set SS = cast(round(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) as char(2));
  set result = concat(DD,' day(s) ',HH,' hour(s) ',MI,' minute(s) ',SS,' second(s) ');
return result;
END |

SElECT format_time(seconds) AS result from time; 

-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10
CREATE TABLE numbers 
  (id_numbers INT PRIMARY KEY AUTO_INCREMENT, 
	odd_even_numbers VARCHAR(4));

INSERT INTO numbers (odd_even_numbers) 
VALUES ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd');

SELECT id_numbers FROM numbers WHERE id_numbers % 2 = 0; 
