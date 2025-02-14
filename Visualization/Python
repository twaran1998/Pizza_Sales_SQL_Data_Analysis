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
