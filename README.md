# 🛒 Online Retail Sales Database Design

### 📘 Overview
This project demonstrates the design and implementation of a **normalized relational database** for an **online retail sales system**.  
It models real-world e-commerce operations including **customers, products, orders, payments, and inventory** using **MySQL** and **ER modeling**.

---

## 📑 Table of Contents
- [Abstract](#abstract)
- [Objectives](#objectives)
- [Tools Used](#tools-used)
- [Steps Involved](#steps-involved)
- [Database Schema](#database-schema)
- [ER Diagram](#er-diagram)
- [SQL Files](#sql-files)
- [Sample Queries](#sample-queries)
- [Conclusion](#conclusion)
- [Author](#author)

---

## 🧠 Abstract
The **Online Retail Sales Database Design** project provides a comprehensive data model for e-commerce systems.  
It defines a **normalized (3NF)** schema that supports scalability, data integrity, and analytical reporting.  
The database enables management of customers, orders, and inventory, while supporting **extensions** such as:
- Product variants (sizes, colors)
- Multi-warehouse inventory
- Coupons & discounts
- Returns & refunds

---

## 🎯 Objectives
- Design a normalized SQL schema for an online retail sales platform.  
- Establish entity relationships and apply database normalization (up to 3NF).  
- Generate an ER diagram using **dbdiagram.io**.  
- Implement the schema using **MySQL** with constraints.  
- Create queries and reports to analyze sales data.

---

## 🧰 Tools Used
| Tool | Purpose |
|------|----------|
| **MySQL** | Database creation, queries, and testing |
| **PostgreSQL** | Schema validation and normalization |
| **dbdiagram.io** | ER diagram design and visualization |
| **Python (ReportLab)** | PDF report generation |
| **GitHub** | Version control and project documentation |

---

## 🏗️ Steps Involved
1. **Requirement Analysis** – Identified key entities: Products, Customers, Orders, and Payments.  
2. **ER Diagram Design** – Created in dbdiagram.io to visualize relationships.  
3. **Normalization** – Applied 1NF → 3NF for reduced redundancy.  
4. **SQL Schema Creation** – Defined DDL with primary keys, foreign keys, and constraints.  
5. **Sample Data Insertion** – Populated the schema for testing.  
6. **Advanced Features Added** – Variants, coupons, warehouses, and returns.  
7. **Queries & Views** – Implemented reporting and JOIN operations.

---

## 🧩 Database Schema
Two SQL scripts are provided:
- **`base_mysql.sql`** – Core schema (customers, products, orders, payments, inventories)
- **`extensions_mysql.sql`** – Advanced features (variants, coupons, returns, warehouses)

```sql
-- Example snippet
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


