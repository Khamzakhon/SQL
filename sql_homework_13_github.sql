create database sql_homewor_lesson_13
use sql_homewor_lesson_13

CREATE TABLE #CountSpaces ( texts VARCHAR(100) );
INSERT INTO #CountSpaces(texts) VALUES ('P Q R S '),
									(' L M N O 0 0 '),
									('I am here only '), 
									(' Welcome to the new world '), 
									(' Hello world program'), 
									(' Are u nuts ');
-----#Puzzle 1 
select	texts, 
		len(texts) as text_len,
		REPLACE(texts, ' ', '') as text_without_space, 
		LEN(REPLACE(texts, ' ', '')) as new_len,
		(len(texts)-LEN(REPLACE(texts, ' ', ''))) as numb_spaces
		from #CountSpaces;

--#Puzzle 2
declare @temp_text varchar(max)='AddsfsdfWUES 12*&'
select count(case when SUBSTRING(@temp_text,n,1) like '[A-Z]' then 1 end) as Uppercase,
		count (case when SUBSTRING(@temp_text,n,1) like '[a-z]' then 1 end) as Lowercase,
		count (case when SUBSTRING(@temp_text,n,1) not like  '[A-z]' then 1 end) as othervalues
from (
		select top(LEN(@temp_text)) ROW_NUMBER() over (order by (select null)) as n
		from  master.dbo.spt_values
		) as Tally

--#Puzzle 3
DECLARE @todate datetime, 
		@fromdate datetime; 
SET @fromdate = '2009-01-01'; 
SET @todate = '2009-12-31';
with cte_dates as (
		select  @fromdate as Full_Date,
				DATEPART(yyyy,@fromdate) as Year,
				DATEPART(MM,@fromdate) as Month,
				DATEPART(DAY,@fromdate) as Day,
				DATEPART(WEEKDAY,@fromdate) as Weekday,
				DATEPART(WEEK,@fromdate) as Week_Number
		UNION ALL
		select DATEADD(day,1,Full_Date) as Full_Date,
				DATEPART(yyyy,DATEADD(day,1,Full_Date)) as Year,
				DATEPART(MM,DATEADD(day,1,Full_Date)) as Month,
				DATEPART(DAY,DATEADD(day,1,Full_Date)) as Day,
				DATEPART(WEEKDAY,DATEADD(day,1,Full_Date)) as Weekday,
				DATEPART(WEEK,DATEADD(day,1,Full_Date)) as Week_Number
				from cte_dates
		where Full_Date<@todate

) 
select * from cte_dates
option (maxrecursion 1000);

--#Puzzle 4
CREATE TABLE TestMultipleColumns
				( Id INT NULL, Name VARCHAR(20) NULL );
INSERT INTO TestMultipleColumns VALUES (1, 'Pawan,Kumar'), 
					(2, 'Sandeep,Goyal'), 
					(3, 'Isha,Mattoo'), 
					(4, 'Gopal,Ranjan'), 
					(5, 'Neeraj,Garg'), 
					(6, 'Deepak,Sharma'), 
					(7, 'Mayank,Tripathi');
---Solution 1 
select  Id, 
		SUBSTRING(Name,1,charindex(',',Name,1)-1) as Firstname,
		SUBSTRING(Name,charindex(',',Name,1)+1,LEN(name)-charindex(',',Name,1)) as Lastname		
from TestMultipleColumns

---Solution 2
select * from TestMultipleColumns
select  Id, 
		LEFT(Name,charindex(',',Name,1)-1) as FirstName,
		RIGHT(Name, LEN(Name)-charindex(',',Name,1)) as LastName
from TestMultipleColumns

---The third solutuon did not work in this version of sql
















