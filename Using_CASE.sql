-- Запустим MySQL 8.0 Command Line Client - Unicode

-- Для просмотра баз данных на сервере введем команду:
SHOW DATABASES;

-- Теперь создадим базу данных с помощью:
CREATE DATABASE Lesson_2;

-- Чтобы обращаться к созданной базе данных используем команду:
USE Lesson_2;

-- 1. Создадим таблички "goods" и “sales”:
CREATE TABLE Goods
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    GoodsName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    GoodsCount INT DEFAULT 0,
    Price DECIMAL NOT NULL
);

CREATE TABLE Sales
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    GoodsId INT NOT NULL,
    SalesCount INT DEFAULT 0,
    FOREIGN KEY (GoodsId) REFERENCES Goods(Id) ON DELETE CASCADE
);


-- Заполним их данными:
INSERT INTO Goods(GoodsName, Manufacturer, GoodsCount, Price)
VALUES ('Макароны', 'Макфа', 225, 76),
       ('Пельмени', 'Цезарь', 152, 510),
       ('Жвачка', 'Орбит', 50, 49),
       ('Чипсы', 'Лейс', 700, 70),
       ('Шоколад', 'Баунти', 90, 59),
       ('Мороженое', 'Буренка', 432, 33);

INSERT INTO Sales(GoodsId, SalesCount) 
VALUES (1, 10), 
       (2, 11),
       (3, 12),
       (4, 13),
       (5, 14),
       (6, 15);

-- Содержимое таблиц:
SELECT * FROM Goods;
SELECT * FROM Sales;

-- 2. Группируем значеня количества в 3 сегмента — меньше 100, 100-300 и больше 300. - CASE
SELECT GoodsName, GoodsCount, SalesCount, 
CASE
    WHEN GoodsCount - SalesCount < 100 
        THEN 'Меньше ста позиций'
    WHEN GoodsCount - SalesCount > 100 && GoodsCount - SalesCount < 300
        THEN 'От ста до трехсот позиций'
    ELSE 'Больше трехсот позиций'
END AS Category
FROM Sales, Goods;


-- 3. Создаем таблицу “orders”: 
CREATE TABLE Orders
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    GoodsId INT NOT NULL,
    SalesId INT NOT NULL,
    Status VARCHAR(30),
    FOREIGN KEY (GoodsId) REFERENCES Goods(Id) ON DELETE CASCADE,
    FOREIGN KEY (SalesId) REFERENCES Sales(Id) ON DELETE CASCADE
);

-- заполняем ее значениями:
INSERT INTO Orders (GoodsId, SalesId, Status)
VALUES ((SELECT Id FROM Goods WHERE Manufacturer= 'Макфа'),  
        (SELECT Id FROM Sales WHERE SalesCount = 10),  
        'в резерве'
), 
     	((SELECT Id FROM Goods WHERE Manufacturer= 'Орбит'),  
      (SELECT Id FROM Sales WHERE SalesCount = 11),  
      'в резерве'
), 
 	    ((SELECT Id FROM Goods WHERE Manufacturer= 'Лейс'),  
      (SELECT Id FROM Sales WHERE SalesCount = 12),  
      'в резерве'
),
      ((SELECT Id FROM Goods WHERE Manufacturer= 'Макфа'),  
      (SELECT Id FROM Sales WHERE SalesCount = 13),  
      NULL
); 

-- покажем “полный” статус заказа, используя оператор CASE
SELECT GoodsId, SalesId, 
      COALESCE(Status, 'не определено') AS Contacts
FROM Orders;
