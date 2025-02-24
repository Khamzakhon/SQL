use W3Resource

--1 
select * from Inventory.Salesman

--2

--3
select (1),(2),(3)

--4
select 10+15 sum_n

--5
select 27-12/(5*5-23)/2 as arithexpr

--6
select name, salesman_id, commission from Inventory.salesman

--7
select	ord_no,
		ord_date, 
		salesman_id, 
		purch_amt 
		from Inventory.Orders

--8
select distinct salesman_id from Inventory.Orders

--9
select  name, city from Inventory.Salesman
where city='Paris'

--10
select * from Inventory.Customer
where grade=200

--11
select ord_no, ord_date, purch_amt from Inventory.Orders
where salesman_id=5001

--12
select year, subject, winner from [dbo].[nobel_win]
where year=1970

--13
select winner from nobel_win
where year=1971 and subject='Literature'

--14
select year, subject from nobel_win
where winner='Dennis Gabor'

--15
select winner from nobel_win
where subject='Physics' and year>=1950

--16
select year, subject, winner, country from nobel_win
where subject='Chemistry' and
year between 1965 and 1975

--17
select * from nobel_win
where year>1972 and
winner in ('Menachem Begin', 'Yitzhak Rabin')

--18
select year, subject, winner, country, category from nobel_win
where winner like 'Louis%'

--19
select year, subject, winner, country, category from nobel_win
where subject='Physics' and year=1970
or subject='Economics' and year=1971

--19
select year, subject, winner, country, category from nobel_win
where  subject='Physics' and year=1970
union 
select year, subject, winner, country, category from nobel_win
where subject='Economics' and year=1971

--20
select year, subject, winner, country, category from nobel_win
where year=1970 and subject not in ('Physiology', 'Economics')

--21
select year, subject, winner, country, category from nobel_win
where subject='Physiology' and year<1971
union 
select year, subject, winner, country, category from nobel_win
where subject='Peace' and year>1974

--22
select year, subject, winner, country, category from nobel_win
where winner='Johannes Georg Bednorz'

--23
select year, subject, winner, country, category from nobel_win
where subject not like 'P%'
order by year desc, winner asc

----24  
select * from nobel_win
where year=1970
order by 
	case 
		when subject in ('Chemistry', 'Economics') then 1 else 0
	end asc, winner 

-- 25
select * from item_mast
where pro_price between 200 and 600

--26
select avg(pro_price) from item_mast
where pro_com=16

--27
select	pro_name as 'Item Name',
		pro_price as 'Price in RS' from item_mast

--28
select pro_name, pro_price from item_mast
where pro_price>=250 
order by pro_price desc, pro_name

--29
select pro_com, avg(pro_price) from item_mast
group by pro_com

--30
select  pro_name, pro_price from item_mast
where pro_price= (select min(pro_price) from item_mast)

--31
select distinct emp_lname from emp_details

--32
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname='Snares'

--33
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_dept=57



