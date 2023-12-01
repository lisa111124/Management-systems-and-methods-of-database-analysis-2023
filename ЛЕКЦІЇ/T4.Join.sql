-- JOIN


/*
Види з'єднань:
     Декартовий добуток рядків
	    CROSS JOIN
	 Внутрішнє з'єднання
	    INNER JOIN
	 Зовнішні з'єднання
	    LEFT  OUTER JOIN
		RIGHT OUTER JOIN
		FULL  OUTER JOIN

Табличний оператор JOIN 
        CROSS JOIN -> INNER JOIN -> LEFT  OUTER JOIN / RIGHT OUTER JOIN / FULL  OUTER JOIN

*/


SELECT *
FROM [dbo].[OFFICES];

SELECT *
FROM [dbo].[SALESREPS];

/*
Внутрішнє з'єднання (INNER JOIN)
`INNER JOIN` - це найбільш часто використовуваний вид з'єднання, який повертає рядки, 
коли є хоча б одна відповідність у обох таблицях. Тобто, результатом будуть тільки ті комбінації, 
які відповідають заданій умові з'єднання.
*/

-- Завдання 1. Відібрати співробітників, які знаходяться в західному регіоні

-- INNER JOIN Внутрішнє з'єднання - ANSI-92 
SELECT f.REGION,
       f.OFFICE,
	   s.EMPL_NUM,
	   s.NAME
	 --  s.REP_OFFICE
  FROM [dbo].[OFFICES] f -- Псевдонім таблиці (f)
 /*INNER*/ JOIN [dbo].[SALESREPS] s ON s.REP_OFFICE = f.OFFICE
 WHERE f.REGION = 'Western' 
;

-- INNER JOIN Внутрішнє з'єднання - ANSI-89
SELECT f.REGION,
       f.OFFICE,
	   s.EMPL_NUM,
	   s.NAME 
  FROM [dbo].[OFFICES] f,
       [dbo].[SALESREPS] s
 WHERE s.REP_OFFICE = f.OFFICE
 AND f.REGION = 'Western'
; 


-- Зовнішнє з'єднання LEFT OUTER JOIN
/*
`LEFT OUTER JOIN` - повертає всі рядки з лівої (першої) таблиці та відповідні рядки 
з правої (другої) таблиці. Якщо збігів немає, то результатом для правої таблиці 
будуть NULL значення.
*/


SELECT *
FROM [dbo].[SALESREPS];
SELECT *
FROM [dbo].[ORDERS];

-- LEFT OUTER JOIN - ANSI-92
SELECT *
  FROM [dbo].[SALESREPS] s  
  LEFT OUTER JOIN [dbo].[ORDERS] o ON o.REP = s.EMPL_NUM
;


SELECT *
FROM [dbo].[OFFICES];
SELECT *
FROM [dbo].[SALESREPS];
SELECT *
FROM [dbo].[ORDERS];

-- Завдання 2. 
/*
Знайти всіх співробітників східного регіону і подивитись їх замовлення.І навіть вивести
співробітників, у яких не має жодного замовлення
*/

SELECT f.REGION,
       s.EMPL_NUM,
       s.NAME,
	   o.ORDER_NUM,
	   o.ORDER_DATE,
	   o.AMOUNT
  FROM [dbo].[OFFICES] f
 INNER JOIN [dbo].[SALESREPS] s ON s.REP_OFFICE = f.OFFICE
  LEFT OUTER JOIN [dbo].[ORDERS] o ON o.REP = s.EMPL_NUM
 WHERE f.REGION = 'EASTERN'
;





-- FULL  OUTER JOIN
SELECT *
  FROM [dbo].[SALESREPS] s  
  FULL OUTER JOIN [dbo].[ORDERS] o ON o.REP = s.EMPL_NUM
;

/*
Декартове добуток рядків
   - `CROSS JOIN` - це вид з'єднання, при якому кожен рядок першої таблиці 
   з'єднується з кожним рядком другої таблиці, створюючи всі можливі комбінації. 
   Це може призвести до великої кількості рядків у результаті, якщо обидві таблиці містять 
   багато рядків.
*/

-- CROSS JOIN - ANSI-92
SELECT *
  FROM [dbo].[OFFICES]
 CROSS JOIN [dbo].[SALESREPS];


-- CROSS JOIN - ANSI-89
SELECT *
  FROM [dbo].[OFFICES],
  [dbo].[SALESREPS];

/* 
CROSS JOIN та FULL  OUTER JOIN  -  рідкісні види з'єднань
INNER JOIN та LEFT  OUTER JOIN  -  найбільш часто використовувані види з'єднань
*/
