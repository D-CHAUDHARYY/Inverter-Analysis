
# Inverter Performance Analysis – SQL Project

## Overview

This project focuses on analyzing inverter performance data from a 100 MW solar power plant using SQL queries. The analysis includes KPI monitoring, inverter ranking, block-wise performance comparison, deviation analysis, and identification of best/worst performing inverters.

The project demonstrates practical SQL skills used in solar plant operations and performance monitoring.

---

# Objectives

* Analyze inverter-specific performance
* Identify top and underperforming inverters
* Compare block-wise generation trends
* Calculate plant average specific yield
* Rank inverters based on performance
* Categorize inverter performance dynamically
* Perform deviation analysis from plant average

---

# Technologies Used

* SQL
* MySQL
* Window Functions
* CTEs (Common Table Expressions)
* Aggregate Functions
* CASE Statements
* Joins

---

# Database Tables Used

| Table Name           | Description                                             |
| -------------------- | ------------------------------------------------------- |
| inverter_performance | Stores inverter-wise generation and specific yield data |
| blocks               | Contains block information                              |
| block_kpi            | Stores block-level KPI details                          |
| v_block_summary      | Summary view for block analysis                         |

---

# Key SQL Concepts Implemented

## 1. Aggregate Functions

Used:

* AVG()
* ROUND()
* COUNT()

Purpose:

* Plant average calculation
* Block-wise performance analysis

---

## 2. Window Functions

Used:

* RANK() OVER()

Purpose:

* Overall inverter ranking
* Performance comparison

---

## 3. Common Table Expressions (CTEs)

Used for:

* Top performing b
