--App Click-through Rate (CTR)

--Assume you have an events table on Facebook app analytics. 
--Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

WITH tb_impression AS 
(SELECT 
  app_id, 
  ROUND(COUNT(event_type),4) AS impression_count 
FROM 
  events
WHERE 
  event_type = 'impression'  
  AND EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id),  
tb_click AS 
(SELECT 
  app_id, 
  ROUND(COUNT(event_type),4) AS click_count 
FROM 
  events
WHERE 
  event_type = 'click' 
  AND EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id)

SELECT 
  A.app_id, 
  ROUND((((click_count/impression_count))* 100),2) AS ctr
FROM 
  tb_impression AS A
JOIN 
  tb_click AS B
ON A.app_id = B.app_id;