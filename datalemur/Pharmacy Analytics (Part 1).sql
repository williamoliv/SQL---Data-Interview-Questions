--Pharmacy Analytics (Part 1)
--CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
--Each drug can only be produced by one manufacturer.
--Write a query to find the top 3 most profitable drugs sold, and how much profit they made. 
--Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

WITH 
  cte_rank AS (
    SELECT 
      drug, 
      (total_sales - cogs) AS total_profit,
      ROW_NUMBER() OVER(ORDER BY (total_sales - cogs) DESC) AS rank
    FROM 
      pharmacy_sales
  )
SELECT
  drug,
  total_profit
FROM 
  cte_rank
WHERE   
  rank <= 3 
;