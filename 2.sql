-- This query shows how to use UNION to merge Customers and Suppliers into one result set by identifying them as having different relationships to Northwind Traders - Customers and Suppliers.

select distinct a.CategoryName, 
    b.ProductName, 
    b.QuantityPerUnit, 
    b.UnitsInStock, 
    b.Discontinued
from Categories a
inner join Products b on a.CategoryID = b.CategoryID
where b.Discontinued = 'N'
order by a.CategoryName, b.ProductName;
