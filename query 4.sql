-- Which products are in which categories?--
SELECT 
    p.ProductName, c.CategoryName
FROM 
    Products p 
    JOIN Categories c ON p.CategoryID = c.CategoryID