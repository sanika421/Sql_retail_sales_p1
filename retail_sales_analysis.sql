USE retail_sales_db;
# SQL Retail Sales Analysis:


# Create Table:
CREATE TABLE retail_tb
(
           Transaction_ID INT PRIMARY KEY,
           Date DATE,
           Customer_ID  VARCHAR(10),
		   Gender VARCHAR(8),
           Age INT,
           Product_Category VARCHAR(15),
           Quantity INT,
           Price_Per_Unit FLOAT,
           Total_Amt FLOAT
);

SELECT * FROM retail_tb ;
SELECT COUNT(*) FROM retail_tb;

#Data Cleaning:

SELECT * FROM retail_tb 
WHERE Transaction_ID IS NULL
	  OR
      Date IS NULL
      OR
      Customer_ID IS NULL
      OR
      Gender IS NULL
      OR
      Age IS NULL
      OR
      Product_Category IS NULL
      OR
      Quantity IS NULL
      OR
      Price_Per_Unit IS NULL
      OR
      Total_Amt IS NULL
;

# Data Exploration:

# How many sales we have?
SELECT COUNT(*) AS Total_sales FROM retail_tb;

# How many unique customers we have?
SELECT COUNT( distinct Customer_ID) AS Total_customers FROM retail_tb;

# How many  Product categories we have?
SELECT distinct Product_Category AS Category FROM retail_tb;


# Data Analysis and Business Key Problems & Answers:
# My Analysis and findings:


#Q1. Write a sql query to retrieve all columns for sales made on '2023-11-05'

SELECT * 
FROM retail_tb 
WHERE Date='2023-11-05';

#Q2.Write a sql query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 10 in the month of Oct-2023

SELECT  * 
FROM retail_tb 
WHERE Product_Category='clothing' AND MONTH(date)=10 AND Quantity>=4;


#Q3. Write a sql query to calculate total sales (total_sale)for each category

SELECT Product_Category,COUNT(*) AS total_sale
 FROM retail_tb
 GROUP BY 1;
     
 
 #Q4. Write a sql query to find the average age of customers who purchased items from the 'Beauty' category
 
 SELECT ROUND(AVG(Age),0) Average_age 
 FROM retail_tb 
 WHERE Product_Category='Beauty';
 
 
 #Q5. Write a sql query to find all transactions where total sale is greater than 1000
 
 SELECT * 
 FROM retail_tb 
 WHERE Total_Amt>1000;
 
 
 #Q6. Write a sql query to find the total number of transactions made by each gender in each category
  
  SELECT gender,Product_Category,COUNT(Transaction_ID) AS total_transactions 
  FROM retail_tb 
  GROUP BY 1,2 
  ORDER BY 2;
  
  
  #Q7. Write a sql query to calculate the average sale for each month. Find out best selling month
  
  SELECT ROUND(AVG(Total_Amt),2)AS Average_Sale,MONTH(Date)AS Month 
  FROM retail_tb 
  GROUP BY MONTH(Date) 
  ORDER BY 1 DESC;
  
 
 #Q8. Write a sql query to find Top 5 customers based on the highest total sales
  
 SELECT Customer_ID,SUM(Total_Amt)AS Total_Sale 
 FROM retail_tb 
 GROUP BY Customer_ID 
 ORDER BY 2 DESC LIMIT 5;
  
  
  #Q9. Write a sql query to find the number of unique customers who purchased item from each category 
   
   SELECT Product_Category,COUNT(DISTINCT Customer_ID) AS distinct_customers 
   FROM retail_tb 
   GROUP BY Product_Category;
   
   
   
    