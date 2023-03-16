-- Q2.Category Sales for 1997
select CategoryName, format(sum(ProductSales), 2) as CategorySales
from
(
 select distinct a. CategoryName,
	b.ProductName,
     FORMAT(sum(c.UnitPrice * c.Quantity * (1 - c.Discount)), 2) AS ProductSales,
     CONCAT('Qtr', quarter(d.ShippedDate)) AS ShippedQuarter
from categories As a
inner join products as b on a.CategoryID = b.CategoryID
inner join `northwind`.`order details` as c on b.ProductID = c.ProductID
INNER JOIN orders as d on d.OrderID = c.OrderID
where d.ShippedDate between date('1997-01-01') and date('1997-12-31')
group by a.CategoryName,
    b.ProductName,
concat('Qtr', quarter(d.ShippedDate))
order by a.CategoryName,
	b.ProductName,
    ShippedQuarter
) as x
group by CategoryName
order by CategoryName;