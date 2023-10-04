-- Joined tables from the analysis
DROP TEMPORARY TABLE IF EXISTS customer_info_table; -- Drops any temporary table with the name customer_info_table 
CREATE TEMPORARY TABLE IF NOT EXISTS customer_info_table -- Creates a temporary table called customer_info_table
	SELECT s.customer_id, 
	s.order_date, 
	me.product_name,
    me.price,
	CASE WHEN m.join_date > s.order_date THEN 'N'
		WHEN m.join_date <= s.order_date THEN 'Y'
        ELSE 'N' END AS 'member'

FROM sales AS s
LEFT JOIN members AS m
USING(customer_id)

LEFT JOIN menu AS me
ON s.product_id = me.product_id
ORDER BY customer_id;

-- Ranking of customer products for member purchases
SELECT 
	customer_id, 
	order_date, 
	product_name,
    price,
	CASE WHEN member = 'Y' THEN RANK() OVER(PARTITION BY customer_id,member ORDER BY order_date) END AS ranking
FROM customer_info_table; 