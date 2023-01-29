--1
select month(o.OrderDate) as Month, year(o.OrderDate) as Year, count(c.CustomerID) as TotalCustomerEveryMonth
from dbo.Customers c
left join dbo.Orders o on c.CustomerID=o.CustomerID
where year(o.OrderDate)='1997'
group by month(o.OrderDate), year(o.OrderDate)

--2
select FirstName+(' ')+LastName as EmployeeName, Title
from dbo.Employees
where Title='Sales Representative'

--3
select top 5
p.ProductName, month(o.OrderDate) as Month, year(o.OrderDate) as Year, sum(od.Quantity) as TotalOrder
from dbo.Products p 
left join dbo.[Order Details] od on p.ProductID=od.ProductID
left join dbo.Orders o on od.OrderID=o.OrderID
where month(o.OrderDate)='1' and year(o.OrderDate)='1997'
group by p.ProductName, month(o.OrderDate), year(o.OrderDate)

--4
select c.CompanyName
from dbo.Customers c
left join dbo.Orders o on c.CustomerID=o.CustomerID
left join dbo.[Order Details] od on o.OrderID=od.OrderID
left join dbo.Products p on od.ProductID=p.ProductID
where p.ProductName='Chai' and year(o.OrderDate)='1997' and month(o.OrderDate)='6'
group by c.CompanyName

--6
select c.CompanyName, sum(od.Quantity) as TotalOrder
from dbo.Customers c
left join dbo.Orders o on c.CustomerID=o.CustomerID
left join dbo.[Order Details] od on o.OrderID=od.OrderID
where year(o.OrderDate)='1997'
group by c.CompanyName
having sum(od.Quantity)> 500
order by sum(od.Quantity) desc

--7
select top 5
p.ProductName, sum(od.UnitPrice) * sum(od.Quantity) as TotalSales, month(o.OrderDate) as Month
from dbo.Products p
left join dbo.[Order Details] od on p.ProductID=od.ProductID
left join dbo.Orders o on od.OrderID=o.OrderID
where year(o.OrderDate)='1997'
group by p.ProductName, month(o.OrderDate)
order by sum(od.UnitPrice) * sum(od.Quantity) desc

--5
select count (OrderID) as 'TotalBuy<=100'
from dbo.[Order Details]
where UnitPrice * Quantity<=100

select count (OrderID) as 'TotalBuy>500'
from dbo.[Order Details]
where UnitPrice * Quantity>500

select count (OrderID) as '100<TotalBuy<=250'
from dbo.[Order Details]
where UnitPrice * Quantity>100
and UnitPrice * Quantity<=250

select count (OrderID) as '250<TotalBuy<=500'
from dbo.[Order Details]
where UnitPrice * Quantity>250
and UnitPrice * Quantity<=500

