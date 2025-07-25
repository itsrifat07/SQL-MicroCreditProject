
------creating database

create database microcreditaccountsystem
on primary
(
  name = 'microcredit_system',
    filename = 'c:\program files\microsoft sql server\mssql16.mssqlserver\mssql\data\microcredit.mdf',
    size = 25mb,
    filegrowth = 5%,
    maxsize = 100mb
)
log on
(
    name = 'microcredit_system_log',
    filename = 'c:\program files\microsoft sql server\mssql16.mssqlserver\mssql\data\microcredit_log.ldf',
    size = 2mb,
    filegrowth = 1mb,
    maxsize = 50mb
);
go

------login and security stracture

create login rifat with password = 'RAFI329083', default_database = microcreditaccountsystem;
go

alter server role serveradmin add member rifat;
go

use microcreditaccountsystem;
go

create role microcreditrole;
go

alter role db_owner add member microcreditrole;
go

create schema creditschema;
go

grant select, insert, update, delete, execute on schema::creditschema to microcreditrole;
go

create user microcreditdbuser for login rifat with default_schema = creditschema;
go

alter role microcreditrole add member microcreditdbuser;
go

---------creating all tables 

-------1 customers table

create table customers (
    customerid int primary key,
    name varchar(100),
    age int,
    address varchar(255),
    phone varchar(15),
    occupation varchar(100)
);
------- 2 loans table 
create table loans (
    loanid int primary key,
    customerid int,
    loantype int,
    amount decimal(10, 2),
    interestrate decimal(5, 2),
    startdate date,
    enddate date,
    foreign key (customerid) references customers(customerid)
);

---------3 payments table

create table payments (
    paymentid int primary key,
    loanid int,
    paymentamount decimal(10, 2),
    paymentdate date,
    foreign key (loanid) references loans(loanid)
);

-------- 4 loantypes table
create table loantypes (
    loantypeid int primary key,
    typename varchar(100),
    description varchar(200)
);
----------5 branches table
create table branches (
    branchid int primary key,
    branchname varchar(100),
    location varchar(255),
    manager varchar(100)
);
select * from branches
----------6 employees table
create table employees (
    employeeid int primary key,
    name varchar(100),
    branchid int,
    position varchar(100),
    salary decimal(10, 2),
    foreign key (branchid) references branches(branchid)
);
---------7 accounts table
create table accounts (
    accountid int primary key,
    customerid int,
    branchid int,
    accounttype varchar(50),
    opendate date,
    balance decimal(10, 2),
    foreign key (customerid) references customers(customerid),
    foreign key (branchid) references branches(branchid)
);

---------8 transactions table

create table transactions (
    transactionid int primary key,
    accountid int,
    transactiontype varchar(50),
    amount decimal(10, 2),
    transactiondate date,
    foreign key (accountid) references accounts(accountid)
);

-------------9 guarantors table

create table guarantors (
    guarantorid int primary key,
    customerid int,
    name varchar(100),
    phone varchar(15),
    relation varchar(100),
    foreign key (customerid) references customers(customerid)
);

---------- create view

go
create view vw_name2
with schemabinding, encryption
as
select c.customerid, c.name, c.occupation, l.amount, a.accounttype
from dbo.customers as c
join dbo.loans as l on c.customerid = l.customerid
join dbo.accounts as a on c.customerid = a.customerid;
go
------------ cte

with cte as
(
    select c.customerid, c.name, l.amount, t.amount as transactionamount
    from dbo.customers c
    join dbo.loans l on c.customerid = l.customerid
    left join dbo.accounts a on c.customerid = a.customerid
    left join dbo.transactions t on a.accountid = t.accountid
)
select * from cte;

-----------------creating functions 

----------1 scalar-valued function

go
create function dbo.getaccountbalance (@accountid int)
returns decimal(10,2)
as
begin
    declare @balance decimal(10,2);
    select @balance = balance from accounts where accountid = @accountid;
    return @balance;
end;

----------2 table-valued function 
go
create function dbo.gettransactionsbytype (@type varchar(50))
returns table
as
return (
    select t.*
    from transactions t
    join accounts a on t.accountid = a.accountid
    where a.accounttype = @type
);

-----------3 multi-statement table-valued function
go
create function dbo.getguarantorinfo (@customerid int)
returns @data table (
    guarantorname varchar(100),
    phone varchar(15),
    relation varchar(100)
)
as
begin
    insert into @data
    select name, phone, relation
    from guarantors
    where customerid = @customerid;

    return;
end;

------------- stored procedure
go
create procedure getcustomerfulldetails
    @customername varchar(100)
as
begin
    select
        c.name as customername,
        l.loanid,
        lt.typename as loantype,
        l.amount as loanamount,
        a.accountid,
        a.accounttype,
        a.balance,
        g.name as guarantorname
    from customers c
    left join loans l on c.customerid = l.customerid
    left join loantypes lt on l.loantype = lt.loantypeid
    left join accounts a on c.customerid = a.customerid
    left join guarantors g on c.customerid = g.customerid
    where c.name = @customername;
end;

------------creating triggers

----------after insert on transactions 
go
create trigger trg_afterinserttransaction
on transactions
after insert
as
begin
    print 'new transaction added.'
end;
-------------instead of insert on transactions

go
create trigger trg_insteadofinserttransaction
on transactions
instead of insert
as
begin
    if exists (
        select 1
        from inserted i
        left join accounts a on i.accountid = a.accountid
        where a.accountid is null
    )
    begin
        raiserror('invalid accountid. cannot insert transaction.', 16, 1)
        return;
    end;

    insert into transactions(transactionid, accountid, transactiontype, amount, transactiondate)
    select transactionid, accountid, transactiontype, amount, transactiondate
    from inserted;

    print 'transaction inserted successfully using instead of trigger.';
end;
