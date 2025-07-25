
use microcreditaccountsystem;
go

-- 1. customers table
insert into customers (customerid, name, age, address, phone, occupation) values
(1, 'saiful islam', 26, 'feni', '01754327681', 'unemployed'),
(2, 'arafat', 28, 'chittagong', '01832456541', 'network administrator'),
(3, 'fafim', 28, 'lohaghara', '01943256436', 'businessman'),
(4, 'younius', 30, 'rajshahi', '01532145671', 'principal'),
(5, 'sakib', 40, 'nowakhali', '01643256789', 'accountant'),
(6, 'kader', 25, 'barisal', '01765432678', 'student'),
(7, 'nurul', 55, 'coxbazar', '01854325678', 'retired'),
(8, 'meem', 38, 'comilla', '01987654890', 'lawyer'),
(9, 'farzana', 32, 'dinajpur', '01565432456', 'software developer'),
(10, 'jobaier', 42, 'chittagong', '01654325674', 'nurse'),
(11, 'rahim ahmed', 35, 'dhaka', '01712345678', 'teacher');
go

-- 2. loantypes table
insert into loantypes (loantypeid, typename, description) values
(1, 'business loan', 'loan for business purposes'),
(2, 'education loan', 'loan for educational expenses');
go

-- 3. loans table
insert into loans (loanid, customerid, loantype, amount, interestrate, startdate, enddate)
values
(1, 1, 1, 50000.00, 8.5, '2024-01-01', '2025-01-01'),
(2, 2, 2, 75000.00, 9.0, '2024-02-01', '2025-02-01'),
(3, 3, 1, 100000.00, 7.5, '2024-03-01', '2025-03-01'),
(4, 4, 2, 60000.00, 8.0, '2024-04-01', '2025-04-01'),
(5, 5, 1, 80000.00, 7.0, '2024-05-01', '2025-05-01'),
(6, 6, 2, 55000.00, 8.25, '2024-06-01', '2025-06-01'),
(7, 7, 1, 90000.00, 6.5, '2024-07-01', '2025-07-01'),
(8, 8, 2, 70000.00, 8.75, '2024-08-01', '2025-08-01'),
(9, 9, 1, 120000.00, 7.25, '2024-09-01', '2025-09-01'),
(10, 10, 2, 65000.00, 9.5, '2024-10-01', '2025-10-01'),
(11, 11, 1, 95000.00, 7.75, '2024-11-01', '2025-11-01');
go

-- 4. payments table
insert into payments (paymentid, loanid, paymentamount, paymentdate)
values
(1, 1, 6000.00, '2024-02-15'),
(2, 2, 8000.00, '2024-03-20'),
(3, 3, 9000.00, '2024-04-25'),
(4, 4, 7000.00, '2024-05-15'),
(5, 5, 10000.00, '2024-06-10'),
(6, 6, 7500.00, '2024-07-12'),
(7, 7, 8500.00, '2024-08-18'),
(8, 8, 9500.00, '2024-09-22'),
(9, 9, 11000.00, '2024-10-30'),
(10, 10, 6000.00, '2024-11-05'),
(11, 11, 9000.00, '2024-12-10');
go

-- 5. branches table
insert into branches (branchid, branchname, location, manager) values
(1, 'dhaka branch', 'dhaka', 'saiful islam'),
(2, 'chittagong branch', 'chittagong', 'arafat'),
(3, 'sylhet branch', 'sylhet', 'fafim'),
(4, 'khulna branch', 'khulna', 'jobaier'),
(5, 'rajshahi branch', 'rajshahi', 'younius'),
(6, 'barisal branch', 'barisal', 'abdul kader'),
(7, 'comilla branch', 'comilla', 'meem'),
(8, 'mymensingh branch', 'mymensingh', 'farzana'),
(9, 'dinajpur branch', 'dinajpur', 'sakib'),
(10, 'jessore branch', 'jessore', 'nurul');
go

-- 6. employees table
insert into employees (employeeid, name, branchid, position, salary) values
(1, 'rifat', 1, 'branch manager', 80000.00),
(2, 'ismail chowdhury', 2, 'loan officer', 50000.00),
(3, 'mojib', 3, 'accountant', 45000.00),
(4, 'siam', 4, 'customer service representative', 40000.00),
(5, 'hasan', 5, 'branch manager', 75000.00),
(6, 'shariar', 6, 'loan officer', 50000.00),
(7, 'saifullah', 7, 'accountant', 45000.00),
(8, 'niloy', 8, 'customer service representative', 40000.00),
(9, 'tanvir', 9, 'branch manager', 70000.00),
(10, 'mokter', 10, 'loan officer', 50000.00);
go

-- 7. guarantors table
insert into guarantors (guarantorid, customerid, name, relation, phone) values
(1, 1, 'hasan uddin', 'brother', '01722233445'),
(2, 2, 'salma khatun', 'mother', '01823456789'),
(3, 3, 'bashir ahmed', 'uncle', '01934567890'),
(4, 4, 'jamil hossain', 'friend', '01534567891'),
(5, 5, 'nazmul karim', 'cousin', '01723456788'),
(6, 6, 'firoz', 'father', '01788889999'),
(7, 7, 'selina', 'sister', '01888881111'),
(8, 8, 'anwar', 'friend', '01999990000'),
(9, 9, 'hasina', 'aunt', '01666662222'),
(10, 10, 'rashid', 'uncle', '01712344321'),
(11, 11, 'mizanur', 'brother-in-law', '01744556677');
go

-- 8. accounts table
insert into accounts (accountid, customerid, branchid, accounttype, opendate, balance) values
(1, 1, 1, 'savings', '2024-01-10', 5000.00),
(2, 2, 2, 'current', '2024-02-15', 15000.00),
(3, 1, 1, 'fixed deposit', '2024-03-01', 25000.00);
go

-- 9. transactions table
insert into transactions (transactionid, accountid, transactiontype, amount, transactiondate) values 
(1, 1, 'deposit', 5000.00, '2024-01-15'),
(2, 1, 'withdrawal', 2000.00, '2024-01-20'),
(3, 2, 'deposit', 7000.00, '2024-02-10'),
(4, 2, 'withdrawal', 1000.00, '2024-02-15'),
(5, 3, 'deposit', 3000.00, '2024-03-05'),
(6, 3, 'deposit', 6000.00, '2024-03-18'),
(7, 2, 'withdrawal', 1500.00, '2024-04-01'),
(8, 2, 'deposit', 8000.00, '2024-04-10'),
(9, 3, 'withdrawal', 3000.00, '2024-04-20'),
(10, 2, 'deposit', 2500.00, '2024-05-05');
go

------------------- EXAMPLES OF SOME QUIRES FROM MY DATABASE MICROCREDITACCOUNTSYSTEM

-----1 IN

SELECT * FROM Loans
WHERE CustomerID IN (1, 3, 5);

 -----2 BTWEEN

SELECT * FROM Loans
WHERE Amount BETWEEN 50000 AND 80000;

-----3  EXISTS

SELECT Name
FROM Customers
WHERE EXISTS (
    SELECT 1
    FROM Loans
    WHERE Loans.CustomerID = Customers.CustomerID
);

---------4 LIKE

SELECT * FROM customers
WHERE Name LIKE 'A%';

-----5 AND OR, NOT

SELECT * FROM Customers
WHERE (Age > 30 AND Occupation = 'Businessman')
   OR NOT (Address = 'Chittagong');


---------6 ANY

SELECT * FROM dbo.Loans
WHERE Amount > ANY (
    SELECT Amount FROM dbo.Loans WHERE InterestRate > 8
);

---------- 7 ALL

SELECT * FROM dbo.Loans
WHERE Amount > ALL (
    SELECT Amount FROM dbo.Loans WHERE InterestRate < 7
);
----------8 INNER JOIN

SELECT c.Name, l.Amount
FROM dbo.Customers c
INNER JOIN dbo.Loans l ON c.CustomerID = l.CustomerID;

--------- 9 LEFT JOIN

SELECT c.Name, l.Amount
FROM dbo.Customers c
LEFT JOIN dbo.Loans l ON c.CustomerID = l.CustomerID;

---------10 RIGHT JOIN

SELECT c.Name, l.Amount
FROM dbo.Customers c
RIGHT JOIN dbo.Loans l ON c.CustomerID = l.CustomerID;

-----11 UNION

SELECT Name FROM dbo.Customers
UNION
SELECT Name FROM dbo.Employees;

-------------12 UNION ALL

SELECT Name FROM dbo.Customers
UNION ALL
SELECT Name FROM dbo.Employees;

---------13 EXCEPT

SELECT Name FROM dbo.Customers
EXCEPT
SELECT Name FROM dbo.Employees;

------------14 INTERSECT

SELECT Name FROM dbo.Customers
INTERSECT
SELECT Name FROM dbo.Employees;

--------15 GROUPING FUNCTION (GROUP BY )

SELECT c.Name, COUNT(l.LoanID) AS TotalLoans
FROM dbo.Customers c
JOIN dbo.Loans l ON c.CustomerID = l.CustomerID
GROUP BY c.Name;

---------17 HAVING

SELECT c.Name, COUNT(l.LoanID) AS TotalLoans
FROM dbo.Customers c
JOIN dbo.Loans l ON c.CustomerID = l.CustomerID
GROUP BY c.Name
HAVING COUNT(l.LoanID) > 2;

 -------17 MAX MIN, AVG, SUM

SELECT
    MAX(Amount) AS MaxLoan,
    MIN(Amount) AS MinLoan,
    AVG(Amount) AS AvgLoan,
    SUM(Amount) AS TotalLoan
FROM dbo.Loans;

------18 ROLLUP

SELECT BranchID, Position, COUNT(*) AS Total
FROM dbo.Employees
GROUP BY ROLLUP (BranchID, Position);

 ---------19 CUBE

SELECT BranchID, Position, COUNT(*) AS Total
FROM dbo.Employees
GROUP BY CUBE (BranchID, Position);

--------20 GROUPING SETS

SELECT BranchID, Position, COUNT(*) AS Total
FROM dbo.Employees
GROUP BY GROUPING SETS (
    (BranchID, Position),
    (BranchID),
    (Position),
    ()
);

------21GROUPING Function (ROLLUP + GROUPING)

SELECT
    BranchID,
    Position,
    COUNT(*) AS Total,
    GROUPING(BranchID) AS IsBranchTotal,
    GROUPING(Position) AS IsPositionTotal
FROM dbo.Employees
GROUP BY ROLLUP (BranchID, Position);

--------22 COALESCE

SELECT Name, COALESCE(Phone, 'No Phone') AS Contact
FROM dbo.Customers;

----------23 ISNULL

SELECT Name, ISNULL(Phone, 'No Phone') AS Contact
FROM Customers;

---------24 CASE Expression

SELECT Name,
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS AgeGroup
FROM dbo.Customers;

--------[25 CHOOSE Function

SELECT Name, CHOOSE(
    CASE Position
        WHEN 'Branch Manager' THEN 1
        WHEN 'Loan Officer' THEN 2
        ELSE 3
    END,
    10000, 5000, 2000
) AS Bonus
FROM dbo.Employees;

-----------[26 CTE (Common Table Expression)

WITH CustomerLoans AS (
    SELECT c.Name, l.Amount
    FROM dbo.Customers c
    JOIN dbo.Loans l ON c.CustomerID = l.CustomerID
)
SELECT * FROM CustomerLoans;

-----------27 Recursive CTE

WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1 FROM Numbers WHERE Num < 5
)
SELECT * FROM Numbers;

--28----FIRST_VALUE (Window Function)

SELECT p.PaymentID, p.PaymentDate, p.PaymentAmount,
    FIRST_VALUE(p.PaymentAmount) OVER (PARTITION BY p.paymentid ORDER BY p.PaymentDate) AS FirstPayment
FROM dbo.Payments p
JOIN dbo.Loans l ON p.LoanID = l.LoanID;

 ----------29 LAG (Previous row)


SELECT PaymentID, PaymentAmount,
    LAG(PaymentAmount) OVER (ORDER BY PaymentDate) AS PreviousPayment
FROM Payments;

---------30 LEAD (Next row)

SELECT PaymentID, PaymentAmount,
    LEAD(PaymentAmount) OVER (ORDER BY PaymentDate) AS NextPayment
FROM Payments;

--31----ROUND Function

SELECT ROUND(InterestRate, 2) AS RoundedRate FROM dbo.Loans;

 ------------32 CEILING

SELECT CEILING(Amount) AS CeilAmount FROM dbo.Loans;

------------33 FLOOR

SELECT FLOOR(Amount) AS FloorAmount FROM Loans;

 -----------34 CAST

SELECT CAST(Amount AS VARCHAR) AS AmountStr FROM Loans;

-----------35 CONVERT

SELECT CONVERT(VARCHAR, Amount) AS AmountStr FROM Loans;

 ------------36 TRY_CAST

SELECT TRY_CAST(Amount AS INT) AS AmountInt FROM dbo.Loans;

 ------------37 TRY_CAST

 SELECT TRY_CONVERT(INT, Amount) AS AmountInt FROM dbo.Loans;


-----------38 TOP

SELECT TOP 5 * FROM dbo.Loans ORDER BY Amount DESC;

------------39 DISTINCT

SELECT DISTINCT Position FROM dbo.Employees;

 -----------40 OFFSET FETCH 

SELECT * FROM dbo.Loans
ORDER BY LoanID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

 --------------41 INSERT INTO

INSERT INTO dbo.Customers (CustomerID, Name, Age, Address, Phone, Occupation)
VALUES (12, 'Rahim', 35, 'Dhaka', '01712345678', 'Teacher');

 ---------------42 MERGE

MERGE INTO dbo.Customers AS Target
USING (SELECT 11 AS CustomerID, 'Rahim' AS Name) AS Source
ON Target.CustomerID = Source.CustomerID
WHEN MATCHED THEN
    UPDATE SET Name = Source.Name
WHEN NOT MATCHED THEN
    INSERT (CustomerID, Name) VALUES (Source.CustomerID, Source.Name);

---------------43 SUBQUERY

SELECT c.Name, l.Amount
FROM dbo.Customers c
JOIN dbo.Loans l ON c.CustomerID = l.CustomerID
WHERE l.Amount > (
    SELECT AVG(Amount) FROM dbo.Loans
);

------------------44 CALLING VIEW

SELECT * FROM vw_name2;

 -------------45 Calling Scalar Valued Function

DECLARE @ID INT = 2;
DECLARE @name VARCHAR(50);
SET @name = dbo.getaccountbalance(@ID);
SELECT @name AS Name;

------------46 Calling Table-Valued Function

DECLARE @address VARCHAR(255) = 'Chittagong';
SELECT * FROM dbo.gettransactionsbytype(@address);

 -----------47 Calling Multi-Statement Table Function

DECLARE @phone VARCHAR(255) = 'Dhaka';
SELECT * FROM dbo.getguarantorinfo(@address);

------------48 Calling Stored Procedure

EXEC GetCustomerFullDetails'Rahim Ahmed';
