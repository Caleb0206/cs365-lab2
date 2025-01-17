create table Customer (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	ssn VARCHAR(20) UNIQUE NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(100) UNIQUE,
	phone_number VARCHAR(15)
);
insert into Customer (ssn, name, address, phone_number) 
	values ('223', 'Abby', '123 Corner Rd.', '4085001111'), 
			('8888', 'Dustin', '123 Main St.', '4089999990');
select * from Customer;
drop table Customer;

create table CreditCard (
	number INTEGER PRIMARY KEY,
	type ENUM('Visa', 'MC', 'American_Express','Discover') NOT NULL,
	credit_limit DECIMAL(10,2) NOT NULL,
	balance DECIMAL(10,2) DEFAULT 0,
	active BOOLEAN DEFAULT FALSE
);
insert into CreditCard (number, type, credit_limit, balance)
	values (1234567, 'Visa', 5000, 0), (1111111, 'Discover', 1000, 20);

select * from CreditCard;
drop table CreditCard;

create table Ownership (
	customer_id INTEGER,
    card_number INTEGER,
    is_current BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (customer_id, card_number),
    FOREIGN KEY (customer_id) references Customer(id),
    FOREIGN KEY (card_number) references CreditCard(number)
);
insert into Ownership(customer_id, card_number, is_current)
	values (1, 1234567, true), (1, 1111111, true);
insert into Ownership(customer_id, card_number, is_current)
	values (2, 1234567, true), (2, 1111111, true);

UPDATE Ownership SET is_current = FALSE WHERE customer_id = 1 AND card_number = 1111111;

select * from Ownership;
drop table Ownership;

create table Vendor (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
insert into Vendor(name, location)
	values ('Macys', '91 Main St., Seattle, Washington');
select * from Vendor;

create table Transaction (
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    customer_id INT NOT NULL,
    card_number INT NOT NULL,
    vendor_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) references Customer(id),
    FOREIGN KEY (card_number) references CreditCard(number),
    FOREIGN KEY (vendor_id) references Vendor(id)
);
insert into Transaction(date, customer_id, card_number, vendor_id, amount)
	values ('2025-01-01', 1, 1234567, 1, 99.99),
			('2025-04-01', 2, 1234567, 1, 20.0);
select * from Transaction;
drop table Transaction;

create table Payment (
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    card_number INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (card_number) references CreditCard(number)
);
insert into Payment(date, card_number, amount)
	values ('2025-01-12', 1234567, 50);
select * from Payment;
drop table Payment;


select * from Customer;
select * from CreditCard;
select * from Ownership;
select * from Vendor;
select * from Transaction;
select * from Payment;
