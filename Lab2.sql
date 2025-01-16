create table Customer (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	ssn VARCHAR(20) UNIQUE NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(100) UNIQUE,
	phone_number VARCHAR(15)
);
insert into Customer (ssn, name, address, phone_number) 
	values ('8888', 'Dustin', '123 Main St.', '4089999990'),
			('223', 'Abby', '123 Corner Rd.', '4085001111');
select * from Customer;
drop table Customer;

create table CreditCard (
	number INTEGER PRIMARY KEY,
	type ENUM('Visa', 'MC', 'American_Express','Discover') NOT NULL,
	credit_limit DECIMAL(10,2) NOT NULL,
	balance DECIMAL(10,2) DEFAULT 0,
	active BOOLEAN DEFAULT FALSE
);
select * from CreditCard;

create table Ownership (
	customer_id INTEGER,
    card_number INTEGER,
    is_current BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (customer_id, card_number),
    FOREIGN KEY (customer_id) references Customer(id),
    FOREIGN KEY (card_number) references CreditCard(number)
);
select * from Ownership;

create table Vendor (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
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
select * from Transaction;

create table Payment (
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    card_number INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (card_number) references CreditCard(number)
);
select * from Payment;
