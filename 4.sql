SELECT s.CompanyName,p.ProductName
FROM northwind.categories c
JOIN northwind.products p
ON c.CategoryID = p.CategoryID
JOIN northwind.suppliers s
ON s.SupplierID = p.SupplierID
WHERE CategoryName = "Seafood";