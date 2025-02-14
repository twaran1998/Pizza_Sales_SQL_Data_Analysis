-- creating database to be used 
create database pizzahut;

-- select database to be used 
use pizzahut;

-- check for pizzas
select * from pizzas;

-- check for pizza_types
select * from pizza_types;

-- check for orders
select COUNT(*) from orders; 

-- check for order_details
select COUNT(*) from order_details; 
