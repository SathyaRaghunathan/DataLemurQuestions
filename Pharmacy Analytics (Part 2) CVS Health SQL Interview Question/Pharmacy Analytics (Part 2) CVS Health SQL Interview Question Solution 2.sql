SELECT manufacturer, COUNT(drug) AS drug_count,
ABS(SUM(total_sales -cogs)) AS profit FROM pharmacy_sales
WHERE cogs >= total_sales
GROUP BY 1
ORDER BY 3 DESC