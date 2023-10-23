-- Database: product_sales_data

-- DROP DATABASE IF EXISTS product_sales_data;

CREATE DATABASE product_sales_data
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
create table sales_data (
    Order_ID int,
	Product varchar(50) not null,
	Quantity_Ordered int not null,
	Price_Each float not null,
	Order_Date timestamp not null,
	Purchase_Address varchar(150) not null,
	Month int not null,
	Sales float not null,
	City varchar(50) not null,
	Hour int not null
) 	
	
set client_coding = 'ISO_8859_5';
Copy sales_data( Order_ID,Product,Quantity_Ordered,Price_Each,Order_Date,Purchase_Address,Month,Sales,City,Hour)
from 'C:\Users\91977\Desktop\Sales Data.csv'	
delimiter ','
csv header;


/* Sales By Month */

select extract(month from Order_Date) as Months, 
       round(sum(sales)::numeric,2) as total_sales
from sales_data
group by Months	
order by Months asc	


/* Top 5 Sailing product */	

SELECT product, SUM(sales) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales DESC
LIMIT 5
	
	
/* Least 5 Sailing product */	

SELECT product, SUM(sales) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales ASC
LIMIT 5
	
	
/* Top 5 Most Ordered Product */	
	
SELECT product, SUM(quantity_ordered) AS orders
FROM sales_data
GROUP BY product
ORDER BY orders DESC
LIMIT 5
	
	
/* Sales By City */	

SELECT city, SUM(sales) AS total_sales
FROM sales_data
GROUP BY city
ORDER BY total_sales DESC
	
	
/* Sales By Hour */	
	
SELECT hour, SUM(sales)	AS total_sales
FROM sales_data 
GROUP BY hour
ORDER BY total_sales DESC
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	