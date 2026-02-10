-- Duplicate Job Listings

--Assume you're given a table containing job postings from various companies on the 
--LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.

SELECT 
  COUNT (DISTINCT tb_agg.company_id) AS duplicate_companies
FROM 
    (SELECT
      company_id,
      title, 
      description, 
      COUNT(*) AS count_co
    FROM 
      job_listings
    GROUP BY 
      company_id,
      title,
      description 
      HAVING COUNT(*) > 1) AS tb_agg;