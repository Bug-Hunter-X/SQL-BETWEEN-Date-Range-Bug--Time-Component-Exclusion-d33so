In SQL, a common yet subtle error arises when using `BETWEEN` with dates.  Consider this query:

```sql
SELECT * FROM orders WHERE order_date BETWEEN '2023-10-26' AND '2023-10-27';
```

This *appears* to select orders from October 26th *to* October 27th, inclusive. However, if `order_date` includes a time component (e.g., '2023-10-27 00:01:00'), this record will be *excluded*.  `BETWEEN` is inclusive on both ends, so it selects only values where `order_date` is greater than or equal to '2023-10-26 00:00:00' and *less than or equal to* '2023-10-27 00:00:00'.