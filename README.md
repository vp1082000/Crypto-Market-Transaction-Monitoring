
# Crypto Market Transactions Monitoring (from Hackerrank SQL Advanced Question)

As part of a crypto currency trade monitoring platform, create a query to return a list of suspicious transactions.

Suspicious transactions are defined as:

- A series of two or more transactions occur at intervals of an hour or less
- They are from the same sender
- The sum of transactions in sequence is 150 or greater
A sequence of suspicious transactions may occur over time periods greater than one hour. As an example, there are 5 transactions from one sender for 30 each. They occur at intervals of less than an hour between from 8 AM to 11 AM. These are suspicious and will all be reported as one sequence that starts at 8 AM, ends at 11 AM, with 5 transactions that sum to 150.

The result should have the following columns: _sender_, _sequence_start_, _sequence_end_, _transactions_count_, _transactions_sum_

- _sender_ is the sender's address.
- _sequence_start_ is the timestamp of the first transaction in the sequence.
- _sequence_end_ is the timestamp of the last transaction in the sequence.
- _transactions_count_ is the number of transactions in the sequence.
- _transactions_sum_ is the sum of transaction amounts in the sequence, to 6 places after the decimal
Order the data ascending, first by _sender_, then by _sequence_start_, and finally by _sequence_end_.






