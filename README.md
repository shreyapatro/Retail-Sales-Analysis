# Retail-Sales-Analysis

Retail Sales & Inventory Intelligence Dashboard

An end-to-end data analytics project focused on cleaning raw retail data, performing relational database analysis using SQL, and building an interactive business intelligence dashboard in Power BI.

📊 Project Overview

This project analyzes a comprehensive retail dataset consisting of 9 relational tables and over 4,700 order items. The goal was to transform messy, raw data into actionable business insights regarding sales performance, inventory management, and customer demographics.

🛠️ Tech Stack

Excel: Data cleaning and preprocessing (handling nulls, formatting dates, standardizing text).

SQL (MySQL): Database schema design, data loading, and complex analytical querying (Joins, Aggregations, Views).

Power BI: Data visualization, KPI tracking, and interactive dashboard development.

🔄 Project Workflow

Phase 1: Data Cleaning (Excel)

Standardized date formats and text casing.

Handled missing values and removed duplicates across 9 source files.

Ensured data integrity for relational mapping.

Phase 2: Database Management (SQL)

Designed a relational schema and imported cleaned datasets into MySQL.

Developed 8 custom SQL Views to answer core business questions:

brand_sales_by_store: Tracking top revenue generators by location.

staff_performance: Evaluating sales staff efficiency.

monthly_order_trends: Analyzing growth and seasonality.

delayed_shipments: Monitoring fulfillment logistics.

Phase 3: Data Visualization (Power BI)

Connected Power BI to the MySQL database via the pre-built Views.

Developed a dynamic dashboard featuring:

KPI Cards: Total Revenue ($6.66M), Total Orders, and Total Customers.

Revenue Analysis: Bar charts identifying top product categories (Mountain & Road Bikes).

Trend Analysis: Line charts showing chronological sales growth.

Geospatial Mapping: Bubble maps highlighting customer concentration in NY, CA, and TX.

Interactive Slicers: Dynamic filtering by Date, Store, Brand, and Category.

📈 Key Insights

Top Revenue Drivers: Mountain Bikes and Road Bikes account for the majority of the $6.66M total revenue.

Regional Dominance: The customer base is heavily concentrated in New York, California, and Texas.

Performance Tracking: Identified top-performing stores (e.g., Baldwin Bikes) and staff members through automated reporting views.

📁 Repository Structure

README.md: Main project documentation and overview.

Retail Sales SHREYA PATRO SISINTHY.pdf: Comprehensive final report documenting steps, insights, and visuals.

Retail Stores.pbix: The interactive Power BI dashboard file.

create_views.sql: SQL script containing the database schema and analytical logic.

🚀 How to Run

Import the .xlsx files into a MySQL database named retail_db.

Run the create_views.sql script to generate the analytical layers.

Open the .pbix file in Power BI Desktop and update the data source settings to point to your local MySQL instance.
