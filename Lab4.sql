------------------------------------------------------------------
--Lab 4 
------------------------------------------------------------------
--1. 
select city 
from agents 
where agents.aid IN ( select aid 
                    from orders 
                    where cid = 'c006' ); 
 
--2. 
select DISTINCT pid 
from orders 
where cid IN (  
              select cid 
              from customers 
              where city = 'Kyoto' 
             )  
              ORDER BY pid DESC; 
 
 
select aid, pid from orders where cid IN (  
              select cid 
              from customers 
              where city = 'Kyoto') 
              ORDER BY pid DESC; 
 
--3. 
select cid, name 
from customers 
where cid IN ( select cid 
              from orders 
              where aid != 'a01' ); 

 
--4. 
select cid 
from orders 
where pid = 'p01' OR 
pid = 'p07'; 
 
--5. 
select pid
from orders
where aid IN ( select pid
              from orders
			  where aid = 'a08' ); 
 
--6.  
select name, discount, city 
from customers 
where cid IN ( select cid  
              from orders  
              where aid IN ( select aid  
                             from agents  
                             where city = 'Tokyo' OR city = 'New York'));
						
--7.  
select *  
from customers 
where discount IN ( select discount  
                   from customers  
                   where city = 'Duluth' OR city = 'London');
---------------------------------------------------------------------------------------------------------				   
--8. A check constraint is basically just used to limit the range of values that are to be placed onto 
--a column. Defining a check constraint on only one column will allow certain values only in the 
--given column. Defining check constraints on tables will limit the values given in particular 
--columns which are to be based on values that are within other columns in that particular row. 
--Check constraints are proven to be very useful in databases by enforcing rules without adding 
--anymore logic. This is especially good for giving a database “data integrity” and also it helps a 
--lot with databases being consistent.  
 --An example of good usage of a check constraint would be for example you are analyzing 
--the total number of sales amazon has made for this past month. You would need a check 
--constraint to make sure the data outputted would only be relevant meaning data that occurred 
--within the month you are researching and nothing else… Bad usage of check constraints would 
--be to make every datatype null that way every value within the database would be unknown.