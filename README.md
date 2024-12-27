# SQL BETWEEN Date Range Bug

This repository demonstrates a subtle but common error when using the `BETWEEN` operator in SQL queries with date columns containing time components.  The `BETWEEN` operator is inclusive on both ends, leading to unexpected exclusions if the time component is not explicitly considered.  The `bug.sql` file contains the erroneous query, while `bugSolution.sql` provides a corrected version.

## Problem
The `BETWEEN` operator in SQL, when used with dates, can lead to incorrect results if the date columns have a time component.  For instance, `BETWEEN '2023-10-26' AND '2023-10-27'` is inclusive of both dates, but excludes any times after midnight on '2023-10-27'.

## Solution
To account for time components, use explicit comparisons or date truncation functions, as shown in `bugSolution.sql`.