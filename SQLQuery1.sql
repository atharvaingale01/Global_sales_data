
select
	*
from
	Sales

-- Total Revenue accross the Globe
select
	sum(Total_Revenue) as Revenue
from
	Sales

-- Total cost accross the Globe
select
	sum(Total_Cost) as Cost
from
	Sales

-- Total Profit accross the Globe
Select
	sum(Total_Profit) as Profit
from 
	Sales

-- Average selling Price
Select
	round(Sum(Total_revenue)/sum(Units_Sold),2) as AVG_Selling_Price
from	
	Sales

-- Average Unit Cost
Select
	round(AVG(Unit_Cost),2) as AVG_unit_cost
from	
	Sales

-- Gross Profit Margin
Select
	round((Sum(Total_Profit)/sum(Total_Revenue)*100),2) as Gross_Profit
from	
	Sales

-- Sales Quantity
select
	sum(Units_Sold) as Sales_Quantity
from
	Sales

-- Average Order Value
select
	sum(Total_revenue)/count(distinct(order_id)) as Average_Order_Value
from
	Sales

--Order Fulfillment Time
select
	AVG(DATEDIFF(day,Order_Date,Ship_Date)) as Order_Fulfillment
from 
	Sales

-- Sales by Region
select
	Region,
	round(Sum(Total_Revenue),2) as Revenue
from
	Sales
Group by
	Region

-- Sales by Country
select
	Country,
	round(Sum(Total_Revenue),2) as Revenue
from
	Sales
Group by
	Country

-- Sales by Item Type
select
	Item_Type,
	round(Sum(Total_Revenue),2) as Revenue
from
	Sales
Group by
	Item_Type

-- Sales by Sales Channel
select
	Sales_Channel,
	round(Sum(Total_Revenue),2) as Revenue
from
	Sales
Group by
	Sales_Channel

-- Sales by Order Priority
select
	Order_Priority,
	round(Sum(Total_Revenue),2) as Revenue
from
	Sales
Group by
	Order_Priority

-- Top Selling Items
select
	Item_Type,
	round(Sum(Units_Sold),2) as Units
from
	Sales
Group by
	Item_Type
order by 
	Units DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY
-- Other Approach
select TOP 5
	Item_Type,
	round(Sum(Units_Sold),2) as Units
from
	Sales
Group by
	Item_Type
order by 
	Units DESC

-- Profitability by Region
Select
	Region,
	round(sum(Total_profit),2) as Profit
from
	Sales
Group by
	Region
Order by 
	Profit DESC

-- Profitability by Country
Select TOP 10
	Country,
	round(sum(Total_profit),2) as Profit
from
	Sales
Group by
	Country
Order by 
	Profit DESC

