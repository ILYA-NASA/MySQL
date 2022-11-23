-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
CREATE TABLE `Lesson_1`.`mobile_phones` (
  `id_mobile_phones` INT NOT NULL AUTO_INCREMENT,
  `models_mobile_phones` VARCHAR(45) NOT NULL,
  `manufacturers_mobile_phones` VARCHAR(45) NOT NULL,
  `prices_mobile_phones` DECIMAL NULL,
  `quantity_mobile_phones` INT NOT NULL,
  PRIMARY KEY (`id_mobile_phones`));
  
-- Заполните БД данными
INSERT INTO `Lesson_1`.`mobile_phones` 
  (`models_mobile_phones`, `manufacturers_mobile_phones`, `prices_mobile_phones`, `quantity_mobile_phones`) 
VALUES 
  ('C110', 'Samsung', '100000', '3');

INSERT INTO `Lesson_1`.`mobile_phones` 
  (`models_mobile_phones`, `manufacturers_mobile_phones`, `prices_mobile_phones`, `quantity_mobile_phones`) 
VALUES 
  ('C100', 'Samsung', '90000', '4');

INSERT INTO `Lesson_1`.`mobile_phones` 
  (`models_mobile_phones`, `manufacturers_mobile_phones`, `prices_mobile_phones`, `quantity_mobile_phones`) 
VALUES 
  ('A3', 'Samsung', '20199', '5');

INSERT INTO `Lesson_1`.`mobile_phones` 
  (`models_mobile_phones`, `manufacturers_mobile_phones`, `prices_mobile_phones`, `quantity_mobile_phones`) 
VALUES 
  ('Mi9', 'Xiaomi', '18599', '1');

INSERT INTO `Lesson_1`.`mobile_phones` 
  (`models_mobile_phones`, `manufacturers_mobile_phones`, `prices_mobile_phones`, `quantity_mobile_phones`) 
VALUES 
  ('Mi10', 'Xiaomi', '28599', '5');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT models_mobile_phones, manufacturers_mobile_phones, prices_mobile_phones 
FROM mobile_phones
WHERE quantity_mobile_phones > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones
WHERE manufacturers_mobile_phones = 'Samsung';
