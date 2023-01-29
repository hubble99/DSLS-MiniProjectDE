-- 5 Suplier dengan sales tertinggi pada tahun 1997
select top 5
	s.CompanyName,
	round(sum((od.UnitPrice - (od.Discount * od.UnitPrice))*od.Quantity), 0) as TotalSales
from Suppliers s
left join Products p on s.SupplierID=p.SupplierID
left join [Order Details] od on p.ProductID=od.ProductID
left join Orders o on o.OrderID=od.OrderID
where year(o.OrderDate)='1997'
group by s.CompanyName
order by round(sum((od.UnitPrice - (od.Discount * od.UnitPrice))*od.Quantity), 0) desc

-- 5 nama produk yang memiliki sales tertinggi pada tahun 1997
select top 5
	p.ProductName,
	s.CompanyName,
	round(sum((od.UnitPrice - (od.Discount * od.UnitPrice))*od.Quantity), 0) as TotalSales
from Suppliers s
left join Products p on s.SupplierID=p.SupplierID
left join [Order Details] od on p.ProductID=od.ProductID
left join Orders o on o.OrderID=od.OrderID
where year(o.OrderDate)='1997'
group by p.ProductName, s.CompanyName
order by round(sum((od.UnitPrice - (od.Discount * od.UnitPrice))*od.Quantity), 0) desc
