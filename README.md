##🍕 Pizza Sales Data Analysis – SQL & Python Project

#🚀 Project Overview

This project involves analyzing pizza sales data to uncover key insights using SQL queries and visualizations in Python. By applying data cleaning, normalization, and advanced SQL queries, this project demonstrates my ability to extract actionable business insights. I also visualized the results using Matplotlib to better communicate the data-driven findings.

#🔧 Tools Used:

SQL (MySQL/PostgreSQL)

Python (Matplotlib for data visualization)

Git & GitHub for version control

#📊 Schema Structure

The project uses a relational database schema with the following tables:

Orders: Stores order details (order_id, order_date, order_time).

Order_Details: Contains the details of each pizza ordered (order_details_id, order_id, pizza_id, quantity).

Pizzas: Information about each pizza (pizza_id, pizza_type_id, size, price).

Pizza_Types: Categories and ingredients of pizzas (pizza_type_id, name, category, ingredients).



The tables are connected using foreign keys:

Orders to Order_Details via order_id.

Order_Details to Pizzas via pizza_id.

Pizzas to Pizza_Types via pizza_type_id.

#🧑‍💻 Steps Taken to Reach the Conclusion

Data Collection:Data was collected from various sources including web scraping tools, Kaggle datasets, open-source data repositories, and public CSV files.

Data Cleaning:The dataset was cleaned using the following SQL commands:

Handling NULL values

Removing duplicates

Standardizing date and time formats

Data Normalization:The data was normalized to 1NF, 2NF, 3NF, and BNF to eliminate redundancy and improve data integrity.

Check the GitHub repository for the detailed SQL scripts.

#📈 Queries & Insights

The following queries were used to generate insights, with results visualized in Python:

1. Top 5 Most Ordered Pizza Types

This query identifies the top 5 most popular pizzas based on the quantity ordered.

SELECT p.name AS pizza_type, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 5;

Insight: Helps businesses optimize inventory and plan promotional campaigns.

2. Distribution of Orders by Hour of the Day

This query analyzes the distribution of orders throughout the day to identify peak times.

SELECT HOUR(o.order_time) AS order_hour, COUNT(*) AS total_orders
FROM orders o
GROUP BY order_hour
ORDER BY order_hour;

Insight: Assists in adjusting staffing levels and delivery schedules to align with peak demand hours.

3. Revenue Contribution of Each Pizza Type

This advanced query calculates the percentage of total revenue contributed by each pizza type.

SELECT p.name AS pizza_type, 
       (SUM(od.quantity * p.price) / (SELECT SUM(od2.quantity * p2.price) 
                                      FROM order_details od2 
                                      JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id)) * 100 AS revenue_percentage
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.name
ORDER BY revenue_percentage DESC;

Insight: This query is crucial for understanding which pizzas are driving the highest revenue and should be prioritized for marketing and inventory purposes.

#📊 Data Visualization Using Python

In addition to SQL analysis, I used Python's Matplotlib library to visualize the following insights:

Sales Trends Over Time

Revenue Breakdown by Pizza Type

Order Distribution by Hour

import matplotlib.pyplot as plt
plt.plot(dates, revenue)
plt.title('Revenue Over Time')
plt.xlabel('Date')
plt.ylabel('Revenue')
plt.show()

#📅 Conclusion & Learnings

Key Insights:

The top 5 most ordered pizzas and their quantities.

The busiest hours of the day for orders.

The revenue contribution of each pizza type to total sales.

Learnings:

I deepened my SQL query and data manipulation skills.

Gained hands-on experience in using Python for data visualization.

Developed a clearer understanding of how data insights can drive business decisions.

Future Scope:

Integrating predictive analytics to forecast sales.

Expanding the dataset to include customer demographic data for deeper analysis.

#🌐 Links & Portfolio

LinkedIn

GitHub

Portfolio

#🏃‍♂️ How to Run the Project

Follow these steps to run the project locally:

Clone the repositoryRun the following command in your terminal or command prompt:

git clone https://github.com/your-username/pizza-sales-data-analysis.git

Set up the database

Import the SQL file pizza_sales_schema.sql into your database management system (MySQL/PostgreSQL).

Ensure that the database is set up with the correct schema and sample data.

Run the SQL queries

Open your SQL client and execute the queries in the queries/ directory to explore different insights.

Run Python Visualizations

Install the required Python packages:

pip install matplotlib pandas

Run the Python script visualize.py to see the visualized data.

#📚 Other Queries Worked On

You can explore all the other SQL queries I've worked on in the queries folder. This includes additional analysis such as:

Revenue distribution by pizza type category

Order statistics over multiple days

Customer segmentation (if applicable)
