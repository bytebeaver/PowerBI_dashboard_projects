select * from pizza_sales

--first chart---->  Daily Trend for Total Orders
SELECT datename(DW, order_date) as order_day, COUNT(distinct order_id)
as total_orders
from pizza_sales 
group by datename(DW, order_date) 

--second chart---> Monthly Trend for Orders
select  datename(month, order_date) , count(distinct order_id) 
as total_orders
from pizza_sales
group by datename(month, order_date)
order by total_orders DESC

--third chart (subquery used) --->percentage of sales by pizza category
select pizza_category,
CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, 
CAST( sum(total_price)*100 / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) as pct
from pizza_sales
group by pizza_category

--for particular month 
select pizza_category,
CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, 
CAST( sum(total_price)*100 / (select sum(total_price) from pizza_sales WHERE month(order_date)=1) AS DECIMAL(10,2)) as pct
from pizza_sales
--WHERE datename(month, order_date)='January'
WHERE month(order_date)=1
group by pizza_category

--fourth chart (subquery used) --->percentage of sales by pizza size
select pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, 
CAST( sum(total_price)*100 / (select sum(total_price) from pizza_sales where  datename(quarter, order_date)=1) AS DECIMAL(10,2)) as pct
from pizza_sales
where  datename(quarter, order_date)=1
group by pizza_size


--fifth chart ---top 5 by revenue
SELECT top 5 pizza_name , CAST(SUM(total_price) AS DECIMAL(10,2)) 
as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue DESC

---top 5 by quantiy
SELECT top 5 pizza_name , CAST(SUM(quantity) AS DECIMAL(10,2)) 
as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity DESC

---top 5 by order_id
SELECT top 5 pizza_name , CAST(count(DISTINCT order_id) AS DECIMAL(10,2)) 
as total_orders
from pizza_sales
group by pizza_name
order by total_orders DESC


--- 5bottom by revenue
SELECT top 5 pizza_name , CAST(SUM(total_price) AS DECIMAL(10,2)) 
as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue ASC

---bottom 5 by quantiy
SELECT top 5 pizza_name , CAST(SUM(quantity) AS DECIMAL(10,2)) 
as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity ASC

--- bottom 5 by order_id
SELECT top 5 pizza_name , CAST(count(DISTINCT order_id) AS DECIMAL(10,2)) 
as total_orders
from pizza_sales
group by pizza_name
order by total_orders ASC