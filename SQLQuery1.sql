select * from pizza_sales

--KPI's
--Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

--total pizza sold
select SUM(quantity) as Total_pizza_sold from pizza_sales

--total orders placed
select MAX(order_id) from pizza_sales

--average pizzas per order
select SUM(quantity)/COUNT(DISTINCT order_id) as Avg_pizzas_per_order from pizza_sales

--to get decimal output
select CAST( SUM( quantity ) AS DECIMAL(10,2) ) / CAST( count( DISTINCT order_id ) AS DECIMAL(10,2) ) 
as Avg_pizzas_per_order from pizza_sales

--pehle sirf numenator and denominator ko typecast kr rhe the upto 2 decimal places and now the result is getting typecasted as decimal upto 2 decimal places
select CAST( CAST( SUM( quantity ) AS DECIMAL(10,2) ) / CAST( count( DISTINCT order_id ) AS DECIMAL(10,2) ) AS DECIMAL(10,2) ) 
as Avg_pizzas_per_order from pizza_sales