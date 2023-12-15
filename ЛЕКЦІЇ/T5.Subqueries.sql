/*Вкладені запити
    Скалярний
	     Скалярний автономний
		 Скалярний автономний гарантований
		 Скалярний кореляційний
		 Скалярний кореляційний гарантований
    Табличний
	     Табличний автономний
		 Табличний кореляційний
*/


--Зовнішній запит
SELECT s.*
  FROM [dbo].[SALESREPS] s
 WHERE s.AGE = ( -- Скалярний автономний вкладений запит (гарантований)
                SELECT MAX(sr.AGE)
                  FROM [dbo].[SALESREPS] sr)
;






SELECT *
  FROM [dbo].[SALESREPS] s
 WHERE s.REP_OFFICE IN (-- Скалярний автономний вкладений запит (не гарантований)
                        SELECT f.OFFICE
                          FROM [dbo].[OFFICES] f
                         WHERE f.MGR = 108)
;


--Скалярний кореляційний
SELECT s.EMPL_NUM,
       s.[NAME],
	   (SELECT COUNT(*) FROM [dbo].[ORDERS] o WHERE o.REP = s.EMPL_NUM) AS OrdersCount
  FROM [dbo].[SALESREPS] s 
;



-- Табличний автономний
SELECT f.OFFICE,
       f.[TARGET]
  FROM [dbo].[OFFICES] f
 WHERE f.OFFICE IN (SELECT o.OFFICE FROM [dbo].[OFFICES] o WHERE o.TARGET > 500000)
;

--Табличний кореляційний
SELECT s.EMPL_NUM,
       s.[NAME]
  FROM [dbo].[SALESREPS] s
 WHERE EXISTS (SELECT * 
                 FROM [dbo].[ORDERS] o 
				WHERE o.REP = s.EMPL_NUM 
				  AND o.ORDER_DATE > '2008-01-01') 
;