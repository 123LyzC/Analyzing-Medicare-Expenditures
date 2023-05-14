# Analyzing-Medicare-Expenditures

This repository contains SQL code for analyzing Medicare hospital spending data. The dataset used for this analysis is sourced from [CMS.gov](https://data.cms.gov/provider-data/dataset/rs6n-9qwg). The SQL code performs various operations on the dataset to extract insights and statistics related to Medicare spending and facility scores.

## Code Explanation

The SQL code performs the following operations:

1. Creates a table called `medicare_spending` to store the Medicare hospital spending data.
2. Imports the data from a CSV file into the `medicare_spending` table.
3. Cleans the data by converting the score column to numeric format and handling missing values.
4. Checks for missing and duplicate facility IDs in the dataset.
5. Provides statistics on the number of states and facilities covered by Medicare.
6. Disaggregates the number of facilities by state to identify the states with the highest number of covered facilities.
7. Identifies the facility with the highest and lowest Medicare Spending Per Beneficiary (MSPB) score.
8. Calculates the average MSPB score across all facilities and by state.
9. Filters facilities based on the MSPB score (equal to 1, less than 1, and greater than 1).
10. Utilizes Tableau for data visualization.

## Getting Started

To run the SQL code, follow these steps:

1. Set up a database management system (DBMS) that supports running SQL queries (e.g., MySQL, PostgreSQL).
2. Create a new database and execute the SQL code in a query editor or a DBMS client.
3. Make sure to update the CSV file path in the code to match the location of your dataset.
4. Execute each SQL statement one by one to perform the desired analysis.

## Visualization

To visualize the data, Tableau was used. For a detailed visual analysis of the Medicare hospital spending data, refer to the accompanying Tableau visualizations available at [Tableau Public](https://public.tableau.com/views/medicare_spending3/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link).
