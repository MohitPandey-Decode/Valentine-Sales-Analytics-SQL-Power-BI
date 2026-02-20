-- 1. Database
CREATE DATABASE ValentineProject;
USE ValentineProject;

-- 2. Sales table ka structure 
CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    gender VARCHAR(20),
    age INT,
    relationship_type VARCHAR(50),
    months_together INT,
    gift_item VARCHAR(100),
    gift_category VARCHAR(50),
    price DECIMAL(10,2),
    flower_count INT,
    days_prepared INT,
    satisfaction_score INT
);

CREATE TABLE customer_info (
    customer_id INT NOT NULL AUTO_INCREMENT,
    receiver_name VARCHAR(100),
    receiver_email VARCHAR(100),
    PRIMARY KEY (customer_id)
);

-- Q  High Value Customers 
SELECT c.receiver_name, s.gift_item, s.price, s.satisfaction_score
FROM customer_info c
JOIN sales_data s ON c.customer_id = s.id
WHERE s.price > 100 AND s.satisfaction_score >= 4;

-- Q Category Wise Profit & Satisfaction
SELECT gift_category, 
       SUM(price) as Total_Revenue, 
       AVG(satisfaction_score) as Avg_Satisfaction
FROM sales_data
GROUP BY gift_category;

SHOW DATABASES;

ALTER TABLE sales_data
ADD customer_id INT;

ALTER TABLE sales_data
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customer_info(customer_id);


SELECT customer_id, SUM(price) AS Total_Spent
FROM sales_data
GROUP BY customer_id
ORDER BY Total_Spent DESC
LIMIT 5;


SELECT id FROM sales_data LIMIT 670;

