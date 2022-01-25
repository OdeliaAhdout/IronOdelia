USE bank

SELECT * FROM client;

-- Q1: Get the id values of the first 5 clients from district_id with a value = 1
SELECT client_id FROM client
WHERE district_id = 1
LIMIT 5;

-- Q2: In the client table, get an id value of the last client where the district_id equals to 72.
SELECT max(client_id) FROM client
WHERE district_id = 72;

-- Q3: Get the 3 lowest amounts in the loan table.
SELECT amount FROM loan
ORDER BY amount
LIMIT 3;

-- Q4: What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT * FROM loan;
SELECT distinct status FROM loan
order by status

-- Q5: What is the loan_id of the highest payment received in the loan table?
SELECT loan_id FROM loan
ORDER BY payments DESC
LIMIT 1;

-- Q6: What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT account_id, amount FROM loan
ORDER BY account_id
LIMIT 5;
-- [order by 1 instead of account_id] 

-- Q7: What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id FROM loan
WHERE duration = 60 
ORDER BY amount  
LIMIT 5;

-- Q8: What are the unique values of k_symbol in the order table?
SELECT * FROM `order`;
SELECT distinct k_symbol FROM `order`
WHERE k_symbol <> ''

-- Q9: In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id FROM `order`
WHERE account_id = 34

/* Q10: In the order table, which account_ids were responsible for orders 
between order_id 29540 and order_id 29560 (inclusive)? */
SELECT account_id FROM `order`
WHERE order_id >= 29540  and order_id <= 29560;

-- Q11: In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT distinct amount FROM `order`
WHERE account_to = 30067122

/* Q12: In the trans table, show the trans_id, date, type and amount 
of the 10 first transactions from account_id 793 
in chronological order, from newest to oldest.*/
SELECT * FROM trans;
SELECT trans_id, date, type, amount FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10; 

