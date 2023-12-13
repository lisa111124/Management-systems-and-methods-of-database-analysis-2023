﻿USE WebStor;
Go


--Завдання 1-- 
--Створення запиту, який поверне список унікальних ідентифікаторів виробників товару (MFR).
SELECT DISTINCT MFR
FROM CUSTOMERS
INNER JOIN ORDERS ON [CUST_REP] = [REP]
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2009-01-01'
      AND COMPANY LIKE '%CORP%';
GO

--Завдання 2--
--Створюємо запит, який у розрізі ідентифікатора клієнта (CUST_NUM) та місяця проведення замовлення (ORDER_DATE) поверне кількість унікальних замовлень (GROUP BY).
SELECT CUST_NUM, MONTH(ORDER_DATE) AS Місяць_замовлення, COUNT(DISTINCT ORDER_NUM) AS Кількість_Унікальних_Замовлень
FROM CUSTOMERS 
LEFT OUTER JOIN ORDERS ON CUST_NUM = CUST
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2009-01-01'
      AND COMPANY LIKE '%CORP%'
GROUP BY CUST_NUM, MONTH(ORDER_DATE)
ORDER BY Кількість_Унікальних_Замовлень DESC;
GO

--Завдання 3--
--Напишіть запит, який поверне список (без дублікатів) придбаних товарів.
SELECT DISTINCT [CUST_NUM], UPPER([COMPANY]) AS Назва_Компанії, [DESCRIPTION]
FROM [CUSTOMERS]
LEFT OUTER JOIN [ORDERS] ON [CUST_NUM] = [CUST]
LEFT OUTER JOIN [PRODUCTS] ON [PRODUCT_ID] = [PRODUCT]
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2009-01-01'
      AND [COMPANY] LIKE '%CORP%';
GO