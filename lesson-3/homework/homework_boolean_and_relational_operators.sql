use W3Resource

--1
select * from Inventory.Customer
where grade>100

--2
select * from Inventory.Customer
where grade>100 and city='New York'

--3
select * from Inventory.Customer
where grade>100 or city='New York'

--4
select * from Inventory.Customer
where grade<=100 or city='New York'

--5 not new york and not grater then means if the city is 
--New York or the grade is grater than 100 we should remove
--it in both cases 
select * from Inventory.Customer
where not (grade>100 or city='New York')

--6
select	ord_no,
		purch_amt,
		ord_date,
		customer_id,
		salesman_id from Inventory.Orders
where not(ord_date='2012-09-10' or salesman_id>5005) and  purch_amt>1000

--7 
select  salesman_id, name, city, commission from Inventory.Salesman
where commission between 0.10 and 0.12

--8
select	ord_no, 
		purch_amt,
		ord_date,
		customer_id,
		salesman_id
		from Inventory.Orders
where (purch_amt<200) or not (ord_date>='2012-02-10' and customer_id<3009)

--9
select * from Inventory.Orders
where  not ((ord_date='2012-08-17' or customer_id>3005) and purch_amt<1000)

--10
select from Inventory.Orders
where '% of target'>50 

select ord_no, purch_amt, (purch_amt/6000*100) as achived_target, (100- (purch_amt/6000*100)) as unachived_target from Inventory.Orders
where (purch_amt/6000*100)>50 

--11
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname in ('Dosni', 'Mardy')

--12
select  emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_dept in (47,63)





