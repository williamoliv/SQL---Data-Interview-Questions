--Cities With Completed Trades
--Write a query to retrieve the top three cities that have the
--highest number of completed trade orders listed in descending order
WITH tb_compl AS 
(SELECT 
  A.order_id, 
  B.city 
FROM 
  trades AS A
INNER JOIN users AS B
ON A.user_id = B.user_id
WHERE
  status = 'Completed')
  
SELECT 
  city, 
  COUNT(order_id) AS total_orders 
FROM 
  tb_compl 
GROUP BY 
  city 
ORDER BY total_orders DESC 
LIMIT 3;