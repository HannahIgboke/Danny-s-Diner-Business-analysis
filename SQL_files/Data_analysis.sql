-- Q1: Total amount each customer spent at the restaurant
SELECT customer_id, CONCAT('$', SUM(price)) AS total_amt_spent
FROM sales AS s
INNER JOIN menu
USING(product_id)
GROUP BY customer_id;

-- Q2 How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(DISTINCT(order_date)) AS number_of_days_visited
FROM sales
GROUP BY customer_id;

-- Q3 What was the first item from the menu purchased by each customer?
WITH first_purchase AS(
SELECT customer_id, product_id, MIN(order_date) AS date_of_first_purchase
FROM sales
GROUP BY customer_id
)
SELECT customer_id, product_name AS first_item, date_of_first_purchase
FROM first_purchase
INNER JOIN menu
USING(product_id)
GROUP BY customer_id;

-- Q4 What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT s.product_id, m.product_name, COUNT(*) AS number_of_times_purchased
FROM sales AS s
INNER JOIN menu AS m
USING (product_id)
GROUP BY s.product_id, m.product_name
ORDER BY number_of_times_purchased DESC;

-- Q5 Which item was the most popular for each customer?
SELECT 
	customer_id, 
	product_name, 
	number_of_times_purchased
FROM (
SELECT 
	s.customer_id, 
	s.product_id, 
	m.product_name,
	COUNT(product_id) AS number_of_times_purchased,
	RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(product_id) DESC) AS rnk

FROM sales AS s
INNER JOIN menu AS m
USING(product_id)

GROUP BY s.customer_id, m.product_name
) AS popular_categories
WHERE rnk = 1;


-- Q6 Which item was purchased first by the customer after they became a member?
SELECT 
	customer_id,
	product_name,
    join_date,
    order_date,
    order_of_purchase
FROM(
SELECT 
s.customer_id,
s.product_id,
m.join_date,
s.order_date,
me.product_name,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY s.order_date) AS order_of_purchase

FROM sales AS s
INNER JOIN members AS m
USING(customer_id)

INNER JOIN menu AS me
ON s.product_id = me.product_id

WHERE join_date < order_date
) AS first_purchase
WHERE order_of_purchase = 1;


-- Q7 Which item was purchased just before the customer became a member?
WITH just_before_member AS (SELECT 
s.customer_id,
s.product_id,
m.join_date,
s.order_date,
me.product_name,
RANK() OVER(PARTITION BY customer_id ORDER BY s.order_date DESC) AS order_of_purchase

FROM sales AS s
INNER JOIN members AS m
USING(customer_id)

INNER JOIN menu AS me
ON s.product_id = me.product_id

WHERE join_date > order_date
)

SELECT 
	customer_id,
	product_name,
    join_date,
    order_date
FROM just_before_member
WHERE order_of_purchase = 1;


-- Q8 What is the total items and amount spent for each member before they became a member?
WITH just_before_member AS (SELECT 
s.customer_id,
s.product_id,
m.join_date,
s.order_date,
me.price, 
me.product_name

FROM sales AS s
INNER JOIN members AS m
USING(customer_id)

INNER JOIN menu AS me
ON s.product_id = me.product_id

WHERE join_date > order_date
)

SELECT 
	customer_id,
    join_date,
	order_date,
    COUNT(*) AS total_items,
    SUM(price) AS total_amt_spent
FROM just_before_member
GROUP BY customer_id
ORDER BY customer_id;


-- Q9 If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
SELECT 
s.customer_id,
SUM(CASE WHEN product_name = 'sushi' THEN me.price * 10 * 2
ELSE me.price * 10 END) AS points_gained

FROM sales AS s
INNER JOIN menu AS me
ON s.product_id = me.product_id
GROUP BY customer_id;


/* Q10 In the first week after a customer joins the program (including their join date), they earn 2x points on all items, not just sushi. 
How many points do customer A and B have at the end of January?
*/

With first_week_after AS (
SELECT
	s.customer_id, 
	s.product_id, 
	s.order_date, 
    m.join_date,
    DATE_ADD(m.join_date, INTERVAL 7 DAY) AS new_date,
    me.product_name,
    me.price
FROM sales AS s
INNER JOIN members AS m
USING(customer_id)
INNER JOIN menu AS me
ON s.product_id = me.product_id
)

SELECT 
	customer_id,
	SUM(price*2*10) AS points_gained  
FROM first_week_after
WHERE MONTH(order_date) = 1
GROUP BY customer_id
ORDER BY customer_id;



