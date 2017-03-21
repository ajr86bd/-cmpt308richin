Lab 6 - Alex Richin

1.
 
select customers.name, customers.city  
from customers 
where customers.city IN ( select city  
                         from products 
                         GROUP BY city 
                         ORDER BY count(quantity) DESC limit 1); 
	
					 
2. 

select name 
from Products 
where priceusd > (select avg(priceusd)  
                  from products) 
                  ORDER BY name desc; 
	
			  
3. 

select customers.name, orders.pid, orders.totalusd 
from orders, customers 
where orders.cid = customers.cid 
order by totalusd desc; 


4. 

select customers.name, coalesce(sum(orders.qty),0) as "customers total"  
from customers left outer join orders on customers.cid = orders.cid 
group by customers.name 
order by customers.name; 

 
5. 

select customers.name as customerName, products.name as productName, agents.name as agentName
from customers, agents, products
where agents.city = 'Newark';

	
6. 

select *  
from orders, customers, products 
where orders.cid = customers.cid and orders.pid = products.pid  
and orders.totalusd != ( products.priceusd * orders.qty * ((100 - customers.discount) / 100))  
and orders.totalusd is not null; 


7. 

The left outer join returns all the rows from the table on the left table, or table1, with the 
matching rows that are on the right table, or table2. However, the result on the right side is 
null if it does not match. 

select customers.name 
from customers left outer join agents 
on customers.name=agents.name; 

The right outer join does pretty much the opposite of what the left outer join does in the sense 
that is returns all the rows from the right table with the matching rows from the left table. 
The result in the left table is null if there is not a match.  

select products.name, products.pid 
from products right outer join orders 
on products.pid=orders.pid; 