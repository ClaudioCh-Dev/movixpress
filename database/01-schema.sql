CREATE DATABASE IF NOT EXISTS movixpress;
USE movixpress;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET NAMES utf8mb4 */;

-- =======================
-- Tabla: moneda
-- =======================
CREATE TABLE `moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simbolo` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =======================
-- Tabla: documentos
-- =======================
CREATE TABLE `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_documentos_documento ON documentos(documento);

-- =======================
-- Tabla: marcas
-- =======================
CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_marcas_marca ON marcas(marca);

-- =======================
-- Tabla: tipos
-- =======================
CREATE TABLE `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_tipos_tipo ON tipos(tipo);

-- =======================
-- Tabla: clientes
-- =======================
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_clientes_dni ON clientes(dni);
CREATE INDEX idx_clientes_nombre ON clientes(nombre);

-- =======================
-- Tabla: usuarios
-- =======================
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL UNIQUE,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(80) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `perfil` varchar(500) NOT NULL DEFAULT 'https://res.cloudinary.com/drwtssrej/image/upload/v1763577013/AlquilerAutos%28MovilXpress%29/default-user_zvjlu5.png',
  `clave` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `rol` ENUM('ADMIN', 'WORKER') NOT NULL DEFAULT 'WORKER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_usuarios_correo ON usuarios(correo);
CREATE INDEX idx_usuarios_nombre ON usuarios(nombre);

-- =======================
-- Tabla: configuracion
-- =======================
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `moneda` int(11) NOT NULL,
  `impuesto` int(11) NOT NULL,
  `cant_factura` int(11) NOT NULL,
  `penalidad_por_dia` decimal(10,2) DEFAULT 0,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`moneda`) REFERENCES `moneda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =======================
-- Tabla: combustibles
-- =======================
CREATE TABLE combustibles (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  estado INT(11) NOT NULL DEFAULT 1,
  fecha TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_combustibles_nombre ON combustibles(nombre);

-- =======================
-- Tabla: transmisiones
-- =======================
CREATE TABLE transmisiones (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  estado INT(11) NOT NULL DEFAULT 1,
  fecha TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_transmisiones_nombre ON transmisiones(nombre);

-- =======================
-- Tabla: capacidades
-- =======================
CREATE TABLE capacidades (
  id INT(11) NOT NULL AUTO_INCREMENT,
  cantidad INT NOT NULL,
  estado INT(11) NOT NULL DEFAULT 1,
  fecha TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_capacidades_cantidad ON capacidades(cantidad);

-- =======================
-- Tabla: kilometrajes
-- =======================
CREATE TABLE kilometrajes (
  id INT(11) NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(50) NOT NULL,
  estado INT(11) NOT NULL DEFAULT 1,
  fecha TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_kilometrajes_tipo ON kilometrajes(tipo);

-- =======================
-- Tabla: vehiculos
-- =======================
CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(25) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `actividad` ENUM('PRESTADO', 'LIBRE') NOT NULL DEFAULT 'LIBRE',
  `estado` int(11) NOT NULL DEFAULT 1,
  `precio_por_dia` decimal(10,2) DEFAULT 1,

  `id_combustible` int(11),
  `id_transmision` int(11),
  `id_capacidad` int(11),
  `id_kilometraje` int(11),

  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  
  PRIMARY KEY (`id`),

  FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) 
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id`) 
    ON DELETE CASCADE ON UPDATE CASCADE,
  
  FOREIGN KEY (`id_combustible`) REFERENCES `combustibles` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`id_transmision`) REFERENCES `transmisiones` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`id_capacidad`) REFERENCES `capacidades` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`id_kilometraje`) REFERENCES `kilometrajes` (`id`) 
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE UNIQUE INDEX idx_vehiculos_placa ON vehiculos(placa);
CREATE INDEX idx_vehiculos_marca ON vehiculos(id_marca);
CREATE INDEX idx_vehiculos_tipo ON vehiculos(id_tipo);

CREATE INDEX idx_vehiculos_combustible ON vehiculos(id_combustible);
CREATE INDEX idx_vehiculos_transmision ON vehiculos(id_transmision);
CREATE INDEX idx_vehiculos_capacidad ON vehiculos(id_capacidad);
CREATE INDEX idx_vehiculos_kilometraje ON vehiculos(id_kilometraje);

-- =======================
-- Tabla: alquiler
-- =======================
CREATE TABLE `alquiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `num_dias` int(11) default 0,
  `precio_dia` decimal(10,2) NOT NULL,
  `abono` decimal(10,2) default 0,
  `fecha_prestamo` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_estimada_devolucion` date NOT NULL,
  `fecha_real_devolucion` date default NULL,
  `id_doc` int(11) NOT NULL,
  `observacion` text DEFAULT NULL,
  `estado`  ENUM('EN PRESTAMO', 'DEVUELTO','CANCELADO') NOT NULL DEFAULT 'EN PRESTAMO',
  `penalidad` decimal(10,2) DEFAULT 0,
  `penalidad_por_dia` decimal(10,2) DEFAULT 0,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`id_doc`) REFERENCES `documentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_alquiler_cliente ON alquiler(id_cliente);
CREATE INDEX idx_alquiler_vehiculo ON alquiler(id_vehiculo);
CREATE INDEX idx_alquiler_moneda ON alquiler(id_moneda);
CREATE INDEX idx_alquiler_documento ON alquiler(id_doc);
CREATE INDEX idx_alquiler_estado ON alquiler(estado);
CREATE INDEX idx_alquiler_fecha ON alquiler(fecha_prestamo);

COMMIT;