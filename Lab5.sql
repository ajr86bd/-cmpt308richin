1. 
select agents.city 
from agents 
right join orders ON agents.aid = orders.aid 
where orders.cid = 'c006'; 

2.  
select pid 
from orders 
join customers ON customers.cid = orders.cid 
where city = 'Kyoto' 
ORDER BY pid DESC;

3.  
select name  
from Customers 
where NOT cid IN ( 
      select cid  
      from Orders);

4.  
select name  
from customers 
left outer join orders  
ON customers.cid = orders.cid 
where orders.cid IS NULL; 

5.  
select DISTINCT customers.name, agents.name  
from customers, agents, orders 
where customers.city = agents.city 
AND 
orders.aid = agents.aid 
AND  
orders.cid = customers.cid;

6.  
select DISTINCT customers.name, agents.name 
from customers, agents, orders 
where customers.city = agents.city; 

7. 
select customers.name, customers.city 
from customers 
where customers.city IN ( select city 
                         from products 
                         GROUP BY city 
                         ORDER BY count(quantity)limit 1); 
 