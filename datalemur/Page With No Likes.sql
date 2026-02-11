-- Page With No Likes

--Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
--Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

SELECT 
  t1.page_id 
FROM 
  pages AS t1
LEFT JOIN (SELECT 
            page_id, 
            COUNT(liked_date) AS count_page_like
          FROM 
            page_likes
          GROUP BY 
            page_id) AS t2
ON t1.page_id = t2.page_id
WHERE 
  count_page_like IS NULL
ORDER BY 
  t1.page_id ASC;