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
