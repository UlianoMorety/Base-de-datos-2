CREATE DATABASE IF NOT EXISTS ventas;
USE ventas;

CREATE TABLE IF NOT EXISTS oficinas(
    id_oficina VARCHAR(10) UNIQUE PRIMARY KEY,
    ciudad VARCHAR(50),
    telefono VARCHAR(50),
    direccion VARCHAR(50),
    departamento VARCHAR(50),
    pais VARCHAR(50),
    codigoPostal VARCHAR(15),
    continente VARCHAR(10),
    estatus ENUM('Activa', 'Inactiva') DEFAULT 'Activa',
    abierta BOOLEAN DEFAULT TRUE,
    createat DATETIME,
    updateat DATETIME
);

CREATE TABLE IF NOT EXISTS empleados(
    documento INT(11) AUTO_INCREMENT PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    genero ENUM('Masculino', 'Femenino'),
    extension VARCHAR(10),
    email VARCHAR(100),
    jefe INT(11),
    cargo VARCHAR(50),
    id_oficina VARCHAR(10),
    FOREIGN KEY (id_oficina) REFERENCES oficinas(id_oficina),
    en_activo BOOLEAN DEFAULT TRUE,
    createat DATETIME,
    updateat DATETIME
);

CREATE TABLE IF NOT EXISTS clientes(
    id_cliente INT(11) AUTO_INCREMENT PRIMARY KEY,
    empresa VARCHAR(50),
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    genero ENUM('Masculino', 'Femenino'),
    telefono VARCHAR(50),
    direccion VARCHAR(50),
    ciudad VARCHAR(50),
    departamento VARCHAR(50),
    codigoPostal VARCHAR(15),
    pais VARCHAR(50),
    empleadoAtiende INT(11),
    limiteCredito DOUBLE,
    FOREIGN KEY (empleadoAtiende) REFERENCES empleados(documento),
    vip BOOLEAN DEFAULT FALSE,
    createat DATETIME,
    updateat DATETIME
);

CREATE TABLE IF NOT EXISTS pagos(
    numerofactura VARCHAR(50) UNIQUE PRIMARY KEY,
    id_cliente INT(11),
    totalPago DOUBLE,
    fechaPago DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    estado ENUM('Pagado', 'Pendiente') DEFAULT 'Pendiente',
    confirmacion BOOLEAN DEFAULT FALSE,
    createat DATETIME
);

CREATE TABLE IF NOT EXISTS ordenes(
    id_orden INT(11) AUTO_INCREMENT PRIMARY KEY,
    fechaRecibido DATE,
    fechaLimiteEntrega DATE,
    fechaEntrega DATE,
    estado VARCHAR(15),
    actualizacion ENUM('En Tramite', 'Cancelado', 'Entregado'),
    observacion TEXT,
    id_cliente INT(11),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    prioridad ENUM('Alta', 'Media', 'Baja'),
    createat DATETIME,
    updateat DATETIME
);

CREATE TABLE IF NOT EXISTS lineasproductos(
    id_lineaproducto INT(5) AUTO_INCREMENT PRIMARY KEY,
    nombreLinea VARCHAR(50),
    textoDescripcion VARCHAR(4000),
    htmlDescripcion VARCHAR(200),
    imagen VARCHAR(200),
    category ENUM('Electrónica', 'Ropa', 'Hogar', 'Juguetes','Zapateria','Escolares'),
    linea_activa BOOLEAN DEFAULT TRUE,
    createat DATETIME,
    updateat DATETIME
);

CREATE TABLE IF NOT EXISTS productos(
    id_producto VARCHAR(15) UNIQUE PRIMARY KEY,
    nombreProducto VARCHAR(70),
    escala VARCHAR(10),
    cantidad INT,
    precioventa DOUBLE,
    MSRP DOUBLE,
    estatus ENUM('Disponible', 'No Disponible') DEFAULT 'Disponible',
    stock_vacio BOOLEAN DEFAULT FALSE,
    id_lineaproducto INT(5),
    FOREIGN KEY (id_lineaproducto) REFERENCES lineasproductos(id_lineaproducto),
    createat DATETIME,
    updateat DATETIME
);

CREATE TABLE IF NOT EXISTS detallesordenes(
    id_detalleorden INT(11) AUTO_INCREMENT PRIMARY KEY,
    cantidadpedida INT(11),
    valorunitario DOUBLE,
    ordenEntrega INT(6),
    id_orden INT(11),
    id_producto VARCHAR(15),
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    estado ENUM('Pendiente', 'Entregado') DEFAULT 'Pendiente',
    devolucion BOOLEAN DEFAULT FALSE,
    createat DATETIME,
    updateat DATETIME
);

