CREATE DATABASE IF NOT EXISTS Parcial1DB;
USE Parcial1DB;

CREATE TABLE IF NOT EXISTS usuarios(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25) NOT NULL,
	nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
	token VARCHAR(255) NOT NULL,
	contraseña VARCHAR(100) NOT NULL,
	tipo_usuario ENUM('cliente','administrador','vendedor', 'ejecutivo','otro'),
	sexo ENUM('masculino','femenino') NOT NULL,
	estado_civil ENUM('soltero/a','casado/a','divorciado/a','unido/a','viudo/a') NOT NULL,
	tipo_empresa ENUM('publica','privada') NOT NULL,
	direccion TEXT,
	createat DATETIME,
	updateat DATETIME
);

CREATE TABLE IF NOT EXISTS autenticaciones(
	id_autenticacion INT AUTO_INCREMENT PRIMARY KEY,
	nombre_usuario VARCHAR(50),
	contraseña VARCHAR(255) NOT NULL,
	agente_usuario VARCHAR(100) NOT NULL,
	token VARCHAR(255) NOT NULL,
    createat DATETIME,
	updateat DATETIME,
	FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario)
);

CREATE TABLE IF NOT EXISTS pagos(
	id_pago INT AUTO_INCREMENT PRIMARY KEY,
	tarjeta_tipo ENUM ('Visa', 'MasterCard', 'Clave', 'American Express','Discovery','Diners Club'),
	numero INT NOT NULL,
	nombre_usuario VARCHAR(50) NOT NULL,
	cvc VARCHAR(4) NOT NULL,
	expiracion DATE NOT NULL,
	id_usuario INT,
    createat DATETIME,
	updateat DATETIME,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS pruebas (
	id_prueba INT AUTO_INCREMENT PRIMARY KEY,
	referencia VARCHAR(50) NOT NULL,
	nombre_prueba varchar(50),
	descripcion TEXT,
	fecha_ingreso DATE,
	estatus ENUM('Activo','Desactivado')
);

CREATE TABLE IF NOT EXISTS test (
	id_test INT AUTO_INCREMENT PRIMARY KEY, 
	id_prueba INT,
    id_usuario INT,
	fecha_test DATE,
    FOREIGN KEY (id_prueba) REFERENCES pruebas(id_prueba),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE OR REPLACE VIEW empresa_privada as
	SELECT nombre, apellido, tipo_empresa, tipo_usuario from usuarios
	where tipo_empresa = 'privada';

CREATE OR REPLACE VIEW empresa_publica as
	SELECT nombre, apellido, tipo_empresa, tipo_usuario from usuarios
	where tipo_empresa = 'publica';

CREATE OR REPLACE VIEW pago_visa AS
	SELECT CONCAT(u.nombre,' ', u.apellido) AS unombre, u.estado_civil, u.sexo, u.direccion, p.tarjeta_tipo 
    FROM usuarios u
    JOIN pagos p ON u.id_usuario = p.id_usuario
	WHERE tarjeta_tipo = 'Visa';

CREATE OR REPLACE VIEW pago_masterCard AS
	SELECT CONCAT(u.nombre,' ', u.apellido) AS unombre, u.estado_civil, u.sexo, u.direccion, p.tarjeta_tipo 
    FROM usuarios u
    JOIN pagos p ON u.id_usuario = p.id_usuario
	WHERE tarjeta_tipo = 'MasterCard';
    
CREATE OR REPLACE VIEW pago_clave AS
	SELECT CONCAT(u.nombre,' ', u.apellido) AS unombre, u.estado_civil, u.sexo, u.direccion, p.tarjeta_tipo 
    FROM usuarios u
    JOIN pagos p ON u.id_usuario = p.id_usuario
	WHERE tarjeta_tipo = 'Visa';
    
CREATE OR REPLACE VIEW pago_american AS
	SELECT CONCAT(u.nombre,' ', u.apellido) AS unombre, u.estado_civil, u.sexo, u.direccion, p.tarjeta_tipo 
    FROM usuarios u
    JOIN pagos p ON u.id_usuario = p.id_usuario
	WHERE tarjeta_tipo = 'American Express';
    
CREATE OR REPLACE VIEW pago_discovery AS
	SELECT CONCAT(u.nombre,' ', u.apellido) AS unombre, u.estado_civil, u.sexo, u.direccion, p.tarjeta_tipo 
    FROM usuarios u
    JOIN pagos p ON u.id_usuario = p.id_usuario
	WHERE tarjeta_tipo = 'Discovery';
    
CREATE OR REPLACE VIEW pago_diners AS
	SELECT CONCAT(u.nombre,' ', u.apellido) AS unombre, u.estado_civil, u.sexo, u.direccion, p.tarjeta_tipo 
    FROM usuarios u
    JOIN pagos p ON u.id_usuario = p.id_usuario
	WHERE tarjeta_tipo = 'Diners Club';
    
CREATE OR REPLACE VIEW autenticacion AS
	SELECT a.nombre_usuario, a.createat fecha, u.apellido, u.direccion, u.tipo_empresa FROM autenticaciones a
    JOIN usuarios u ON a.nombre_usuario = u.nombre_usuario;
    
CREATE OR REPLACE VIEW prueba_activa AS
	SELECT * FROM pruebas
	WHERE estatus = 'Activo';
