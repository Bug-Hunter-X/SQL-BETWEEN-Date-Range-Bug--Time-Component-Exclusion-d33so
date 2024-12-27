To avoid this issue, explicitly handle the time component.  Here are two solutions:

**1.  Explicit Time Range:**

```sql
SELECT * FROM orders WHERE order_date >= '2023-10-26 00:00:00' AND order_date < '2023-10-28 00:00:00';
```
This method explicitly defines the start and end of the range.  Note that the end date is the *day after* the desired end.

**2.  Using DATE_TRUNC (or equivalent):**

(This solution requires a database-specific function.  `DATE_TRUNC` is used in PostgreSQL, similar functions exist in other systems such as MySQL's `DATE()`).

```sql
SELECT * FROM orders WHERE DATE_TRUNC('day', order_date) BETWEEN '2023-10-26' AND '2023-10-27';
```
This approach truncates the time component from the `order_date` before the comparison, making `BETWEEN` operate correctly on the date portion alone.