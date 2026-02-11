
--Histogram of Tweets

--Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
--Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
--In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

WITH user_tweet_counts AS (
  SELECT 
    user_id, 
    COUNT(tweet_id) AS tweet_count 
  FROM tweets 
  WHERE tweet_date >= '2022-01-01' 
    AND tweet_date < '2023-01-01'
  GROUP BY user_id
)
SELECT 
  tweet_count AS tweet_bucket, 
  COUNT(user_id) AS users_num 
FROM  user_tweet_counts
GROUP BY 
  tweet_count
ORDER BY 
  tweet_bucket ASC;