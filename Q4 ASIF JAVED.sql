-- Q4. Number of units in stock by category and supplier continent
select c.CategoryName as "Product Category",
       case when s.Country in 
				('Uk','Spain','Sweden','Germany','Norway','Denmark','Netherlands','Finland','Itlay','France')
            then 'Europe'
            when s.Country in ('USA','Canada','Brazil')
            then 'America'
            else 'Asia-Pacific'
       end as "Supplier Continent",
       sum(p.UnitsInStock) as UnitsInStock
from Suppliers s
inner join products p on p.SupplierID = s.SupplierID
inner join categories c on c.CategoryID = p.CategoryID
group by c.CategoryName,
         case when s.Country in
                 ('Uk','Spain','Sweden','Germany','Norway','Denmark','Netherlands','Finland','Itlay','France')
			  then 'Europe'
			  when s.Country in ('USA','Canada','Brazil')
              then 'America'
              else 'Asia-Pacific'
		end;