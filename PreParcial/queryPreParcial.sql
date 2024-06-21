CREATE DATABASE preparcial;
use preparcial;

create table aseguradoras(
id_aseguradora int auto_increment not null,
nombre varchar(50) not null,
contraseña varchar(40),
direccion varchar(100) not null,
correo varchar(40),
telefono varchar(20),
createat datetime,
updateat datetime,
primary key(id_aseguradora)
);

create table usuarios(
id_usuario int auto_increment not null,
nombre varchar(50),
cedula varchar(15),
id_aseguradora int,
primary key(id_usuario),
FOREIGN KEY(id_aseguradora) REFERENCES aseguradoras(id_aseguradora)
);

create table juzgados(
id_juzgado int auto_increment not null,
nombre_juz varchar(20),
direccion varchar(200),
primary key(id_juzgado)
);

create table casos(
numero_caso int not null auto_increment,
id_juzgado int,
descrip varchar(200),
estatus enum("en curso","pendiente","cerrado"),
primary key(numero_caso),
FOREIGN KEY(id_juzgado) REFERENCES juzgados(id_juzgado)
);
create table expedientes(
id_exp int not null auto_increment,
conductor varchar(15),
id_aseguradora int not null,
numero_caso int not null,
primary key(id_exp),
FOREIGN KEY(id_aseguradora) REFERENCES aseguradoras(id_aseguradora),
FOREIGN KEY(numero_caso) REFERENCES casos(numero_caso)
);
INSERT INTO aseguradoras (nombre, contraseña, direccion, correo, telefono, createat, updateat) VALUES 
('Mapfre', 'mapfre123', 'Costa del este, Panama', 'contacto@mapfre.com', '+507 321 1234', NOW(), NOW()),
('Allianz', 'allianz123', 'Calle 50 , Panama', 'info@allianz.com', '+507 756 7890', NOW(), NOW()),
('AXA', 'axa123', 'Casco antiguo, Panama', 'servicio@axa.com.mx', '+507 201 2345', NOW(), NOW()),
('SURA', 'sura123', 'Calle 50 , Panama', 'ayuda@sura.com', '+507 312 5678', NOW(), NOW()),
('Zurich', 'zurich123', 'costa arriba, Colon', 'contacto@zurich.com', '+507 390 5678', NOW(), NOW());

-- Insertar registros en la tabla usuarios
INSERT INTO usuarios (nombre, cedula, id_aseguradora) VALUES 
('Juan Pérez', '8-348-90', 1),
('Ana Gómez', '4-778-5212', 2),
('Luis Martínez', 'PE-342-870', 2),
('Carla Rojas', '8-890-115', 4),
('José López', 'DNI87654321', 5);

-- Insertar registros en la tabla juzgados
INSERT INTO juzgados (nombre_juz, direccion) VALUES 
('Juzgado Civil 1', 'Av. 5 de Mayo, Panama'),
('Juzgado Penal 2', 'juan diaz, panama'),
('Juzgado Laboral 3', 'cuatro altos, Ciudad de Colon'),
('Juzgado Administrativo 4', 'Calle 50, Panama'),
('Juzgado Familiar 5', 'David, Chiriqui');

-- Insertar registros en la tabla casos
INSERT INTO casos (id_juzgado, descrip, estatus) VALUES 
(1, 'Demanda por incumplimiento de contrato','en curso'),
(2, 'Caso de robo con agravantes','pendiente'),
(3, 'Despido injustificado','en curso'),
(4, 'Demanda contra la administración pública','cerrado'),
(5, 'Custodia de menores','pendiente'),
(4, 'Pension alimenticia','pendiente');
-- Insertar registros en la tabla expedientes
INSERT INTO expedientes (conductor, id_aseguradora, numero_caso) VALUES 
('Carlos Méndez', 1, 2),
('María Fernández', 2, 4),
('Pedro González', 3,1),
('Sofía Ramírez', 4, 5),
('Diego Torres', 5, 5);

create view pendientes as 
select e.conductor as conductor, j.nombre_juz as juzgado, a.nombre as aseguradora, c.estatus as estatus
from aseguradoras a
join expedientes e on a.id_aseguradora=e.id_aseguradora
join casos c on e.numero_caso=c.numero_caso
join juzgados j on c.id_juzgado = j.id_juzgado
where c.estatus = 'pendiente';

create view en_curso as 
select e.conductor as conductor, j.nombre_juz as juzgado, a.nombre as aseguradora, c.estatus as estatus
from aseguradoras a
join expedientes e on a.id_aseguradora=e.id_aseguradora
join casos c on e.numero_caso=c.numero_caso
join juzgados j on c.id_juzgado = j.id_juzgado
where c.estatus = 'en curso';

create view cerrados as 
select e.conductor as conductor, j.nombre_juz as juzgado, a.nombre as aseguradora, c.estatus as estatus
from aseguradoras a
join expedientes e on a.id_aseguradora=e.id_aseguradora
join casos c on e.numero_caso=c.numero_caso
join juzgados j on c.id_juzgado = j.id_juzgado
where c.estatus = 'cerrado';
