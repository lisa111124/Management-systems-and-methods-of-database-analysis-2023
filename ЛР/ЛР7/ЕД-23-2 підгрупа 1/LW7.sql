﻿﻿USE WebStor;
GO
SELECT DISTINCT MFR
FROM CUSTOMERS
INNER JOIN ORDERS ON [CUST_REP] = [REP]
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2009-01-01'
      AND COMPANY LIKE '%CORP%';
GO

--Завдання 2 
SELECT CUST_NUM, MONTH(ORDER_DATE) AS Місяць_замовлення, COUNT(DISTINCT ORDER_NUM) AS Кількість_Унікальних_Замовлень
FROM CUSTOMERS
LEFT OUTER JOIN ORDERS ON CUST_NUM = CUST
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2009-01-01'
      AND COMPANY LIKE '%CORP%'
GROUP BY CUST_NUM, MONTH(ORDER_DATE)
ORDER BY Кількість_Унікальних_Замовлень DESC;
GO

--Завдання 3
SELECT DISTINCT [CUST_NUM], UPPER ([COMPANY]) AS Назва_Компанії, [DESCRIPTION]
FROM [CUSTOMERS]
LEFT OUTER JOIN [ORDERS] ON [CUST_NUM] = [CUST]
LEFT OUTER JOIN [PRODUCTS] ON [PRODUCT_ID] = [PRODUCT]
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2009-01-01'
      AND [COMPANY] LIKE '%CORP%' ; 
GO