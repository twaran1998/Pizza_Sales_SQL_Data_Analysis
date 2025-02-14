-- Advanced:

-- 1)  Calculate the percentage contribution of each pizza type to total revenue.

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


-- 2) Analyze the cumulative revenue generated over time.

SELECT order_date,
sum(revenue) over(order by order_date) as cum_revenue
FROM 
(
select orders.order_date,
sum(order_details.quantity * pizzas.price) as revenue
FROM order_details JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN orders
ON orders.order_id= order_details.order_id
GROUP BY orders.order_date
)as Sales;




-- 3) Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, revenue FROM 
(select category, name ,revenue ,
rank() over(partition by category order by revenue desc ) as rn 
from 
(
select pizza_types.category,pizza_types.name,
 sum((order_details.quantity) * pizzas.price) as revenue 
 from pizza_types join pizzas
 on pizza_types.pizza_type_id=pizzas.pizza_type_id
 join order_details
 on order_details.pizza_id=pizzas.pizza_id
 group by pizza_types.category,pizza_types.name) as a) as b 
where rn <= 3 ;


