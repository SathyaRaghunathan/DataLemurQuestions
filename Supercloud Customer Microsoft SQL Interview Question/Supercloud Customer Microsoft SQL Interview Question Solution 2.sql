/*
A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.

Write a query that identifies the customer IDs of these Supercloud customers.

customer_contracts Table:
Column Name	Type
customer_id	integer
product_id	integer
amount	integer
customer_contracts Example Input:
customer_id	product_id	amount
1	1	1000
1	3	2000
1	5	1500
2	2	3000
2	6	2000
products Table:
Column Name	Type
product_id	integer
product_category	string
product_name	string
products Example Input:
product_id	product_category	product_name
1	Analytics	Azure Databricks
2	Analytics	Azure Stream Analytics
4	Containers	Azure Kubernetes Service
5	Containers	Azure Service Fabric
6	Compute	Virtual Machines
7	Compute	Azure Functions
Example Output:
customer_id
1

*/

WITH CTE1 AS (SELECT cc.customer_id, COUNT(DISTINCT p.product_category) AS d_cnt
FROM customer_contracts AS cc
JOIN products AS p on cc.product_id = p.product_id
GROUP BY 1)
SELECT customer_id FROM CTE1
WHERE d_cnt = (
SELECT COUNT(DISTINCT product_category)
FROM products
)