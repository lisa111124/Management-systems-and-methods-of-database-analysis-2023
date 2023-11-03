
-- SQL Server data types

-- Данні з таблиць учбової БД
USE [WebStor];

SELECT *
FROM [dbo].[OFFICES];

SELECT *
FROM [dbo].[SALESREPS];

SELECT *
FROM [dbo].[CUSTOMERS];

SELECT *
FROM [dbo].[ORDERS];

SELECT *
FROM [dbo].[PRODUCTS];

-- Демонстрація неявного перетворення типів даних
USE [Test];
INSERT INTO [dbo].[DATATYPES] ([ID], [AGE])
VALUES (301, '75'); -- символи '75' перетворюються в число 75

SELECT *
FROM [dbo].[DATATYPES];


/*
Обмеження цілісності даних у T-SQL

1) PRIMARY KEY (PK): Визначає колонку або набір колонок як унікальний ідентифікатор рядків у таблиці. 
Кожен рядок має мати унікальне значення у колонках PRIMARY KEY, і це значення не може бути NULL.
Може бути составний PK

2) FOREIGN KEY: Створює зв'язок між двома таблицями. Значення FOREIGN KEY в одній таблиці відповідає значенню 
PRIMARY KEY або іншому UNIQUE обмеженню в іншій таблиці, забезпечуючи таким чином цілісність даних між таблицями.

3) UNIQUE: Гарантує, що всі значення в колонці або наборі колонок є унікальними серед усіх рядків таблиці. 
Це дозволяє допускати NULL значення, відмінно від PRIMARY KEY.


4) CHECK: Встановлює специфічну умову, яку повинні виконувати дані в колонці. 
Наприклад, CHECK обмеження може вимагати, щоб значення віку було більше 18.

5) DEFAULT: Задає стандартне значення для колонки, якщо при вставці рядка значення не вказане. 
Наприклад, можна автоматично встановити поточну дату для колонки 'дата створення'.

6) NOT NULL: Вказує, що колонка не може мати значення NULL. Це забезпечує, що кожен рядок матиме дійсне 
значення у цій колонці.

7) CASCADE: Використовується з FOREIGN KEY обмеженнями для автоматичного оновлення або видалення залежних рядків. 
Наприклад, якщо рядок у батьківській таблиці видаляється, усі залежні рядки у дочірній таблиці також будуть видалені.

Ці обмеження можна комбінувати для створення складних правил цілісності, що відповідають бізнес-вимогам. 
Використання обмежень цілісності є критично важливим для забезпечення точності та надійності даних, 
що зберігаються в системі баз даних.


*/



/*
Data types (Transact-SQL)
https://learn.microsoft.com/uk-ua/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

Data type precedence (Transact-SQL)
https://learn.microsoft.com/en-gb/sql/t-sql/data-types/data-type-precedence-transact-sql?view=sql-server-ver16

Data type conversion (Database Engine)
https://learn.microsoft.com/en-gb/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver16


Exact-number data types that use integer data
tinyint  - 0 to 255                                 - 1 Byte
smallint - -32768-32767                             - 2 Bytes
int      - -2147483648-2147483647                   - 4 Bytes
bigint   - -9223372036854775808-9223372036854775807 - 8 Bytes

Numeric data types that have fixed precision and scale
decimal    - p - precision, s - scale - decimal(19, 2)
numeric    - p - precision, s - scale - decimal(19, 2)
money      - -922337203685477.5808-922337203685477.5807 - 8 bytes
smallmoney - -214748.3648 to 214748.3647                - 4 bytes

date       -  0001-01-01 - 9999-12-31                                                  - 3 bytes
datetime   - С я января 1753 года до 31 декабря 9999 года От 00:00:00 до 23:59:590,997 - 8 байт

char       -- Fixed-size string data asci.
nchar      -- Fixed-size string data unicode.

varchar

nvarchar

*/


/*

-- DDL - Data definition language
-- CREATE - створити об'єкт
-- ALTER  - змінити об'єкт
-- DROP   - видалити об'єкт


-- To run a query use commands bellow
-- F5 - execute
-- ALT + X - execute
*/



