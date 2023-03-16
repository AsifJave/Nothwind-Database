-- ten most expensive products
select distinct ProductName as Ten_Most_Expensive_Products, 
         UnitPrice
from Products as a
where 10 >= (select count(distinct UnitPrice)
                    from Products as b
                    where b.UnitPrice >= a.UnitPrice)
order by UnitPrice desc;
