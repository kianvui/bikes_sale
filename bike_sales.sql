SELECT *
FROM bike_sales

--Standardize Date Format

SELECT Date, CONVERT(Date,Date) 
FROM bike_sales

ALTER TABLE bike_sales
ADD New_Date Date;

UPDATE bike_sales
SET New_Date = CONVERT(Date,Date)

-- Breaking out New_date into Individual Columns (year, month, day)
Select YEAR(New_Date),Month(New_Date),Day(New_Date)
FROM bike_sales

ALTER TABLE bike_sales
Add Year int,Month int,Day int;

Update bike_sales
SET Year = YEAR(New_Date)

Update bike_sales
SET Month = Month(New_Date)

Update bike_sales
Set Day = Day(New_Date)


--Create new column(Revenue,Cost and Profit)
SELECT (Order_Quantity*Unit_Price) AS Revenue,(Order_Quantity*Unit_Cost) AS Cost
FROM bike_sales
ORDER BY (Order_Quantity*Unit_Price) DESC,(Order_Quantity*Unit_Cost)DESC

ALTER TABLE bike_sales
Add Revenue float,Cost float,Profit float;

Update bike_sales
SET Revenue= (Order_Quantity*Unit_Price)

Update bike_sales
SET Cost= (Order_Quantity*Unit_Cost)

Update bike_sales
SET Profit= Revenue-Cost


SELECT Revenue,Cost,Profit
FROM bike_sales
ORDER BY Revenue DESC,Cost DESC,Profit DESC

SELECT *
FROM bike_sales

Select Customer_Age
, CASE When  Customer_Age <25 THEN 'Youth (<25)'
	   When  Customer_Age BETWEEN 25 AND 34 THEN 'Young Adults (25-34)'
	   When  Customer_Age BETWEEN 35 AND 64 THEN 'Adults (35-64)'
	   ELSE  'Seniors (64+)'
	   END
From bike_sales

ALTER TABLE bike_sales
ADD Age_group Nvarchar(255);

Update bike_sales
SET  Age_group = CASE When  Customer_Age <25 THEN 'Youth (<25)'
	   When  Customer_Age BETWEEN 25 AND 34 THEN 'Young Adults (25-34)'
	   When  Customer_Age BETWEEN 35 AND 64 THEN 'Adults (35-64)'
	   ELSE  'Seniors (64+)'
	   END
