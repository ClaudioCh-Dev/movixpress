-- ==========================
-- Datos Iniciales para la bd
-- ==========================

-- Monedas
INSERT INTO moneda (simbolo, nombre) VALUES
('S/', 'Soles'),
('$', 'Dólares'),
('€', 'Euros'),
('£', 'Libras'),
('¥', 'Yen'),
('₿', 'Bitcoin'),
('R$', 'Real'),
('₽', 'Rublo'),
('₩', 'Won'),
('C$', 'Peso colombiano');

-- Documentos
INSERT INTO documentos (documento) VALUES
('Boleta'),
('Factura'),
('Nota de venta'),
('Ticket'),
('Recibo'),
('Guía'),
('Remito'),
('Factura electrónica'),
('Boleta electrónica'),
('Orden de compra');

-- Marcas
INSERT INTO marcas (marca) VALUES
('Toyota'),
('Hyundai'),
('Chevrolet'),
('Nissan'),
('Ford'),
('Kia'),
('Volkswagen'),
('Mazda'),
('Honda'),
('Suzuki');

-- Tipos
INSERT INTO tipos (tipo) VALUES
('Sedán'),
('SUV'),
('Pickup'),
('Hatchback'),
('Convertible'),
('Coupé'),
('Furgoneta'),
('Camión'),
('Minivan'),
('Eléctrico');

-- Clientes
INSERT INTO clientes (dni, nombre, telefono, direccion) VALUES
('11111111', 'Pedro Gómez', '900000001', 'Av. Los Héroes 101'),
('22222222', 'Lucía Ramírez', '900000002', 'Jr. Ayacucho 234'),
('33333333', 'Carlos Díaz', '900000003', 'Av. Brasil 321'),
('44444444', 'María León', '900000004', 'Jr. Junín 456'),
('55555555', 'Luis Torres', '900000005', 'Calle Lima 567'),
('66666666', 'Rosa López', '900000006', 'Pasaje Piura 678'),
('77777777', 'Miguel Ríos', '900000007', 'Av. San Martín 789'),
('88888888', 'Elena Soto', '900000008', 'Jr. Bolívar 890'),
('99999999', 'Sergio Paredes', '900000009', 'Av. Grau 1011'),
('00000000', 'Natalia Vega', '900000010', 'Calle Cusco 1122');

-- Configuración
INSERT INTO configuracion (ruc, nombre, telefono, correo, direccion, mensaje, logo, moneda, impuesto, cant_factura, penalidad_por_dia)
VALUES ('20604816123', 'MoviXpress S.A.C.', '928012312', 'movixpress@rental.net', 'Av. Uruguay 514, Breña', '¡Gracias por su preferencia!', '/companyLogo/logo.png', 1, 18, 1000, 10.00);

-- Combustibles
INSERT INTO combustibles (nombre) VALUES
('Gasolina'),
('Diésel'),
('Eléctrico'),
('Híbrido');

-- Transmisiones
INSERT INTO transmisiones (nombre) VALUES
('Manual'),
('Automático');

-- Capacidades
INSERT INTO capacidades (cantidad) VALUES
(2),
(4),
(5),
(7),
(12);

-- Kilometrajes
INSERT INTO kilometrajes (tipo) VALUES
('Ilimitado'),
('100 km/día'),
('200 km/día');

-- Vehículos
INSERT INTO vehiculos (placa, id_marca, id_tipo, modelo, foto, precio_por_dia, id_combustible, id_transmision, id_capacidad, id_kilometraje) VALUES
('AAA111', 1, 1, 'Corolla', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 100, 1, 2, 2, 1),
('BBB222', 2, 2, 'Tucson', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 120, 2, 1, 2, 1),
('CCC333', 3, 3, 'Silverado', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 150, 1, 2, 2, 3),
('DDD444', 4, 4, 'March', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 90, 2, 1, 3, 1),
('EEE555', 5, 5, 'Mustang', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 200, 1, 2, 4, 1),
('FFF666', 6, 6, 'Rio', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 80, 3, 2, 2, 1),
('GGG777', 7, 7, 'Golf', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 110, 4, 1, 4, 1),
('HHH888', 8, 8, 'CX-5', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 130, 4, 2, 2, 2),
('III999', 9, 9, 'Civic', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 105, 1, 1, 1, 3),
('JJJ000', 10, 10, 'Swift', 'https://res-console.cloudinary.com/drrlway38/thumbnails/v1/image/upload/v1751315161/dmlzdGEtZGVsLWNvY2hlLTNkX2MydHo3aQ==/preview', 95, 2, 2, 5, 2);

-- Alquileres
INSERT INTO alquiler (id_cliente, id_vehiculo, id_moneda, num_dias, precio_dia, abono, fecha_prestamo, hora, fecha_estimada_devolucion, id_doc, observacion, estado, penalidad_por_dia)
VALUES
(1, 1, 1, 5, 100.00, 200.00, '2025-06-20', '09:00:00', '2025-06-25', 1, 'Sin observación', 'EN PRESTAMO', 10.00),
(2, 2, 2, 3, 120.00, 100.00, '2025-06-21', '10:30:00', '2025-06-24', 2, 'Sin observación', 'EN PRESTAMO', 10.00),
(3, 3, 1, 7, 150.00, 300.00, '2025-06-22', '08:00:00', '2025-06-29', 3, 'Sin observación', 'EN PRESTAMO', 10.00),
(4, 4, 2, 2, 90.00, 50.00, '2025-06-23', '11:15:00', '2025-06-25', 4, 'Sin observación', 'EN PRESTAMO', 10.00),
(5, 5, 1, 4, 200.00, 100.00, '2025-06-24', '12:00:00', '2025-06-28', 5, 'Sin observación', 'EN PRESTAMO', 10.00),
(6, 6, 2, 6, 80.00, 80.00, '2025-06-25', '13:00:00', '2025-07-01', 6, 'Sin observación', 'EN PRESTAMO', 10.00),
(7, 7, 1, 5, 110.00, 110.00, '2025-06-26', '14:00:00', '2025-07-01', 7, 'Sin observación', 'EN PRESTAMO', 10.00),
(8, 8, 2, 3, 130.00, 90.00, '2025-06-27', '15:00:00', '2025-06-30', 8, 'Sin observación', 'EN PRESTAMO', 10.00),
(9, 9, 1, 4, 105.00, 100.00, '2025-06-28', '16:00:00', '2025-07-02', 9, 'Sin observación', 'EN PRESTAMO', 10.00),
(10, 10, 2, 2, 95.00, 50.00, '2025-06-29', '17:00:00', '2025-07-01', 10, 'Sin observación', 'EN PRESTAMO', 10.00);


-- User Administrador
INSERT INTO usuarios (
  usuario, nombre, apellido, correo, telefono, direccion, clave, estado, fecha, rol
) VALUES (
  'admin',
  'Administrador',
  'Del Sistema',
  'admin@correo.com',
  '999999999',
  'Av. Principal 123',
  '$2a$12$UXW2hk4pCL9LlyAUTBsaf.R3EF.NjIL8/X9YN4fld22WjMV15tnrS',
  1,
  CURRENT_TIMESTAMP(),
  'ADMIN'
);