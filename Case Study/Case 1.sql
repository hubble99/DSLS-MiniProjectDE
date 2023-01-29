-- Total customer tiap tahun
select
	count(OrderID) as TotalCustomer,
	year(OrderDate) as Year
from Orders
group by year(OrderDate)
order by year(OrderDate)

-- Total customer tiap bulan dari tahun 1996-1997
select
	month(OrderDate) as Month,
	year(OrderDate) as Year,
	count(OrderID) as TotalCustomer
from Orders
group by month(OrderDate),year(OrderDate)
order by year(OrderDate), month(OrderDate)

-- 5 negara dengan customer terbanyak pada tahun 1997
select top 5
	c.Country,
	year(o.OrderDate) as Year,
	count(o.OrderID) as TotalCustomer
from Orders o
left join Customers c on o.CustomerID=c.CustomerID
where year(o.OrderDate)='1997'
group by year(o.OrderDate),c.Country
order by count(o.OrderID) desc;

select top 5
	ShipCountry,
	year(OrderDate) as Year,
	count(OrderID) as TotalCustomer
from Orders
where year(OrderDate)='1997'
group by ShipCountry, year(OrderDate)
order by year(OrderDate),count(OrderID) desc;

-- shipper 5 negara yang paling banyak customer
select
	ShipName,
	count(OrderID) as TotalCustomers,
	ShipCountry
from Orders
where year(OrderDate)='1997' and (ShipCountry='Germany' or ShipCountry='USA' or ShipCountry='Brazil' or ShipCountry='France' or ShipCountry='UK')
group by ShipName, ShipCountry
order by count(OrderID) desc