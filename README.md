📊 Olist E-Commerce Sales & Customer Analysis


## Overview

This is an end-to-end Data Analytics and Business Intelligence project built using the Olist Brazilian E-Commerce dataset.

The project uses PostgreSQL and SQL for data exploration, validation, and business analysis, and Microsoft Power BI to build an interactive sales and business performance dashboard.

The project focuses on Sales, Customers, Products, Payments, Delivery, and Reviews.

The project follows the complete analytics workflow:

Data → Exploration → Validation → SQL Analysis → Data Model → DAX → Power BI Dashboard → Business Insights

----

## Business Questions

What are the total orders, customers, revenue, and average order value?

Which product categories generate the most revenue?

Which Brazilian states generate the most revenue?

Which payment method is most preferred?

What percentage of orders are delivered on time?

How do delivery performance and review scores relate?

How does revenue change over time?

Which products/categories are the top performers?

----

## Tools Used

PostgreSQL | SQL | Power BI | DAX | Power Query | GitHub

----

## Dataset

The project uses the Olist Brazilian E-Commerce dataset, a relational e-commerce dataset containing information about customers, orders, products, sellers, payments, reviews, product categories, and geolocation.

The project works with the following main tables:

customers | orders | order_items | products | sellers | order_payments | order_reviews | geolocation | product_category_translation

----

## SQL Data Exploration

The first stage of the project was to understand the structure and content of the database.

The exploration SQL includes:

Row counts for the main tables

Sample records from each table

Table structure inspection

Column names and data types

Initial understanding of relationships between tables

----

## Data Validation

Data validation was performed before building the business analysis. The validation process included:

Null-value checks

Some null values were identified in fields where they are logically valid.

For reviews, missing comment titles/messages are expected because a customer can submit a rating without writing a comment.

----

## Duplicate checks

Duplicate checks were performed on important business keys.

The analysis confirmed that the expected tables did not contain duplicate business-key records.

The geolocation table was treated differently because repeated ZIP-code geographic records are expected in that dataset.

----

## Revenue Definition

For the sales analysis, revenue from an order item is calculated using:

Product Price + Freight Value

This allows the dashboard to represent the total monetary value associated with the order item.

Example SQL logic:

SUM(price + freight_value)

The revenue calculation is then used in the Power BI analysis to evaluate revenue by:

Month | Product category | Customer state | Other relevant dimensions

----

## Power BI Dashboard

The dashboard includes:

Total Customers

Total Orders

Total Revenue

Average Order Value

Revenue by Month

Revenue by Customer State

Top Product Categories by Revenue

Payment Method Usage

Delivery Performance

Review Score by Delivery Status

Interactive Filters

Order Date

Product Category

Payment Type

Customer State

----

## Key Findings

Total Customers: ~96K

Total Orders: ~99K

Total Revenue: ~R$15.84M

Average Order Value: ~R$159.33

Approximately 89% of orders were delivered on time

Credit card is the most-used payment method

Health & Beauty is among the leading revenue-generating categories

São Paulo (SP) is the strongest state by revenue in the dashboard

KPI values may change when filters are applied or the source data is refreshed.
