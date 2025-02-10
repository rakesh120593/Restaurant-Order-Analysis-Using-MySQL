# Restaurant Order Analysis Using MySQL

### Project Link : https://mavenanalytics.io/project/26826

## Project Summary

This project analyzes a restaurant order dataset from Maven Analytics, consisting of 12,234 rows and two columns: menu_items and order_details. Using MySQL queries, insights were derived by examining menu details, order trends, and combined data analysis to uncover sales trends, customer preferences, and operational insights for data-driven decision-making.



### Steps followed 

- Step 1 : Load data into Mysql workbrench.
- Step 2 : Select the database to start working on it.

        use restaurant_db;

- Step 3 : Write a query to view the menu_items table and to find the number of items on the menu.

        select * from menu_items;

        select count(item_name) from menu_items;

- Step 4 : Write a query to view what are the least and most expensive items on the menu?

        select item_name, price from menu_items order by price desc;

- Step 5 : write a query to check how many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?

        select count(item_name) from menu_items where category = 'Italian';
        Select item_name, price from menu_items where category = 'Italian' order by price desc;
    Total 9 Italian Items are there in the Menu.
    Shrimp Scampi is the most expensive and Fettuccine Alfredo is the least expensive Italian item in the list.
- Step 6 : Write a query to check how many dishes are in each category? What is the average dish price within each category?

        select category,count(item_name) from menu_items group by category;
        Select category, avg(price) from menu_items group by category;
    First Query will show the numbers of dishes in each category.
    Second Query will show the average price of a dish in each category.

- Step 7 : Query to View the order_details table. What is the date range of the table?

        Select * from order_details;

        select max(order_date) , min(order_date) from order_details;
    This query will show the maximum and minimum order date to check the date range.

- Step 8 : write a query to check how many orders were made within this date range? How many items were ordered within this date range?

        select count(distinct order_id) from order_details;
        select Count(*) from order_details;
    5370 orders were made within the date range. 12234 items were ordered within the date range.

- Step 9 : write a query to check which orders had the most number of items?

        select order_id, count(item_id) as Most_Items from order_details group	by order_id order by Most_Items desc;
    Order number 4305 had the most number of Items

- Step 10 : write a query to check how many orders had more than 12 items?

       SELECT 
        COUNT(*)
        FROM
        (SELECT 
        order_id, COUNT(item_id) AS Items
        FROM
        order_details
        GROUP BY order_id
        HAVING Items > 12
        ORDER BY Items DESC) AS num_items;

    This query will show numbers of order ID having more than 12 items.

- Step 11 : write a query to Combine the menu_items and order_details tables into a single table.

        SELECT 
        *
        FROM
        menu_items AS mi
        JOIN
        order_details AS od ON mi.menu_item_id = od.item_id;

    this query will join both the table on inner join.

- Step 12 : Write a query to check what were the least and most ordered items? What categories were they in?

        SELECT 
        COUNT(item_id) AS  order_quantity,item_name, category
        FROM
        order_details AS od
        JOIN
        menu_items AS mi ON od.item_id = mi.menu_item_id
        GROUP BY item_name, category
        order by order_quantity desc;

    Hamburger is the most ordered and Chicken Tacos is the least ordered items from the menu.
    
- Step 13 : Write a query to check what were the top 5 orders that spent the most money?

        SELECT 
        order_id, SUM(price) AS total_price
        FROM
        order_details AS od
        JOIN
        menu_items AS mi ON od.item_id = mi.menu_item_id
        GROUP BY order_id
        ORDER BY total_price DESC limit 5;
    This query will show the top 5 Orders that spent the most money.

- Step 14 : Write a query to view the details of the highest spend order. Which specific items were purchased?

        SELECT * from order_details as od join menu_items as mi on od.item_id = menu_item_id where order_id = 440;
    this will show all the details from the order id 440.

        SELECT 
        category, COUNT(item_id) as quantity
        FROM 
        order_details AS od
        JOIN
        menu_items AS mi ON od.item_id = menu_item_id
        WHERE
        order_id = 440
        GROUP BY category;

    By this query we can see that the order ID 440 had most spent on the italian dishes.
        
- Step 15 : Write a query to view the details of the top 5 highest spend orders.

        SELECT 
        category, order_id, count(item_id) as quantity
        FROM
        order_details AS od
        JOIN
        menu_items AS mi ON od.item_id = mi.menu_item_id
        WHERE
        order_id IN (440 , 2075, 1957, 330, 2675)
        group by order_id, category;
        
    By this query we can see that top 5 most ordered ID had spent more on italian dishes as compared to other dishes so we should add more varities of italian dishes in our restaurant menu.
 

## Snapshots of the queries and results: 

![Image](https://github.com/user-attachments/assets/a2c78dc4-24d8-4528-bcea-96d5e9aba447)

![Image](https://github.com/user-attachments/assets/225f5b6a-d54a-4d05-8f7d-837201b1c955)

![Image](https://github.com/user-attachments/assets/67958b07-5b7e-420d-b9f4-b4acdaa07372)

![Image](https://github.com/user-attachments/assets/7151eed2-c7fb-416c-b558-82e00b103f74)

![Image](https://github.com/user-attachments/assets/ce558385-f901-4174-8690-e1c00fa3c4a7)

![Image](https://github.com/user-attachments/assets/54d44fca-9f58-407a-aa8c-9cda6b7d5922)


## Key Findings:
 
The menu has 32 items across four categories: American, Asian, Mexican, and Italian.

Shrimp Scampi is the most expensive item, while Edamame is the least expensive.

The menu includes 9 Italian dishes, with Fettuccine Alfredo being the least expensive.

A total of 5,370 orders were placed, with 12,234 items ordered within the dataset's date range.

The highest number of items in a single order was Order #4305.

Hamburger was the most ordered item, while Chicken Tacos was the least ordered.

Order #440 had the highest spending, mostly on Italian dishes, suggesting demand for more Italian options.

The top 5 highest-spending orders were from Order IDs: 440, 2075, 1957, 330, and 2675.

These insights help optimize menu offerings, identify customer preferences, and improve restaurant sales strategies.

 # Thank you for reviewing the report!!!
