-- Создайте таблицу.
create table Employees
(
    Id_employee INT auto_increment primary key,
    Name_employee varchar(15) NOT NULL,
    Surname_employee varchar(15) NOT NULL,
    Specialty_employee varchar(15),
    Seniority_employee INT,
    Salary_employee INT,
    Age_employee TINYINT
);

INSERT INTO Employees 
    (Name_employee, Surname_employee, Specialty_employee, Seniority_employee, Salary_employee, Age_employee)
VALUES
    ('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'Начальник', 8, 70000, 30),
    ('Катя', 'Каткина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
    ('Люся', 'Люськина', 'Уборщик', 10, 10000, 49)
;

-- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
SELECT * FROM Employees 
ORDER BY Salary_employee DESC;

SELECT * FROM Employees 
ORDER BY Salary_employee;

-- Выведите 5 максимальных зарплат (salary)
SELECT Surname_employee, Salary_employee  
FROM Employees LIMIT 5;

-- Подсчитать суммарную зарплату(salary) по каждой специальности (post)
SELECT Specialty_employee, SUM(Salary_employee) AS "Sum of salaries"
FROM Employees
GROUP BY Specialty_employee;

-- Найти количество сотрудников по специальности “Рабочий” (post) в возрасте от 24 до 42 лет.
SELECT Specialty_employee, COUNT(*)  AS "Number of employees"
FROM Employees 
WHERE Specialty_employee = 'Рабочий' && Age_employee >= 24 && Age_employee <= 42
GROUP BY Specialty_employee;

-- Найти количество специальностей
SELECT  COUNT(distinct Specialty_employee) AS "Quantity of specialties"
FROM Employees;

-- Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
SELECT Specialty_employee, AVG(Age_employee)
FROM Employees 
GROUP BY Specialty_employee
HAVING AVG(Age_employee) < 44;

-- Если не ID, то какое поле можно добавить, чтобы использовать его в качестве первичного ключа
-- Номер паспорта или другого уникального документа
