------------------------------------------------------------------------------------
--function PreReqsFor(courseNum)-Returns the immediate prerequisites for the 
--passed-in course number.
------------------------------------------------------------------------------------
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
   course      int		 := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for
      select num, name
	  from courses
	  where num in (select preReqNum
	                from Prerequisites
					where courseNum = course);
	return resultset;
end;
$$
language plpgsql;

select PreReqsFor(220, 'results');
fetch all from results;

------------------------------------------------------------------------------------
--function IsPreReqFor(courseNum)-Returns the courses for which the passed-in course
--number is an immediate pre-requisite.
-------------------------------------------------------------------------------------
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as
$$
declare
   course		int		  := $1;
   resultset	REFCURSOR := $2;
begin
   open resultset for
      select num, name
      from courses
      where num in (select courseNum
					from prerequisites
					where preReqNum = course);
	return resultset;
end;
$$
language plpgsql;

select IsPreReqFor(220, 'results');
fetch all from results;