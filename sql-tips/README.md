# ProctorU Guides

Guides is a foundation of best practices used by ProctorU's Engineering &
Design team. It includes best practices for Code Reviewing, Style Rules, and
much more.

---

## SQL Tips

Our services operate on PostgreSQL, and we want to ensure minimal downtime
when we work with our databases. These are tips to ensure our database
operations are optimal for the scale we work at.

### Safe Migrations

Because we have large databases receiving large volumes of queries every day,
we need to make our migrations both safe and fast. The following is a list of
best practices when running migrations for certain scenarios:

| Operation | Method |
|-|-|
| Add an Index | Add the index using the CONCURRENTLY keyword |
| Change column type | Add a new column, change the code to  write to both columns, and backfill the new column |
| Add a column with a default value | Add column, add default as a separate command, and  backfill the column with the default value |
| Add a column with a unique constraint | Add column, add unique index concurrently, and then  add the constraint onto the table |

This information is sourced from [this useful article](https://www.braintreepayments.com/blog/safe-operations-for-high-volume-postgresql/),
which has some more detail on a few of the scenarios here, and some other rarer methods.
