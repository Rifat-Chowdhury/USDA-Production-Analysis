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
   - Calculate the national total milk production for the year 2023.

2. **High-output cheese states (April 2023)**  
   - Find all states with cheese production greater than 100 million in April 2023 and count how many states qualify.

3. **Coffee production over time**  
   - Compute the total coffee production for 2011 as part of a trend review.

4. **Average honey production for 2022**  
   - Calculate the average honey production across all states for 2022.

5. **State reference and ANSI codes**  
   - List all states and their `State_ANSI` codes from `state_lookup`.  
   - Identify the `State_ANSI` code for Florida.  
   - Join states with cheese production for April 2023 (including states with no cheese production) and return the total for New Jersey.

6. **Cross-commodity dairy analysis**  
   - Find the total yogurt production in 2022 for states that also have cheese production data in 2023.

7. **Missing milk data (2023)**  
   - List all states from `state_lookup` that do not appear in `milk_production` for 2023 and report how many there are.

8. **Cheese production availability and conditional analysis**  
   - List all states with their cheese production values for April 2023, including states with no production recorded.  
   - Check whether Delaware produced any cheese in April 2023.  
   - Find the average coffee production for all years where honey production exceeded 1,000,000.

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

