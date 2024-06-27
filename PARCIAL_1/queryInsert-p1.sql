USE ventas;

-- Insertando datos en la tabla oficinas
INSERT INTO oficinas (id_oficina, ciudad, telefono, direccion, departamento, pais, codigoPostal, continente, estatus, abierta, createat, updateat)
VALUES
('O001', 'Panamá', '1234567', 'Calle 50', 'Panamá', 'Panamá', NULL, 'América', 'Activa', TRUE, NOW(), NOW()),
('O002', 'David', '2345678', 'Avenida Central', 'Chiriquí', 'Panamá', NULL, 'América', 'Activa', TRUE, NOW(), NOW()),
('O003', 'Colón', '3456789', 'Zona Libre', 'Colón', 'Panamá', NULL, 'América', 'Inactiva', FALSE, NOW(), NOW()),
('O004', 'Santiago', '4567890', 'Via Interamericana', 'Veraguas', 'Panamá', NULL, 'América', 'Activa', TRUE, NOW(), NOW()),
('O005', 'Chitré', '5678901', 'Calle Meléndez', 'Herrera', 'Panamá', NULL, 'América', 'Activa', TRUE, NOW(), NOW());

-- Insertando datos en la tabla empleados
INSERT INTO empleados (apellido, nombre, genero, extension, email, jefe, cargo, id_oficina, en_activo, createat, updateat)
VALUES
('González', 'Luis', 'Masculino', '101', 'luis.gonzalez@ventaspanama.com', NULL, 'Gerente', 'O001', TRUE, NOW(), NOW()),
('Martínez', 'Ana', 'Femenino', '102', 'ana.martinez@ventaspanama.com', 1, 'Asistente', 'O001', TRUE, NOW(), NOW()),
('Pérez', 'Carlos', 'Masculino', '103', 'carlos.perez@ventaspanama.com', 1, 'Vendedor', 'O002', TRUE, NOW(), NOW()),
('Rodríguez', 'Marta', 'Femenino', '104', 'marta.rodriguez@ventaspanama.com', 1, 'Vendedor', 'O003', FALSE, NOW(), NOW()),
('López', 'Jorge', 'Masculino', '105', 'jorge.lopez@@ventaspanama.com', 1, 'Vendedor', 'O004', TRUE, NOW(), NOW());

-- Insertando datos en la tabla clientes
INSERT INTO clientes (empresa, apellido, nombre, genero, telefono, direccion, ciudad, departamento, codigoPostal, pais, empleadoAtiende, limiteCredito, vip, createat, updateat)
VALUES
('Empresa ABC', 'Gómez', 'María', 'Femenino', '6789012', 'Calle Primera', 'Panamá', 'Panamá', NULL, 'Panamá', 2, 10000.00, FALSE, NOW(), NOW()),
('Empresa XYZ', 'Ramos', 'Pedro', 'Masculino', '7890123', 'Avenida Segunda', 'David', 'Chiriquí', NULL, 'Panamá', 3, 15000.00, FALSE, NOW(), NOW()),
('Compañía LMN', 'Santos', 'Laura', 'Femenino', '8901234', 'Calle Tercera', 'Colón', 'Colón', NULL, 'Panamá', 4, 20000.00, FALSE, NOW(), NOW()),
('Negocios OPQ', 'Jiménez', 'Luis', 'Masculino', '9012345', 'Avenida Cuarta', 'Santiago', 'Veraguas', NULL, 'Panamá', 5, 25000.00, TRUE, NOW(), NOW()),
('Empresa DEF', 'Herrera', 'Sofía', 'Femenino', '0123456', 'Calle Quinta', 'Chitré', 'Herrera', NULL, 'Panamá', 3, 30000.00, FALSE, NOW(), NOW());


INSERT INTO pagos (numerofactura, id_cliente, totalPago, fechaPago, estado, confirmacion, createat)
VALUES
('F001', 1, 5000.00, '2023-05-12', 'Pagado', TRUE, NOW()),
('F002', 2, 10000.00, '2023-03-09', 'Pendiente', FALSE, NOW()),
('F003', 2, 15000.00, '2023-07-21', 'Pagado', TRUE, NOW()),
('F004', 4, 20000.00, '2023-12-01', 'Pagado', TRUE, NOW()),
('F005', 5, 25000.00, '2023-12-08', 'Pendiente', FALSE, NOW());

-- Insertando datos en la tabla ordenes
INSERT INTO ordenes (fechaRecibido, fechaLimiteEntrega, fechaEntrega, estado, actualizacion, observacion, id_cliente, prioridad, createat, updateat)
VALUES
('2023-04-01', '2023-04-15', '2023-04-10', 'Completado', 'Entregado', 'Entregado a tiempo', 1, 'Alta', NOW(), NOW()),
('2023-05-01', '2023-05-15', '2023-05-10', 'En Proceso', 'En Tramite', 'En proceso de entrega', 2, 'Media', NOW(), NOW()),
('2023-06-01', '2023-06-15', '2023-06-10', 'Cancelado', 'Cancelado', 'Cliente canceló la orden', 3, 'Baja', NOW(), NOW()),
('2023-07-01', '2023-07-15', '2023-07-10', 'Completado', 'Entregado', 'Entregado a tiempo', 4, 'Alta', NOW(), NOW()),
('2023-08-01', '2023-08-15', '2023-08-10', 'En Proceso', 'En Tramite', 'En proceso de entrega', 5, 'Media', NOW(), NOW());

-- Insertando datos en la tabla lineasproductos
INSERT INTO lineasproductos (nombreLinea, textoDescripcion, htmlDescripcion, imagen, category, linea_activa, createat, updateat)
VALUES
('Electrónica', 'Productos electrónicos de alta calidad', 'Productos electrónicos de alta calidad', 'electronica.jpg', 'Electrónica', TRUE, NOW(), NOW()),
('Ropa', 'Ropa y accesorios para todas las edades', 'Ropa y accesorios para todas las edades', 'ropa.jpg', 'Ropa', TRUE, NOW(), NOW()),
('Hogar', 'Artículos para el hogar y la cocina', 'Artículos para el hogar y la cocina', 'hogar.jpg', 'Hogar', TRUE, NOW(), NOW()),
('Juguetes', 'Juguetes para niños de todas las edades', 'Juguetes para niños de todas las edades', 'juguetes.jpg', 'Juguetes', TRUE, NOW(), NOW()),
('Zapatería', 'Calzado para todas las ocasiones', 'Calzado para todas las ocasiones', 'zapateria.jpg', 'Zapateria', TRUE, NOW(), NOW());

-- Insertando datos en la tabla productos
INSERT INTO productos (id_producto, nombreProducto, escala, cantidad, precioventa, MSRP, estatus, stock_vacio, id_lineaproducto, createat, updateat)
VALUES
('P001', 'Smartphone X', '1:1', 50, 699.99, 799.99, 'Disponible', FALSE, 1, NOW(), NOW()),
('P002', 'Laptop Pro', '1:1', 30, 1299.99, 1499.99, 'Disponible', FALSE, 1, NOW(), NOW()),
('P003', 'Camisa Casual', 'L', 100, 19.99, 29.99, 'Disponible', FALSE, 2, NOW(), NOW()),
('P004', 'Mesa de Comedor', '1:10', 20, 199.99, 249.99, 'No Disponible', TRUE, 3, NOW(), NOW()),
('P005', 'Juguete Educativo', '1:5', 200, 29.99, 39.99, 'Disponible', FALSE, 4, NOW(), NOW());

-- Insertando datos en la tabla detallesordenes
INSERT INTO detallesordenes (cantidadpedida, valorunitario, ordenEntrega, id_orden, id_producto, estado, devolucion, createat, updateat)
VALUES
(5, 699.99, 1, 1, 'P001', 'Entregado', FALSE, NOW(), NOW()),
(3, 1299.99, 2, 2, 'P002', 'Pendiente', FALSE, NOW(), NOW()),
(10, 19.99, 3, 3, 'P003', 'Entregado', FALSE, NOW(), NOW()),
(2, 199.99, 4, 4, 'P004', 'Pendiente', FALSE, NOW(), NOW()),
(15, 29.99, 5, 5, 'P005', 'Entregado', FALSE, NOW(), NOW());
