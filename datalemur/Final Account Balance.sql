-- Final Account Balance
--Given a table containing information about bank deposits and withdrawals made using Paypal,
--write a query to retrieve the final account balance for each account, taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.
WITH 
  tbdeposit AS 
    (SELECT 
      account_id, 
      SUM(amount) AS sum_Deposit
     FROM
        transactions
     WHERE 
      transaction_type = 'Deposit' 
     GROUP BY account_id),
  tbwithdrawal AS 
    (SELECT 
      account_id, 
      SUM(amount) AS sum_Withdrawal 
    FROM
      transactions
     WHERE 
        transaction_type = 'Withdrawal' 
     GROUP BY account_id)
SELECT 
  A.account_id, 
  (A.sum_Deposit - B.sum_Withdrawal) AS final_balance 
FROM 
  tbdeposit A 
JOIN 
  tbwithdrawal B 
ON A.account_id = B.account_id;