# Meter Reading Database - Normalization
## Why Normalization?
At first we had a single table called `MeterReading` with customer details, meter details, and readings all mixed together. Even though this works for small data, it creates problems when the system grows:

- Customer information is repeated in every reading.
- Reading types (Manual, Automatic, Estimated) are stored as plain text, which is prone to typo errors
- If a customer has multiple meters, their details are duplicated.

To avoid redundancy and maintain data consistency, the design was normalized into separate tables upto 3NF.

---

### Normalized Tables can be viewed inside create_tables.sql , sample and data is added to these tables which can be viewed inside insert_data_into_tables.sql , answers to given queries can be viewed inside query.sql.
