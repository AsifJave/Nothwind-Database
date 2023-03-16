-- How many sales in a year?--
SELECT 
    YEAR(o.OrderDate) AS OrderYear, COUNT(o.OrderID) AS TotalSales
FROM 
    Orders o 
GROUP BY 
    OrderYear