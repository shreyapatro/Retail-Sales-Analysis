USE retail_db;

-- View 1: Top-selling brands by store
CREATE OR REPLACE VIEW brand_sales_by_store AS
SELECT
    s.store_name,
    b.brand_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY s.store_name, b.brand_name;

-- View 2: Staff performance by total sales
CREATE OR REPLACE VIEW staff_performance AS
SELECT
    s.first_name,
    s.last_name,
    st.store_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales_handled
FROM staffs s
JOIN orders o ON s.staff_id = o.staff_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY s.first_name, s.last_name, st.store_name;

-- View 3: Customer order tracking with status description
CREATE OR REPLACE VIEW customer_order_status AS
SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.shipped_date,
    CASE o.order_status
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
    END AS order_status_description
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- View 4: Revenue by product category
CREATE OR REPLACE VIEW revenue_by_category AS
SELECT
    c.category_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name;

-- View 5: Inventory levels by store and product
CREATE OR REPLACE VIEW inventory_levels AS
SELECT
    s.store_name,
    p.product_name,
    st.quantity AS stock_level
FROM stocks st
JOIN stores s ON st.store_id = s.store_id
JOIN products p ON st.product_id = p.product_id;

-- View 6: Order trends by month
CREATE OR REPLACE VIEW monthly_order_trends AS
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY order_month;

-- View 7: Delayed shipments report
CREATE OR REPLACE VIEW delayed_shipments AS
SELECT
    order_id,
    order_date,
    required_date,
    shipped_date
FROM orders
WHERE shipped_date > required_date;

-- View 8: Customer demographics by location
CREATE OR REPLACE VIEW customer_demographics AS
SELECT
    city,
    state,
    COUNT(customer_id) AS number_of_customers
FROM customers
GROUP BY city, state;
