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

**[ER Diagram](link-to-your-diagram)** 📊

---

### 🧩 **Steps Taken to Reach Conclusions**
1. **Data Collection:** Obtained datasets from web scraping tools, Kaggle, open-source repositories, and public CSV files.
2. **Data Cleaning:** Standardized formats, removed duplicates, and handled null values.
3. **Normalization:** Applied 1NF, 2NF, 3NF, and BNF to enhance data integrity.

---

### 📈 **Key Queries & Insights**
#### 1️⃣ **Top 5 Most Ordered Pizza Types:**
```sql
SELECT p.name, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 5;
```
**Insight:** Optimizes inventory management and promotional efforts.

#### 2️⃣ **Order Distribution by Hour:**
```sql
SELECT HOUR(order_time) AS hour, COUNT(*) AS total_orders
FROM orders
GROUP BY hour
ORDER BY hour;
```
**Insight:** Helps in workforce planning and scheduling during peak hours.

#### 3️⃣ **Revenue Contribution by Pizza Type:**
```sql
SELECT p.name, 
       SUM(od.quantity * p.price) * 100 / 
       (SELECT SUM(quantity * price) FROM order_details od2 JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id) AS revenue_percentage
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.name;
```
**Insight:** Guides marketing strategies by identifying high-revenue products.

---

### 📊 **Data Visualization with Python**
```python
import matplotlib.pyplot as plt
plt.plot(dates, revenue)
plt.title('Revenue Over Time')
plt.xlabel('Date')
plt.ylabel('Revenue')
plt.show()
```

---

### 🏃‍♂️ **How to Run the Project**
1. **Clone Repository:**  
   ```bash
   git clone https://github.com/your-username/pizza-sales-data-analysis.git
   ```
2. **Set Up Database:** Import `pizza_sales_schema.sql` into MySQL/PostgreSQL.
3. **Run Queries:** Execute scripts in the `queries/` folder.
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

