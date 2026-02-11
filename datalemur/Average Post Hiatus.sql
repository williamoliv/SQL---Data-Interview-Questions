--Average Post Hiatus (Part 1)
--for each user who posted at least twice in 2021
--write a query to find the number of days between each user’s 
--first post of the year and last post of the year in the year 2021. 

WITH work_table AS 
  (SELECT 
    user_id, 
    count(post_id) AS count_post
  FROM 
    posts
  WHERE 
    post_date BETWEEN '01/01/2021' AND '12/31/2021'
  GROUP BY   
    user_id
  HAVING COUNT(post_id) > 1)
  
SELECT 
  B.user_id, 
  (MAX(post_date)::date - MIN(post_date)::date) AS days_between
FROM 
  posts AS A
INNER JOIN work_table AS B 
ON A.user_id = B.user_id
GROUP BY B.user_id;