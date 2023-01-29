-- 5 produk yang paling banyak diorder pada tahun 1997
select top 5
p.ProductName, sum(od.Quantity) as TotalOrder
from dbo.Products p 
left join dbo.[Order Details] od on p.ProductID=od.ProductID
left join dbo.Orders o on od.OrderID=o.OrderID
where year(o.OrderDate)='1997'
group by p.ProductName
order by sum(od.Quantity) desc

-- penjualan Gnocchi di nonna Alice tiap bulan pada tahun 1997
select month(o.OrderDate) as Month, sum(od.Quantity) as TotalOrder
from dbo.[Order Details] od
left join dbo.Orders o on od.OrderID=o.OrderID
left join dbo.Products p on p.ProductID=od.ProductID
where year(o.OrderDate)='1997' and p.ProductName='Gnocchi di nonna Alice'
group by month(o.OrderDate)

-- penjualan Raclette Courdavault tiap bulan pada tahun 1997
select month(o.OrderDate) as Month, sum(od.Quantity) as TotalOrder
from dbo.Products p 
left join dbo.[Order Details] od on p.ProductID=od.ProductID
left join dbo.Orders o on od.OrderID=o.OrderID
where year(o.OrderDate)='1997' and p.ProductName='Raclette Courdavault'
group by month(o.OrderDate)


