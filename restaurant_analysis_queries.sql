-- Total order lines
SELECT COUNT(*) AS total_order_lines
FROM order_details;

-- Total revenue
SELECT
    SUM(mi.price) AS total_revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- Top Selling Menu Items
SELECT
    mi.item_name,
    COUNT(*) AS times_ordered
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY times_ordered DESC;

-- Highest Revenue of Menu Items
SELECT
    mi.item_name,
    SUM(mi.price) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY revenue DESC;

-- Revenue By Category
SELECT
    mi.category,
    SUM(mi.price) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY revenue DESC;

-- Orders By Category
SELECT
    mi.category,
    COUNT(*) AS total_orders
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_orders DESC;

-- Busiest Days
SELECT
    order_date,
    COUNT(*) AS total_orders
FROM order_details
GROUP BY order_date
ORDER BY total_orders DESC;

--Busiest Hours
SELECT
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(*) AS total_orders
FROM order_details
GROUP BY order_hour
ORDER BY total_orders DESC;

-- Revenue per Hour
SELECT
    EXTRACT(HOUR FROM od.order_time) AS order_hour,
    SUM(mi.price) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_hour
ORDER BY order_hour;

-- Revenue by Day of Week
SELECT
    TO_CHAR(order_date, 'Day') AS weekday,
    COUNT(*) AS total_orders,
    SUM(mi.price) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY weekday
ORDER BY revenue DESC;

--KPI Queries
SELECT COUNT(*) AS total_orders
FROM order_details;

SELECT
ROUND(SUM(mi.price),2) AS total_revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

SELECT COUNT(*) AS total_menu_items
FROM menu_items;

SELECT
mi.category,
COUNT(*) AS orders,
ROUND(SUM(mi.price),2) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY revenue DESC;

SELECT
mi.item_name,
COUNT(*) AS times_ordered,
ROUND(SUM(mi.price),2) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY times_ordered DESC
LIMIT 10;