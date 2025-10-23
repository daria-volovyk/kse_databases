SET profiling = 1; #instead of explain analyze
DROP INDEX  idx_orders ON orders;
DROP INDEX  idx_customers ON customers;
DROP INDEX  idx_customers_id ON orders;
DROP INDEX  idx_order_id ON order_items;

CREATE INDEX  idx_orders ON orders(order_date, status, total_amount); #index for where with a lot of conditions
CREATE INDEX idx_customers ON customers(vip_flag); #index for one of conditions but without region because OR works bad for index
CREATE INDEX idx_customers_id ON orders(customer_id); #for join
CREATE INDEX idx_order_id ON order_items(order_id); #for join

DROP TEMPORARY TABLE avg_total_amount;

CREATE TEMPORARY TABLE  avg_total_amount AS #temporary table instead of CTE for big subquery
SELECT AVG(total_amount)  AS avg_amount    
        FROM orders
        WHERE status = 'delivered';
  
EXPLAIN 
SELECT 
    c.customer_id,
    c.region,
    COUNT(o.order_id) AS total_orders, #order_id is already unique so there is no sense in using DISTINCT
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
JOIN avg_total_amount a
WHERE
    o.order_date BETWEEN '2024-01-01' AND '2024-12-31'      #better to use between because in year(...)  mysql is finding year for each row and after that looking for 2024       
    AND o.status IN ('delivered','shipped')   
    AND (c.region LIKE '%th' OR c.vip_flag = 1)  #there is no sense in using %th% because th can be only in the end
    AND o.total_amount > a.avg_amount #used temprorary table instead of big subquery
GROUP BY c.customer_id, c.region
HAVING total_spent > 500                            
LIMIT 200;



SELECT 
    c.customer_id,
    c.region,
    COUNT(o.order_id) AS total_orders, #order_id is already unique so there is no sense in using DISTINCT
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
JOIN avg_total_amount
WHERE
    o.order_date BETWEEN '2024-01-01' AND  '2024-12-31'      #better to use between because in year(...)  mysql is finding year for each row and after that looking for 2024       
    AND o.status IN ('delivered','shipped')   
    AND (c.region LIKE '%th' OR c.vip_flag = 1)  #there is no sense in using %th% because th can be only in the end
    AND o.total_amount > avg_amount #used temprorary table instead of big subquery
GROUP BY c.customer_id, c.region
HAVING total_spent > 500                           
LIMIT 200;
SHOW PROFILES;
 SHOW PROFILE FOR QUERY 121;