create view v_OrderDetails
as
select
	od.OrderID,
	od.ProductID,
	p.ProductName,
	od.UnitPrice,
	od.Quantity,
	od.Discount,
	od.UnitPrice - (od.Discount * od.UnitPrice) as FinalPrice
from dbo.[Order Details] od
left join dbo.Products p on od.ProductID=p.ProductID

create procedure Customer @CustomerID varchar(30)
as
select
	c.CustomerID,
	c.CompanyName,
	c.ContactName,
	o.OrderID,
	o.OrderDate,
	o.RequiredDate,
	o.ShippedDate
from dbo.Customers c
left join dbo.Orders o on c.CustomerID=o.CustomerID
where c.CustomerID = @CustomerID

exec Customer @CustomerID = 'ALFKI'
select * from DBO.SYSOBJECTS where type = 'P'