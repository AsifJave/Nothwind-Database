-- Q1. Product Sales for 1997
with abc as (SELECT 
  a.CategoryName,
  b.ProductName,
  c.UnitPrice * c.Quantity * (1 - c.Discount) ProductSales,
  CONCAT('Qtr', quarter(d.ShippedDate)) AS ShippedQuarter
FROM categories a
INNER JOIN products b ON a.CategoryID = b.CategoryID
INNER JOIN  `northwind`.`order details` c ON b.ProductID = c.ProductID
INNER JOIN orders d ON d.OrderID = c.OrderID
WHERE d.ShippedDate BETWEEN date('1997-01-01') AND date('1997-12-31')
)
select CategoryName,ProductName,ShippedQuarter, sum(ProductSales)from abc
GROUP BY 
    CategoryName,
    ProductName,
    ShippedQuarter