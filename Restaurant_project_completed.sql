

-- SQL Restaurant Orders Project :- 


use restaurant_db;

-- View the menu_items table and write a query to find the number of items on the menu.

select * from menu_items;

select count(item_name) from menu_items;  -- this query will show the total numbers of Items:- 32 Items are there in the list.

-- What are the least and most expensive items on the menu?

select item_name, price from menu_items order by price desc; -- Shrimp Scampi is the most expensive and Edamame is the least expensive item on the menu.

-- How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?

select count(item_name) from menu_items where category = 'Italian'; -- Total 9 Italian Items are there in the Menu.
Select item_name, price from menu_items where category = 'Italian' order by price desc; -- Shrimp Scampi is the most expensive and Fettuccine Alfredo is the least expensive Italian item in the list.

-- How many dishes are in each category? What is the average dish price within each category?

select category,count(item_name) from menu_items group by category; -- This Query will show the numbers of dishes in each category.

Select category, avg(price) from menu_items group by category; -- This Query will show the average price of a dish in each category.


-- View the order_details table. What is the date range of the table?

Select * from order_details;

select max(order_date) , min(order_date) from order_details; -- This query will show the maximum and minimum order date to check the date range.

-- How many orders were made within this date range? How many items were ordered within this date range?

select count(distinct order_id) from order_details; -- 5370 orders were made within the date range.

select Count(*) from order_details; -- 12234 items were ordered within the date range.

-- Which orders had the most number of items?

select order_id, count(item_id) as Most_Items from order_details group	by order_id order by Most_Items desc; -- Order number 4305 had the most number of Items

-- How many orders had more than 12 items?

 SELECT 
    COUNT(*)
FROM
    (SELECT 
        order_id, COUNT(item_id) AS Items
    FROM
        order_details
    GROUP BY order_id
    HAVING Items > 12
    ORDER BY Items DESC) AS num_items; -- This query will show numbers of order ID having more than 12 items.
    
    
-- Combine the menu_items and order_details tables into a single table

SELECT 
    *
FROM
    menu_items AS mi
        JOIN
    order_details AS od ON mi.menu_item_id = od.item_id; -- this query will join both the table on inner join 

-- What were the least and most ordered items? What categories were they in?

SELECT 
    COUNT(item_id) AS order_quantity,item_name, category
FROM
    order_details AS od
        JOIN
    menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
order by order_quantity desc;  -- Hamburger is the most ordered and Chicken Tacos is the least ordered items from the menue.

-- What were the top 5 orders that spent the most money?

SELECT 
    order_id, SUM(price) AS total_price
FROM
    order_details AS od
        JOIN
    menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_price DESC limit 5;  -- This query will show the top 5 Orders that spent the most money.


-- View the details of the highest spend order. Which specific items were purchased?

SELECT * from order_details as od join menu_items as mi on od.item_id = menu_item_id where order_id = 440; -- this will show all the details from the order id 440.

SELECT 
    category, COUNT(item_id) as quantity
FROM 
    order_details AS od
        JOIN
    menu_items AS mi ON od.item_id = menu_item_id
WHERE
    order_id = 440
GROUP BY category;    -- By this query we can see that the order ID 440 had most spent on the italian dishes.

-- View the details of the top 5 highest spend orders

SELECT 
    category, order_id, count(item_id) as quantity
FROM
    order_details AS od
        JOIN
    menu_items AS mi ON od.item_id = mi.menu_item_id
WHERE
    order_id IN (440 , 2075, 1957, 330, 2675)
    group by order_id, category;  -- By this query we can see that top 5 most ordered ID had spent more on italian dishes as compared to other dishes so we should add more varities of italian dishes in our restaurant menu.