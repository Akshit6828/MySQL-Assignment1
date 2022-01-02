USE mobile;

/* 1. 
List all the customers who live in any part of CAULFIELD. List only the Customer ID, full name, date of birth and suburb (5 marks)*/

SELECT CustomerId, concat(Given,Surname) as "full name", DOB as "date of birth", Suburb from customer where Suburb = "CAULFIELD"; 
/*SELECT CustomerId, concat(Given,Surname) as "full name", DOB as "date of birth", Suburb from customer group by Suburb having Suburb = "CAULFIELD";*/

/*2.
List all of the active staff. Show their Staff ID, full name and weekly salary assuming that they work a 38 hour week (3 marks)
*/
select * from staff;
SELECT StaffID, concat(Given, Surname), RatePerHour*38 as "Weekly Salary" from staff where Resigned is null;

/* 3.
Which plan has the most expensive contract to break? 
*/
select * from plan;
select PlanName, BreakFee from plan;

/* 4.
Which brands of mobile phone does this company sell? List only the unique brand names
*/
select * from mobile;
select distinct BrandName from mobile; 

/*
5. Which customer is not able to purchase a phone? Use a query to explain why. Hint: Review the customer data
*/
select * from customer;
/*
6. How many of each phone plan have been sold?
*/
select * from plan;
select * from mobile;
select PlanName, count(PlanName) "Count" from mobile group by PlanName;

/*
What is the average age of an Apple phone user?
*/
select * from customer;
select * from mobile;
SELECT avg(YEAR(CURRENT_DATE) - YEAR(c.DOB)) as "Average Age" from customer c ;


/*
What are the first and most recent mobile phone purchases?
*/
select * from mobile;
select * from customer;
select min(Joined) as "First"  , max(Joined) as "Recent" from mobile;

/*
9. i. For calls made in 2018 how many calls were made on the weekend? (5 marks)
ii. For calls made in 2018 how many calls were made on each day of the weekend? (3 marks)
*/
select * from calls;
select CallDate, weekday(CallDate) from calls where CallDate like "2018%";

/*select weekday(CallDate), count(weekday(CallDate)) from calls group by weekday(CallDate) in 
		(select weekday(CallDate) from calls where CallDate like "2018%" and weekday(CallDate) in (5,6));
        
select CallDate, weekday(CallDate), count(weekday(CallDate)) from calls where CallDate like "2018%" and weekday(CallDate) = 3;
select weekday(CallDate), count(weekday(CallDate)) from calls group by weekday(CallDate) having weekday(CallDay) = 5 or weekday(CallDay) = 6;
select weekday(CallDate), count(weekday(CallDate)) as "Count" from calls group by weekday(CallDate);*/
select weekday(CallDate), count(weekday(CallDate)) as "Count" from calls where CallDate like "2018%" group by weekday(CallDate) order by weekday(CallDate) desc limit 2 ;
/*select PlanName, count(PlanName) "Count" from mobile group by PlanName;*/

/* 
10.
Provide a listing of the utilization of each tower and its location i.e. how busy each tower is based on the number of connections. Put the busiest tower at the top of the list (3 marks)
*/

select * from tower;
select * from connect;



/*
12)
The company is upgrading all their 3G towers from to 5G. 
i. How many towers will be upgraded? (1 mark)
ii. what SQL will be needed to update the database to reflect the upgrades? (2 marks)*/
select * from tower;
select count(SignalType) from tower where SignalType = "3G";

/*
13. i. List the full name, join date, resigned date of each staff member and name, join date and resigned date of their manager (3 marks)
ii. What do you observe with the data? (2 marks)
*/
select * from staff;
select concat(Given,Surname) as "Full name" , Joined, Resigned from staff where Resigned is not null;

/*14. How much revenue was generated in 2017 by each plan from call charges. Format the output as currency i.e. $123.45*/

select * from calls;
select * from mobile;
select * from plan;
select MobileID, sum(CallDuration) from calls where CallDate like "2017%" group by MobileID;



/*
List the customers who made phone calls longer than 200 minutes (5 marks)
*/

select * from calls;
select * from mobile;
select * from customer;

select MobileId , sum(CallDuration) from calls where sum(CallDuration) > 200 group by MobileId;



/*
18. List the oldest and the youngest customers in the postcodes 3000 and 3102. Show the customer full name age and suburb details (3 marks)*/

select * from customer;
select concat(Given, Surname) as "Full Name", Suburb from customer having Postcode = "3000" or Postcode = "3102";
select * from customer where PostCode = "3102" or PostCode = "3000" having CustomerID = min(CustomerID) or CustomerID = max(CustomerID);

/*
19. i. Create a view that shows the popularity of each phone colour (1 mark)
ii. Use this view in a query to determine the least popular phone colour (2 marks)
*/

/*
20. The billing team is getting returned mail because of bad customer addresses. This is causing a loss in revenue. 
i. Review the customer data and find at least 3 issues (3 marks)
ii. Provide the SQL statements to correct the data problems (2 marks)

*/
