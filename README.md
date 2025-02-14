# 🍕 **Pizza Sales Data Analysis** – SQL & Python Project

### 🚀 **Project Overview**
This project showcases my SQL and Python skills through pizza sales data analysis, revealing actionable business insights. Using SQL for querying and Matplotlib for visualizations, I extracted insights into sales patterns, revenue drivers, and customer behavior.

### 🔧 **Tools Used:**  
- SQL (MySQL/PostgreSQL)  
- Python (Matplotlib for visualization)  
- Git & GitHub for version control

---

### 📊 **Schema Structure**
- **Orders:** Order details (`order_id`, `order_date`, `order_time`)
- **Order_Details:** Pizza details (`order_details_id`, `order_id`, `pizza_id`, `quantity`)
- **Pizzas:** Pizza attributes (`pizza_id`, `pizza_type_id`, `size`, `price`)
- **Pizza_Types:** Pizza categories and ingredients (`pizza_type_id`, `name`, `category`)

**[ER Diagram](https://github.com/twaran1998/SQL_Pizza_Sales_Data_Job_Analysis-/blob/main/Database%20Schema%20and%20Relationships/pizza_sales_schema.png)** 📊

---

### 🧩 **Steps Taken to Reach Conclusions**
1. **Data Collection:** Obtained datasets from web scraping tools, Kaggle, open-source repositories, and public CSV files.
2. **Data Cleaning:** Standardized formats, removed duplicates, and handled null values.
3. **Normalization:** Applied 1NF, 2NF, 3NF, and BCNF to enhance data integrity.

---

### 📈 **Key Queries & Insights**
#### 1️⃣ **Top 5 Most Ordered Pizza Types:**
```sql
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;

```
**Insight:** Optimizes inventory management and promotional efforts.

#### 2️⃣ **Order Distribution by Hour:**
```sql
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);

```
**Insight:** Helps in workforce planning and scheduling during peak hours.

#### 3️⃣ **Revenue Contribution by Pizza Type:**
```sql
SELECT 
    pizza_types.category,
    ROUND((SUM(order_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(order_details.quantity * pizzas.price),
                                2) AS total_sales
                FROM
                    order_details
                        JOIN
                    pizzas ON pizzas.pizza_id = order_details.pizza_id)) * 100,
            2) AS REVENUE
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY REVENUE DESC;

```
**Insight:** Guides marketing strategies by identifying high-revenue products.

---

### 📊 **Data Visualization with Python**
```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Data from uploaded images
order_data = pd.DataFrame({
    'hour': [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
    'order_count': [1, 8, 1231, 2520, 2455, 1472, 1468, 1920, 2336, 2399, 2009, 1642, 1198, 663, 28]
})

pizza_data = pd.DataFrame({
    'name': ['The Classic Deluxe Pizza', 'The Barbecue Chicken Pizza', 'The Hawaiian Pizza', 'The Pepperoni Pizza', 'The Thai Chicken Pizza'],
    'quantity': [2453, 2432, 2422, 2418, 2371]
})

category_revenue = pd.DataFrame({
    'category': ['Classic', 'Supreme', 'Chicken', 'Veggie'],
    'REVENUE': [26.91, 25.46, 23.96, 23.68]
})

# Orders by Hour Plot
plt.figure(figsize=(10,5))
sns.barplot(x='hour', y='order_count', data=order_data, palette='viridis')
plt.title('Number of Orders by Hour')
plt.xlabel('Hour of the Day')
plt.ylabel('Order Count')
plt.grid(True)
plt.show()

# Top 5 Pizza Types Plot
plt.figure(figsize=(10,5))
sns.barplot(x='quantity', y='name', data=pizza_data.sort_values(by='quantity'), palette='plasma')
plt.title('Top 5 Most Ordered Pizza Types')
plt.xlabel('Quantity Ordered')
plt.ylabel('Pizza Type')
plt.grid(True)
plt.show()

# Revenue by Category Plot
plt.figure(figsize=(8,5))
sns.barplot(x='category', y='REVENUE', data=category_revenue, palette='cubehelix')
plt.title('Revenue by Pizza Category')
plt.xlabel('Pizza Category')
plt.ylabel('Revenue (in thousands)')
plt.grid(True)
plt.show()


```

---

### 🏃‍♂️ **How to Run the Project**
1. **Clone Repository:**  
   ```bash
           https://github.com/twaran1998/SQL_Pizza_Sales_Data_Job_Analysis-.git
   ```
2. **Set Up Database:** Import `pizza_sales_schema.sql` into MySQL/PostgreSQL.
3. **Run Queries:** Execute scripts in the `SQL_Queries/` folder.
4. **Visualize Data:** Install dependencies and run `visualize.py`:
   ```bash
   pip install matplotlib pandas
   python visualize.py
   ```

---

### 📚 **Explore All Queries**  
Find additional SQL queries [here](https://github.com/twaran1998/SQL_Pizza_Sales_Data_Job_Analysis-/tree/main/SQL%20Queries), including:

-Basic: Total orders, revenue, highest-priced pizzas, most common sizes, and top pizza types by quantity.

-Intermediate: Category-wise sales, hourly order patterns, average daily orders, and top revenue-generating pizzas.

-Advanced: Revenue contributions by pizza type, cumulative revenue trends, and top revenue-generating pizzas per category.


---

### 🌐 **Portfolio & Social Links:**  
- [LinkedIn](your-linkedin-link)  
- [GitHub](your-github-link)  
- [Portfolio](your-portfolio-link)

