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
3. **Normalization:** Applied 1NF, 2NF, 3NF, and BNF to enhance data integrity.

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
    HOUR(order_time) AS hour, COUNT(*) AS total_orders
FROM
    orders
GROUP BY hour
ORDER BY hour;
```
**Insight:** Helps in workforce planning and scheduling during peak hours.

#### 3️⃣ **Revenue Contribution by Pizza Type:**
```sql
SELECT 
    p.name,
    SUM(od.quantity * p.price) * 100 / (SELECT 
            SUM(quantity * price)
        FROM
            order_details od2
                JOIN
            pizzas p2 ON od2.pizza_id = p2.pizza_id) AS revenue_percentage
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.name;
```
**Insight:** Guides marketing strategies by identifying high-revenue products.

---

### 📊 **Data Visualization with Python**
```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Sample Data (Replace with actual database query results)
top_pizzas = pd.DataFrame({
    'Pizza Type': ['Pepperoni', 'Margherita', 'BBQ Chicken', 'Hawaiian', 'Veggie'],
    'Total Quantity': [120, 110, 105, 95, 90]
})

order_distribution = pd.DataFrame({
    'Hour': range(24),
    'Total Orders': [5, 8, 15, 20, 30, 50, 70, 85, 100, 95, 90, 80, 75, 60, 50, 40, 35, 45, 60, 85, 90, 95, 60, 30]
})

revenue_contribution = pd.DataFrame({
    'Pizza Type': ['Pepperoni', 'Margherita', 'BBQ Chicken', 'Hawaiian', 'Veggie'],
    'Revenue Percentage': [28, 22, 18, 17, 15]
})

# Visualization for Top 5 Most Ordered Pizza Types
plt.figure(figsize=(7,5))
sns.barplot(x='Total Quantity', y='Pizza Type', data=top_pizzas, palette='viridis')
plt.title('Top 5 Most Ordered Pizza Types')
plt.xlabel('Total Quantity Ordered')
plt.ylabel('Pizza Type')
plt.grid(True, linestyle='--', alpha=0.7)
plt.show()

# Visualization for Order Distribution by Hour
plt.figure(figsize=(10,5))
sns.lineplot(x='Hour', y='Total Orders', data=order_distribution, marker='o', color='blue')
plt.title('Order Distribution by Hour')
plt.xlabel('Hour of Day')
plt.ylabel('Total Orders')
plt.grid(True, linestyle='--', alpha=0.7)
plt.show()

# Visualization for Revenue Contribution by Pizza Type
plt.figure(figsize=(7,5))
sns.barplot(x='Revenue Percentage', y='Pizza Type', data=revenue_contribution, palette='plasma')
plt.title('Revenue Contribution by Pizza Type (%)')
plt.xlabel('Revenue Percentage (%)')
plt.ylabel('Pizza Type')
plt.grid(True, linestyle='--', alpha=0.7)
plt.show()

```

---

### 🏃‍♂️ **How to Run the Project**
1. **Clone Repository:**  
   ```bash
  https://www.twaran1998/SQL_Pizza_Sales_Data_Job_Analysis-.git
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
Find additional SQL queries [here](link-to-queries-folder), including:
- Revenue trends over time  
- Pizza category-wise sales distribution  
- Daily order patterns

---

### 🌐 **Portfolio & Social Links:**  
- [LinkedIn](your-linkedin-link)  
- [GitHub](your-github-link)  
- [Portfolio](your-portfolio-link)

