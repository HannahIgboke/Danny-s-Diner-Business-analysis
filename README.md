# Danny-s-Diner: Business-analysis

![Danny's Diner](Images/Danny's_diner.png)

## Introduction

Danny, a passionate Japanese food lover, decided to embark on a risky venture in early 2021 by opening a charming little restaurant serving his three favorite dishes: sushi, curry, and ramen. However, after a few months of operation, Danny's Diner is struggling to stay afloat. Danny has then collected some basic data, but he doesn't know how to use it to improve his business. Hence, I am playing the role of a data analyst at Danny’s Diner to help him make data driven decisions and improve his business.


_P.S_:This is challenge 1 — [Danny’s Diner](https://8weeksqlchallenge.com/case-study-1/) of the [8 Weeks SQL Challenge](https://8weeksqlchallenge.com/getting-started/) by Danny Ma. 

## Problem statement


Danny believes that having a deeper understanding of his customers will help him provide a better and more personalized experience for his loyal customers. He also plans to use these insights to help him decide whether to expand his existing customer loyalty program. Danny therefore wants to use his customer data to answer the following business questions:

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

Furthermore, Danny needs help generating some basic datasets from his customer data so that his team can easily inspect the data without needing to use SQL. The summary datasets required include:
- Joined tables from the analysis
- Ranking of customer products for member purchases

## About the Dataset

Danny provided me with a sample of his overall customer data due to privacy issues. The 3 key datasets provided for this analysis are:
- sales
- menu
- members

The Relationship diagram(known as Entity Relationship Diagram - ERD) for these datasets is shown below

![ERD](Images/ERD.PNG)


## Skills demonstrated

The following skills/concepts were demonstrated in the course of this project:
- Exploratory Data Analysis
- SQL table Joins
- Aggregate functions
- Common Table Expressions
- Subqueries
- Window Functions for ranking

## Data Analysis

I used MySQL Workbench to create a [database](SQL_files/Database_creation.sql) for Danny's Diner and for the entire analysis.

### Exploratory data analysis (EDA)
I carried out an EDA on the datasets provided to understand the basic characteristics of data which is essential for developing accurate and meaningful insights from the data. The code for the exploratory data analysis can be found [here](SQL_files/EDA.sql). 

Sales                             |Menu                       |Members
----------------------------------|---------------------------|-------------
![Sales](Images/Sales_table.PNG)  |![Menu](Images/Menu_table.PNG)    |![Members](Images/Members_table.PNG)


### Solutions to Business questions

Solutions to the business questions were written in [SQL codes](SQL_files/Data_analysis.sql) in MySQL relational database

1. What is the total amount each customer spent at the restaurant?

Customer A spent $76 accounting for the highest revenue from the data. Customer B spent $74 and Customer C, $36.

![Solution_1](Images/Solution_one.PNG)


2. How many days has each customer visited the restaurant?

Customer B visited the restaurant six times, Customer A, 4 times and Customer C twice.

 ![Solution_2](Images/Solution_two.PNG)


3. What was the first item from the menu purchased by each customer?

Customer A first ordered sushi on his first visit to the restaurant. Customer B, curry and Customer C, ramen.

![Solution_3](Images/Solution_three.PNG)

4. What is the most purchased item on the menu and how many times was it purchased by all customers?

The most purchased item on the menu is ramen, purchased a total of 8 times by all customers. This is followed by curry, four times and sushi thrice.

![Solution_4](Images/Solution_four.PNG)

5. Which item was the most popular for each customer?

The most popular item for each customer was determined by the number of times each item on the menu was purchased. For customer A, it was ramen. All items(sushi, curry and ramen) were equally popular for customer B whilst customer C purchased ramen more.

![Solution_5](Images/Solution_five.PNG)

6. Which item was purchased first by the customer after they became a member?

A customer becomes a member after registration. After Customer A became a member he ordered ramen while customer B ordered sushi. Customer C is yet to become a member.

![Solution_6](Images/Solution_six.PNG)

7. Which item was purchased just before the customer became a member?

Just before customer A became a member, he purchased sushi and curry. Customer B purchased sushi.

![Solution_7](Images/Solution_seven.PNG)

8. What is the total items and amount spent for each member before they became a member?

Customer A spent a total of $25 on two items(sushi and curry) and Customer B a total of $40 on three items(curry, sushi, and curry).

![Solution_8](Images/Solution_eight.PNG)

9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

Customer B has the most points with 940 points, followed by Customer A with 860 points and customer C with 360 points.

![Solution_9](Images/Solution_nine.PNG)


10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
    
Customer A has 1,370 points by the end of January and customer B a total of 940. 

![Solution_10](Images/Solution_ten.jpg)

### Joined tables from the analysis

With the summary table below, Danny and his team can quickly derive insights without needing to join the underlying tables using SQL. An 'N' against any record shows that as of that date, the customer was not a member. 'Y' shows that the customer was a member as at that date.

![Joined_tables](Images/Joined_tables.PNG)

### Ranking of customer products for member purchases

Danny also required further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases. The null values are for records when customers are not yet part of the loyalty program.

![Ranking](Images/Ranking_of_customer_product.PNG)

## Conclusion and Recommendations

Danny wants to decide whether to expand his existing customer loyalty program or not. From the insights generated I would recommend the following to help Danny expand his customer loyalty and create a personalized experience for his customers:

- Customer C is yet to be a member. Danny should offer a discount on membership and use social media to promote the membership program to convert non-members into members.
- More data on a customer time of arrival and departure, customer feedback, customer preferences, and purchase history should be made available for further analysis and recommendations.
- He should ensure excellent customer service when customers visit the restaurant and encourage them to tell others about the restaurant (this is known as Word-of-mouth marketing).
- Danny should introduce perks and incentives for members such as free delivery for every fifth purchase made per week, and rewards for members who reach the 5,000 point mark.
- Further analysis should be carried out regularly and key KPI's closely monitored to know when to discontinue, decrease or expand customer incentives and perks.

By implementing the recommendations above Danny can boost sales, and profits, reduce the cost of customer acquisition and ensure the longevity of his business.



