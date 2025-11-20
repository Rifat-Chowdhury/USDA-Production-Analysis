![SQL](https://img.shields.io/badge/SQL-Analysis-blue)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-Portfolio-green)
![SQLite](https://img.shields.io/badge/Database-SQLite-orange)
![DBeaver](https://img.shields.io/badge/Tool-DBeaver-lightgrey)
![USDA Data](https://img.shields.io/badge/Data-USDA%20Production-yellow)

# USDA Agricultural Production SQL Analysis

This project showcases end-to-end data analysis using real-world style agricultural data from the United States Department of Agriculture (USDA). The focus is on using SQL to explore multi-year, multi-commodity production data across U.S. states and answer business-oriented questions.

## Repository Structure

```
USDA-Production-Analysis/
│
├── Data/                # Raw CSV files (milk, cheese, honey, yogurt, eggs, coffee, states)
│
├── analysis/            # Query scripts answering Questions 1–10
│
├── cleaning/            # SQL scripts to clean imported CSV data
│
├── results/             # Screenshots of SQL query outputs
│
└── README.md            # Project documentation
```


---

## Business Questions Answered with SQL

The project is organized around realistic questions a manager or stakeholder might ask a Data Analyst:

1. **Total milk production for 2023**  
   -  The national total milk production for the year 2023 was 91,812,000,000.

2. **High-output cheese states (April 2023)**  
   - In April 2023, only two states produced more than 100 million pounds of cheese: California (208,007,000) and Wisconsin (289,699,000). These two states were the highest producers for that month.

3. **Coffee production over time**  
   - In 2011, the total coffee production across all states was 7,600,000 pounds.

4. **Average honey production for 2022**  
   - In 2022, the average honey production across all states was 3,133,275 pounds.

5. **State reference and ANSI codes**  
   - 50 states and their `State_ANSI` codes from `state_lookup` were retrieved.  
   - The `State_ANSI` code for Florida was 12.  

6. **Cross-commodity dairy analysis**
   - There was 50 states with their cheese production values (including no production)
   - Total cheese production for NEW JERSEY in April 2023 was 4,889,000

7. **Cross-Commodity Dairy Analysis (Yogurt 2022 for Cheese-Producing States in 2023)**  
   - 1,171,095,000 pounds was the total yogurt production for states in the year 2022 that also have cheese production data from 2023

8. **Missing Milk Production Data (2023)s**  
   - 26 States were missing milk production data in 2023

9. **Delaware Cheese Production Availability (April 2023)**
   - Delaware did not produce any cheese in April 2023. 
   
10. **Coffee production availability and conditional analysis**
   - Average coffee production for years where honey > 1 million  was 6,426,666.666666667

---

## How to Use

1. Import the CSV files into your preferred relational database (e.g., SQL Server, PostgreSQL, MySQL, or SQLite) as tables with the same names:
   - `milk_production`
   - `cheese_production`
   - `coffee_production`
   - `honey_production`
   - `yogurt_production`
   - `egg_production`
   - `state_lookup`

2. Ensure the `Value` column is stored as a numeric type.  
   - If imported as text with commas (e.g., `3,543,000,000`), you can use functions like `REPLACE` and `CAST` in SQL to convert to a numeric type.

3. Run the SQL scripts in the `sql/` folder (one script per question) to reproduce the analysis.

---

```mermaid
erDiagram
    STATE_LOOKUP {
        int State_ANSI
        string State
    }

    MILK_PRODUCTION {
        int Year
        string Period
        string Geo_Level
        int State_ANSI
        string Commodity_ID
        string Domain
        int Value
    }

    CHEESE_PRODUCTION {
        int Year
        string Period
        string Geo_Level
        int State_ANSI
        string Commodity_ID
        string Domain
        int Value
    }

    COFFEE_PRODUCTION {
        int Year
        string Period
        string Geo_Level
        int State_ANSI
        string Commodity_ID
        int Value
    }

    HONEY_PRODUCTION {
        int Year
        string Period
        string Geo_Level
        int State_ANSI
        string Commodity_ID
        int Value
    }

    YOGURT_PRODUCTION {
        int Year
        string Period
        string Geo_Level
        int State_ANSI
        string Commodity_ID
        string Domain
        int Value
    }

    EGG_PRODUCTION {
        int Year
        string Period
        string Geo_Level
        int State_ANSI
        string Commodity_ID
        int Value
    }

    STATE_LOOKUP ||--o{ MILK_PRODUCTION : has
    STATE_LOOKUP ||--o{ CHEESE_PRODUCTION : has
    STATE_LOOKUP ||--o{ COFFEE_PRODUCTION : has
    STATE_LOOKUP ||--o{ HONEY_PRODUCTION : has
    STATE_LOOKUP ||--o{ YOGURT_PRODUCTION : has
    STATE_LOOKUP ||--o{ EGG_PRODUCTION : has

