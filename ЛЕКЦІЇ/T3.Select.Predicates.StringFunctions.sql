-- Конструкція SELECT

-- Вироджений варіант конструкції SELECT

SELECT 'Приклад простого тексту' AS [String];
SELECT  10009                    AS [Number];
SELECT  456.00                   AS [Financial];
SELECT  SYSDATETIME()            AS [DateTime];


SELECT 'Приклад простого тексту' AS [String]
       ,10009                    AS [Number]
       ,456.00                   AS [Financial]
       ,SYSDATETIME()            AS [DateTime]
	   ,1 + 2                    AS [Count]
;

-- Компоненти конструкції SELECT

1 SELECT          -- Визначає найменування стовбців для виводу данних
2 FROM            -- Визначає найменування таблиць 
3 WHERE           -- Здійсює пошук рядків за якимось критерієм
4 GROUP BY        -- Формує групи рядків
5 HAVING          -- Фільтрує групи рядків
6 ORDER BY        -- Здійснює сортування результуючого набору даних

-- Приклад 1
SELECT [EMPL_NUM]
      ,[NAME]
      ,[SALES]
      ,[REP_OFFICE]
FROM [dbo].[SALESREPS]
WHERE REP_OFFICE = 11
ORDER BY [SALES] DESC
;

-- Приклад 2
SELECT [TITLE]
      ,COUNT(DISTINCT EMPL_NUM) AS [Qty]
FROM [dbo].[SALESREPS]
WHERE HIRE_DATE BETWEEN '20040101' AND '20041231'
GROUP BY [TITLE]
ORDER BY [Qty] DESC --DESC - сортування за зменшенням // ASC - сортування за збільшенням 
;

SELECT *
FROM [dbo].[SALESREPS]
;


-- Функції агрегації
COUNT -- рахувати значення
SUM   -- сумувати значення
AVG   -- розраховувати середнє значення
MIN   -- знайти мінімальне значення
MAX   -- знайти максимальне значення

SELECT COUNT(*) AS [Кількість рядків]
FROM [dbo].[SALESREPS]
;

SELECT SUM(SALES) AS [Загальна сума поточних продажів]
FROM [dbo].[SALESREPS]
;


SELECT MIN(AGE) AS [Найменший вік співробітників]
FROM [dbo].[SALESREPS]
;

SELECT MAX(AGE) AS [Найбільший вік співробітників]
FROM [dbo].[SALESREPS]
;

SELECT AVG(AGE) AS [Середній вік співробітників]
FROM [dbo].[SALESREPS]
;

SELECT *
FROM [dbo].[SALESREPS]
;


SELECT [TITLE]
      ,[MANAGER]
	  ,COUNT (*)
FROM [dbo].[SALESREPS]
GROUP BY [TITLE],[MANAGER]
;


-- Оператори вибірки 
DISTINCT      -- Оператор унікальної вибірки
TOP           -- Оператор верхньої вибірки
OFFSET FETCH  -- Оператори пагінації. Дозволяють пропустити певну кількість рядків (OFFSET) і потім повернути вказану кількість рфдків (FETCH)
/*
Усі ці оператори вибірки (або оператори клаузи) використовуються для вдосконалення та точної настройки 
видачі даних, які ви отримуєте з бази даних.
*/




SELECT DISTINCT
       [CUST]
FROM [dbo].[ORDERS]
ORDER BY [CUST] DESC
;


SELECT TOP 3 *
FROM [dbo].[ORDERS]
ORDER BY AMOUNT DESC 
;

SELECT *
FROM [dbo].[ORDERS]
;