create database cartera_electronica;
use cartera_electronica;

create table users(
	user_id int auto_increment,
    name varchar(25) not null,
    password varchar(20) not null,
    salt numeric,
    balance numeric,
    primary key(user_id)
);

create table contacts(
	user_id int not null,
    friend_id int not null,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(friend_id) REFERENCES users(user_id)
);

create table user_details(
	account_no int auto_increment,
    type varchar(25) not null,
    phone varchar(20) not null,
    aadhar_doc int,
    image blob,
    user_id int not null,
    primary key(account_no),
    foreign key(user_id) references users(user_id)
);

create table transactions(
	request_id int auto_increment not null,
    from_id int not null,
    to_id int not null,
    amount numeric not null,
    reason varchar(32),
    status varchar(20),
    timestamp datetime,	
    category varchar(10),
    request_send varchar(10),
    primary key(request_id),
    foreign key(from_id) references users(user_id),
    foreign key(to_id) references users(user_id)
);

INSERT INTO users (name, password, salt, balance) VALUES 
('Alice Smith', 'password123', 123456, 500.75),
('Bob Johnson', 'securepass', 654321, 300.50),
('Carol White', 'mypassword', 112233, 750.00),
('Dave Brown', 'pass4321', 334455, 250.25),
('Eve Davis', '1234pass', 556677, 1000.00);

-- Insertar registros en la tabla contacts
INSERT INTO contacts (user_id, friend_id) VALUES 
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

-- Insertar registros en la tabla user_details
INSERT INTO user_details (type, phone, aadhar_doc, user_id) VALUES 
('Savings', '555-1234', 123456789, 1),
('Current', '555-5678', 987654321, 2),
('Savings', '555-8765', 456789123, 3),
('Current', '555-4321', 789123456, 4),
('Savings', '555-8765', 321654987, 5);

-- Insertar registros en la tabla transactions
INSERT INTO transactions (from_id, to_id, amount, reason, status, timestamp, category, request_send) VALUES 
(1, 2, 50.00, 'Dinner', 'Completed', NOW(), 'Food', 'Yes'),
(2, 3, 75.50, 'Groceries', 'Completed', NOW(), 'Shopping', 'Yes'),
(3, 4, 100.00, 'Rent', 'Pending', NOW(), 'Housing', 'No'),
(4, 5, 200.75, 'Car Payment', 'Completed', NOW(), 'Transport', 'Yes'),
(5, 1, 150.00, 'Utilities', 'Failed', NOW(), 'Bills', 'No');