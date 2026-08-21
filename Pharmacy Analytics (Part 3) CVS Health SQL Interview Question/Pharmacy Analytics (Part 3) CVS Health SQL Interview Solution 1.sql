WITH CTE1 AS (SELECT manufacturer, ROUND(SUM(total_sales)/1000000) AS sale 
FROM pharmacy_sales GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC,1 ASC)
SELECT manufacturer, CONCAT('$',sale,' million') AS sales_mil FROM CTE1