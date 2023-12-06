--Завдання 1--

Use WebStor
Go

--Створюємо запит, який покаже список працівників старше 45 років за спаданням (ідентифікатор працівника, ім'я працівника, вік, посаду)
SELECT [EMPL_NUM], [NAME], [AGE], [TITLE]
FROM dbo.SALESREPS
WHERE AGE > 45
ORDER BY [AGE] DESC;

--Завдання 2--
--Створюємо запит, який поверне список унікальних комбінацій значень ідентифікатора виробника та ідентифікатора товару
SELECT DISTINCT [MFR], [PRODUCT]
FROM dbo.ORDERS
WHERE ORDER_DATE BETWEEN '20080101' AND '20081231';

--Завдання 3--
--Створюємо запит, який поверне ідентифікатор працівника з найбільшою кількістю проведених замовлень

SELECT TOP 1 WITH TIES [REP], 
COUNT(DISTINCT AMOUNT) AS [Qty] 
FROM [dbo].[ORDERS]
WHERE [ORDER_DATE] BETWEEN '20080101'AND '20090101'
GROUP BY [REP]
ORDER BY [Qty] ASC



SELECT TOP 1 WITH TIES [REP], 
COUNT(DISTINCT AMOUNT) AS QUANTITY 
FROM [dbo].[ORDERS]
WHERE [ORDER_DATE] BETWEEN '20080101'AND '20090101'
GROUP BY [REP]
ORDER BY COUNT(DISTINCT AMOUNT) DESC