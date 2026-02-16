--Cards Issued Difference
--Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, you're analyzing how many credit cards were issued each month.
--Write a query that outputs the name of each credit card and the difference in the number of issued cards between the month with the highest issuance cards and the lowest issuance. 
--Arrange the results based on the largest disparity.

WITH maxtb AS (SELECT 
                  card_name,
                  MAX(issued_amount) AS max_issued_amount
                FROM 
                  monthly_cards_issued 
                GROUP BY 
                  card_name),
      mintb AS (
                SELECT 
                  card_name,
                  MIN(issued_amount) AS min_issued_amount
                FROM  
                  monthly_cards_issued 
                GROUP BY 
                  card_name)
SELECT 
    t1.card_name,
    (max_issued_amount -	min_issued_amount) as difference  
FROM 
  maxtb AS t1 JOIN mintb AS t2
ON 
  t1.card_name = t2.card_name
ORDER BY 
  difference DESC;
