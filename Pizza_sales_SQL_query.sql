select * from pizza_sales

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

SELECT pizza_category, SUM(total_price) AS Total_sales, 
SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)= 1) 
as PCT_sales
FROM pizza_sales 
WHERE MONTH(order_date) = 1 
GROUP BY pizza_category 

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales, 
cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as decimal(10,2))
as PCT_sales
from pizza_sales 
group by pizza_size
order by PCT_sales desc

select top 5 pizza_name, sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue desc

select top 5 pizza_name, sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue asc

select top 5 pizza_name, sum(quantity) as Total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity desc

select top 5 pizza_name, sum(quantity) as Total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity asc

select top 5 pizza_name, count(distinct order_id) as Total_orders
from pizza_sales
group by pizza_name
order by Total_orders desc

select top 5 pizza_name, count(distinct order_id) as Total_orders
from pizza_sales
group by pizza_name
order by Total_orders asc