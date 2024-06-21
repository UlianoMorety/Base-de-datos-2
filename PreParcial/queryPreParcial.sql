CREATE DATABASE preparcial;
use preparcial;

create table aseguradoras(
id_aseguradora int auto_increment not null,
nombre varchar(50) not null,
contraseña varchar(40),
direccion varchar(100) not null,
correo varchar(40),
telefono varchar(20),
estatus enum("activo","inactivo","eliminado"),
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
INSERT INTO aseguradoras (nombre, contraseña, direccion, correo, telefono, estatus, createat, updateat) VALUES 
('Mapfre', 'mapfre123', 'Av. Libertador 4500, Buenos Aires', 'contacto@mapfre.com', '+54 11 4321 1234', 'activo', NOW(), NOW()),
('Allianz', 'allianz123', 'Calle 56 No. 7-85, Bogotá', 'info@allianz.com', '+57 1 756 7890', 'activo', NOW(), NOW()),
('AXA', 'axa123', 'Paseo de la Reforma 505, Ciudad de México', 'servicio@axa.com.mx', '+52 55 1101 2345', 'activo', NOW(), NOW()),
('SURA', 'sura123', 'Carrera 43A No. 24-89, Medellín', 'ayuda@sura.com', '+57 4 312 5678', 'activo', NOW(), NOW()),
('Zurich', 'zurich123', 'Rivadavia 1234, Buenos Aires', 'contacto@zurich.com', '+54 11 4390 5678', 'activo', NOW(), NOW());

-- Insertar registros en la tabla usuarios
INSERT INTO usuarios (nombre, cedula, id_aseguradora) VALUES 
('Juan Pérez', 'DNI12345678', 1),
('Ana Gómez', 'CC98765432', 2),
('Luis Martínez', 'RFCMART123456', 3),
('Carla Rojas', 'CC1234567890', 4),
('José López', 'DNI87654321', 5);

-- Insertar registros en la tabla juzgados
INSERT INTO juzgados (nombre_juz, direccion) VALUES 
('Juzgado Civil 1', 'Av. de Mayo 123, Buenos Aires'),
('Juzgado Penal 2', 'Carrera 10 No. 15-30, Bogotá'),
('Juzgado Laboral 3', 'Insurgentes Sur 300, Ciudad de México'),
('Juzgado Administrativo 4', 'Calle 50 No. 70-20, Medellín'),
('Juzgado Familiar 5', 'Av. Corrientes 789, Buenos Aires');

-- Insertar registros en la tabla casos
INSERT INTO casos (id_juzgado, descrip) VALUES 
(1, 'Demanda por incumplimiento de contrato'),
(2, 'Caso de robo con agravantes'),
(3, 'Despido injustificado'),
(4, 'Demanda contra la administración pública'),
(5, 'Custodia de menores');

-- Insertar registros en la tabla expedientes
INSERT INTO expedientes (conductor, id_aseguradora, numero_caso) VALUES 
('Carlos Méndez', 1, 1),
('María Fernández', 2, 2),
('Pedro González', 3, 3),
('Sofía Ramírez', 4, 4),
('Diego Torres', 5, 5);
