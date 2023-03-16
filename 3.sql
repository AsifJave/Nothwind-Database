-- CREATE VIEW ProductDetails AS
SELECT
p.ProductID,S.CompanyName,
p.ProductName,c.CategoryName, c.Description,
p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder,
p.ReorderLevel, p.Discontinued
FROM northwind.suppliers s
JOIN northwind.products p ON s.SupplierID = p.SupplierID
JOIN northwind.categories c
ON c.CategoryID = p.CategoryID;
