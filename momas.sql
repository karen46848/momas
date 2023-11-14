-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2023 a las 23:49:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `momas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuntos`
--

CREATE TABLE `conjuntos` (
  `idConjunto` int(11) NOT NULL,
  `nombreConjunto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conjuntos`
--

INSERT INTO `conjuntos` (`idConjunto`, `nombreConjunto`) VALUES
(2, 'conjunto2'),
(3, 'papu'),
(4, 'xddddddd'),
(5, 'elconjutto'),
(6, 'conjunto 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuntos_productos`
--

CREATE TABLE `conjuntos_productos` (
  `idConjunto` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conjuntos_productos`
--

INSERT INTO `conjuntos_productos` (`idConjunto`, `idProducto`) VALUES
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(6, 1),
(6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `nombreCliente` varchar(11) NOT NULL,
  `correoCliente` varchar(11) NOT NULL,
  `telefonoCliente` varchar(10) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidadProductos` int(11) NOT NULL,
  `fechaEmision` date NOT NULL DEFAULT current_timestamp(),
  `FechaVencimiento` date DEFAULT NULL,
  `valorTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `nombreCliente`, `correoCliente`, `telefonoCliente`, `idProducto`, `cantidadProductos`, `fechaEmision`, `FechaVencimiento`, `valorTotal`) VALUES
(1, '0', '0', '213124', 0, 0, '2023-09-19', NULL, 0),
(3, '0', '0', '12312', 0, 0, '2023-09-19', NULL, 0),
(4, 'sadsadsa', 'dsada@sdasd', '2432321', 0, 0, '2023-09-19', NULL, 0),
(5, 'hjsgcjhz', 'jbvzxnm@xz', '346772', 0, 0, '2023-09-19', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `fechaActualizacionIN` int(11) NOT NULL,
  `tipoActualizacion?` varchar(45) NOT NULL,
  `valorE` varchar(45) NOT NULL,
  `unidadesE` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fechaPedido` varchar(45) NOT NULL,
  `valorPedido` varchar(45) NOT NULL,
  `Productos_idProductos` int(11) NOT NULL,
  `Productos_Venta_idVenta` int(11) NOT NULL,
  `Productos_Venta_Facturas_idFacturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `imagenProducto` blob NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `categoriaProducto` varchar(20) NOT NULL,
  `tallaProducto` varchar(3) NOT NULL,
  `colorProducto` varchar(45) NOT NULL,
  `precioProducto` decimal(45,0) NOT NULL,
  `unidadesProducto` int(45) NOT NULL,
  `estadoProducto` varchar(20) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `Venta_idVenta` int(11) NOT NULL,
  `Venta_Facturas_idFacturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `imagenProducto`, `nombreProducto`, `categoriaProducto`, `tallaProducto`, `colorProducto`, `precioProducto`, `unidadesProducto`, `estadoProducto`, `fecha`, `Venta_idVenta`, `Venta_Facturas_idFacturas`) VALUES
(1, '', 'pijama1', 'masculino', 's', '#000000', 40000, 50, '', '2023-09-08', 0, 0),
(2, '', 'pijama2', 'masculino', 'm', '#877897', 32, 30, '', '2023-09-09', 0, 0),
(3, '', 'aaaaaaaaaaaaaaaa', 'masculino', 'l', '#89394c', 50000, 50, '', '2023-09-19', 0, 0),
(9, '', 'wqewqweewqqw', 'femenino', 'wqw', '#000000', 22222, 2222222, 'Disponible', '2023-10-28', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(45) NOT NULL,
  `correoProveedor` varchar(40) NOT NULL,
  `telefonoProveedor` varchar(45) NOT NULL,
  `direccionProveedor` varchar(45) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombreProveedor`, `correoProveedor`, `telefonoProveedor`, `direccionProveedor`, `Pedido_idPedido`, `fecha`) VALUES
(3, '5455', 'wqeqwe@qwewqeewqwqeqwe', '7777', '77777', 0, '2023-09-09'),
(4, 'sadsad', 'kklkljkkklkjl@lkkl', '12348888888', '2134sdfxcgvb', 0, '2023-09-19'),
(5, 'jsancndnmxcx', 'dsdajsdsq@xn--jhsdkax-9za', '4569087', 'sakjhdioskd 89ipo', 0, '2023-09-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `rolUsuario` varchar(45) NOT NULL,
  `correoUsuario` varchar(45) NOT NULL,
  `contraseñaUsuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `rolUsuario`, `correoUsuario`, `contraseñaUsuario`, `fecha`) VALUES
(1, 'Admin', 'Administrador', 'admin@admin1', '0192023a7bbd73250516f069df18b500', '2023-09-05'),
(2, 'user', 'Usuario', 'user@user', 'user123', '2023-09-05'),
(3, 'almacen', 'Almacen', 'almace@almace11', 'almacen123', '2023-09-05'),
(4, 'papu', 'Administrador', '', '123', '2023-10-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidadVendida` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `idProducto`, `cantidadVendida`, `subtotal`, `valorTotal`) VALUES
(6, 1, 1, 40000, NULL),
(7, 1, 1, 40000, 40000.00),
(8, 2, 1, 32, NULL),
(9, 2, 1, 32, 32.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conjuntos`
--
ALTER TABLE `conjuntos`
  ADD PRIMARY KEY (`idConjunto`);

--
-- Indices de la tabla `conjuntos_productos`
--
ALTER TABLE `conjuntos_productos`
  ADD PRIMARY KEY (`idConjunto`,`idProducto`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`fechaActualizacionIN`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`,`Productos_idProductos`,`Productos_Venta_idVenta`,`Productos_Venta_Facturas_idFacturas`),
  ADD KEY `fk_Pedido_Productos1_idx` (`Productos_idProductos`,`Productos_Venta_idVenta`,`Productos_Venta_Facturas_idFacturas`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`,`Venta_idVenta`,`Venta_Facturas_idFacturas`),
  ADD KEY `fk_Productos_Venta1_idx` (`Venta_idVenta`,`Venta_Facturas_idFacturas`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`,`Pedido_idPedido`),
  ADD KEY `fk_Proveedor_Pedido1_idx` (`Pedido_idPedido`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `rolU` (`rolUsuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `conjuntos`
--
ALTER TABLE `conjuntos`
  MODIFY `idConjunto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2321240;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conjuntos_productos`
--
ALTER TABLE `conjuntos_productos`
  ADD CONSTRAINT `conjuntos_productos_ibfk_1` FOREIGN KEY (`idConjunto`) REFERENCES `conjuntos` (`idConjunto`),
  ADD CONSTRAINT `conjuntos_productos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
