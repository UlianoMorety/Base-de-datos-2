create  database Videojuego;
use Videojuego;
create table jugadores (
	email varchar(50) not null primary key,
    nombre varchar(50),
    telefono varchar(20),
    fechaNac date
);

create table escenarios (
	id int auto_increment primary key,
    nombre varchar(50),
    descripcion text,
    tamano int
);

create table tipos (
	id int auto_increment primary key,
    nombre varchar(50)
);

create table objetos (
	id int auto_increment primary key,
    nombre varchar(50),
    descripcion text,
    id_tipo int,
    foreign key (id_tipo) references tipos(id) 
);

create table personajes (
	id int auto_increment primary key,
    nombre varchar(50),
    nivel int,
    email_jugador varchar(50),
    foreign key (email_jugador) references jugadores(email)
);

create table inventarios (
	id int auto_increment primary key,
    id_personaje int,
    id_objeto int,
    cantidad int,
    foreign key (id_personaje) references personajes(id),
    foreign key (id_objeto) references objetos(id)
);

create table partidas (
	id int auto_increment primary key,
    id_personaje int,
    id_escenario int,
    puntaje int,
    duracion time,
    foreign key (id_personaje) references personajes(id),
    foreign key (id_escenario) references escenarios(id)
);

insert into escenarios (nombre, descripcion, tamano) 
values ('selva','escenario ambientado en la selva del amazonas',150);
insert into escenarios (nombre, descripcion, tamano) 
values ('ciudad','escenario ambientado en la ciudad de nueva york',369);
insert into escenarios (nombre, descripcion, tamano) 
values ('aeropuerto','escenario ambientado en aeropuerto',290);

insert into jugadores (email, nombre, telefono, fechaNac) 
values ('jrcreacion@gmail.com','Jeremy','+507 6534-7731','2001-02-19');
insert into jugadores (email, nombre, telefono, fechaNac) 
values ('joseantonio17@gmail.com','jose','+507 6534-7731','2001-10-17');
insert into jugadores (email, nombre, telefono, fechaNac) 
values ('karolgomez888@gmail.com','karol','+507 6577-0031','1998-10-01');

insert into tipos (nombre) 
values ('pociones');
insert into tipos (nombre) 
values ('armas');
insert into tipos (nombre) 
values ('armaduras');

insert into objetos (nombre, descripcion, id_tipo) 
values ('Magnum .44','incrementa el ataque en 30%','1');
insert into objetos (nombre, descripcion, id_tipo) 
values ('recuperacion','pocion que recupera el 25% de la vida','2');
insert into objetos (nombre, descripcion, id_tipo) 
values ('casco de bronce','incrementa la defensas en 10%','3');

insert into personajes (nombre, nivel, email_jugador) 
values ('Jrkiller','14','jrcreacion@gmail.com');
insert into personajes (nombre, nivel, email_jugador) 
values ('joseantonio17','8','joseantonio17@gmail.com');
insert into personajes (nombre, nivel, email_jugador) 
values ('PrettyKarol','2','karolgomez888@gmail.com');