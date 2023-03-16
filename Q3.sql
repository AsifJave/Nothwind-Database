-- Q3. Quarterly Orders by Product
select a.ProductName,
    d.CompanyName,
    year(OrderDate) as OrderYear,
    format(sum(case quarter(c.OrderDate) when '1'
         then b.UnitPrice*b.Quantity*(1-b.Discount) else 0 end), 0) "Qtr 1",
	format(sum(case quarter(c.OrderDate) when '2'
         then b.UnitPrice*b.Quantity*(1-b.Discount) else 0 end), 0) "Qtr 2",
	format(sum(case quarter(c.OrderDate) when '3'
         then b.UnitPrice*b.Quantity*(1-b.Discount) else 0 end), 0) "Qtr 3",
         format(sum(case quarter(c.OrderDate) when '4'
         then b.UnitPrice*b.Quantity*(1-b.Discount) else 0 end), 0) "Qtr 4"
from products a 
inner join  `northwind`.`order details` b on a.ProductID = b.ProductID
inner join orders c on c.OrderID = b.OrderID
inner join customers d on d.CustomerID = c.CustomerID
where  c.OrderDate between date('1997-01-01') and date('1997-12-31')
group by a.ProductName,
d.CompanyName,
year(OrderDate)
order by a.ProductName, d.CompanyName;       