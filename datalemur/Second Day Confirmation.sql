--Second Day Confirmation

--Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. 
--New users on TikTok sign up using their email addresses, and upon sign-up, 
--each user receives a text message confirmation to activate their account.
--Write a query to display the user IDs of those who did not confirm their sign-up on 
--the first day, but confirmed on the second day.

SELECT 
  user_id 
FROM 
  emails AS t1 
INNER JOIN 
  texts AS t2 
ON  
  t1.email_id = t2.email_id 
WHERE 
  t2.signup_action =  'Confirmed'
  AND (action_date::DATE - signup_date::DATE) = 1;