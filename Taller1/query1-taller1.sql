create database taller1;
use taller1;
create table orders(
	id int not null primary key
);
create table categories(
	id int not null auto_increment,
    name varchar(50),
    primary key (id)
);
create table food(
	id int not null auto_increment,
	expiration_date date,
    calories int,
    primary key (id)
);
create table furniture(
	id int not null auto_increment,
	manufacture_date date,
    primary key(id)
);

create table products(
	id int not null auto_increment,
    name varchar(50),
    price decimal,
    id_categories int,
    id_food int,
    id_furniture int,
    primary key(id),
    foreign key(id_categories) references categories(id),
    foreign key(id_food) references food(id),
    foreign key(id_furniture) references furniture(id)
);

create table order_line(
	id int not null auto_increment,
	quantity int,
    id_orders int,
    id_products int,
    primary key(id),
    foreign key (id_orders) references orders(id),
    foreign key (id_products) references products(id)
);