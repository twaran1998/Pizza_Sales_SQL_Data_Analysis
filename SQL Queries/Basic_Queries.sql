-- Basic Queries:

--1. Total number of orders placed
```
SELECT COUNT(order_id) AS total_orders
FROM Orders;
```

-- 2. Total revenue generated from pizza sales
```
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM Order_details od
JOIN Pizzas p ON od.pizza_id = p.pizza_id;
```

-- 3. Highest-priced pizza
```
SELECT name, price
FROM Pizzas p
JOIN Pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY price DESC
LIMIT 1;
```

-- 4. Most common pizza size ordered
```
SELECT size, COUNT(size) AS size_count
FROM Pizzas p
JOIN Order_details od ON p.pizza_id = od.pizza_id
GROUP BY size
ORDER BY size_count DESC
LIMIT 1;
```
-- 5. Top 5 most ordered pizza types with quantities
SELECT pt.name, SUM(od.quantity) AS total_quantity
FROM Order_details od
JOIN Pizzas p ON od.pizza_id = p.pizza_id
JOIN Pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;
