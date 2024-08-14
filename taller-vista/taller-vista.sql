CREATE database	if not exists taller;
use taller;

create table if not exists proveedores(
	id_proveedor int auto_increment primary key,
    nombre varchar(50) not null,
    status int(3),
    ciudad varchar(25)
);

create table if not exists partes(
	numero int auto_increment primary key,
    nombre varchar(50) not null,
    color varchar(25),
    peso float,
    precio float,
    ciudad varchar(25)
);

create table if not exists talleres(
	id_proveedor int,
    numero int,
    cantidad int,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (numero) REFERENCES partes(numero)
);

insert into proveedores (id_proveedor, nombre, status, ciudad) values 
(null, 'Smith', 20, 'Londres'),
(null, 'Jones', 10, 'Paris'),
(null, 'Blake', 30, 'Paris'),
(null, 'Clark', 20, 'Londres'),
(null, 'Adams', 30, 'Atenas');

insert into partes (numero, nombre, color, peso, precio, ciudad) values 
(null, 'Tuerca', 'Rojo', 12.0, 0.20, 'Londres'),
(null, 'Perno', 'Verde', 17.0, 1.25, 'Paris'),
(null, 'Tornillo', 'Azul', 17.0, 0.50, 'Roma'),
(null, 'Tornillo', 'Rojo', 14.0, 0.60, 'Londres'),
(null, 'Leva', 'Azul', 12.0, 12.60, 'Paris'),
(null, 'Engrane', 'Rojo', 19.0, 4.50, 'Londres');

insert into talleres (id_proveedor, numero, cantidad) values 
(1, 1, 200),
(1, 2, 700),
(1, 5, 800),
(2, 1, 400),
(2, 4, 500),
(3, 3, 400),
(3, 6, 100),
(4, 2, 300),
(4, 5, 100),
(4, 6, 800),
(5, 3, 100),
(5, 4, 600);

create view ver_proveedores as
	select * from proveedores
    where status != 0;
    
create view partes_rojas as
	select pro.nombre as nombre_proveedor, par.nombre as nombre_parte, par.color as color, t.cantidad as cantidad from talleres t
    join proveedores pro on t.id_proveedor = pro.id_proveedor
    join partes par on t.numero = par.numero
    where par.color = 'rojo';

create view ciudad_londres as
	select pro.nombre as nombre_proveedor, par.nombre as nombre_parte, par.ciudad as ciudad_parte, pro.ciudad as ciudad_proveedor, t.cantidad as cantidad from talleres t
    join proveedores pro on t.id_proveedor = pro.id_proveedor
    join partes par on t.numero = par.numero
    where par.ciudad = 'Londres' and pro.ciudad = 'Londres';
    
create view partes_pesadas as
	select * from partes
    where peso > 15;
    
delimiter //
create procedure cantidad_por_proveedor()
begin
	select pro.nombre, sum(t.cantidad) as total_de_piezas from talleres t
    join proveedores pro on t.id_proveedor = pro.id_proveedor
    group by pro.nombre;
end //
delimiter ;

delimiter //
create procedure precio_por_compra(in cant_compra int, id_parte int)
begin
	select nombre, round(precio*cant_compra, 2) as total_de_compra from partes
    where numero = id_parte;
end //
delimiter ;