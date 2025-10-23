SET profiling = 1;

EXPLAIN
SELECT
    c.customer_id,
    c.region,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE
    YEAR(o.order_date) = 2024                
    AND o.status IN ('delivered','shipped')   
    AND (c.region LIKE '%th%' OR c.vip_flag = 1)  
    AND o.total_amount > (
        SELECT AVG(total_amount)             
        FROM orders
        WHERE status = 'delivered'
    )
GROUP BY c.customer_id, c.region
HAVING total_spent > 500                          
LIMIT 200;


SELECT
    c.customer_id,
    c.region,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE
    YEAR(o.order_date) = 2024                
    AND o.status IN ('delivered','shipped')  
    AND (c.region LIKE '%th%' OR c.vip_flag = 1) 
    AND o.total_amount > (
        SELECT AVG(total_amount)             
        FROM orders
        WHERE status = 'delivered'
    )
GROUP BY c.customer_id, c.region
HAVING total_spent > 500
LIMIT 200;

SHOW PROFILES;
SHOW PROFILE FOR QUERY 65;
