-- Base de datos: `gasolinera`
--
CREATE DATABASE IF NOT EXISTS `gasolinera`;
USE `gasolinera`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasolinera`
--

CREATE TABLE `gasolinera` (
  `idgasolinera` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `idciudad` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idfactura` int(11) NOT NULL,
  `idtipopago` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `fechapago` date NOT NULL,
  `valor` decimal(8,2) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surtidordecombustible`
--

CREATE TABLE `surtidordecombustible` (
  `idsurtidor` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `galonesmarcados` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodecombustible`
--

CREATE TABLE `tipodecombustible` (
  `idtipocombustible` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` float NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventagasolina`
--

CREATE TABLE `ventagasolina` (
  `idgasolinera` int(11) NOT NULL,
  `idsurtidor` int(11) NOT NULL,
  `fechaventa` date NOT NULL,
  `tiempo` date NOT NULL,
  `galonesvendidos` int(11) NOT NULL,
  `valorapagar` decimal(8,2) NOT NULL,
  `idfactura` int(11) NOT NULL,
  `idtipodecombustible` int(11) NOT NULL
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idciudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `gasolinera`
--
ALTER TABLE `gasolinera`
  ADD PRIMARY KEY (`idgasolinera`),
  ADD KEY `idciudad` (`idciudad`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idfactura`),
  ADD KEY `idtipopago` (`idtipopago`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `surtidordecombustible`
--
ALTER TABLE `surtidordecombustible`
  ADD PRIMARY KEY (`idsurtidor`);

--
-- Indices de la tabla `tipodecombustible`
--
ALTER TABLE `tipodecombustible`
  ADD PRIMARY KEY (`idtipocombustible`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- Indices de la tabla `ventagasolina`
--
ALTER TABLE `ventagasolina`
  ADD PRIMARY KEY (`idgasolinera`),
  ADD KEY `idsurtidor` (`idsurtidor`),
  ADD KEY `idfactura` (`idfactura`),
  ADD KEY `idtipodecombustible` (`idtipodecombustible`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gasolinera`
--
ALTER TABLE `gasolinera`
  MODIFY `idgasolinera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idfactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `surtidordecombustible`
--
ALTER TABLE `surtidordecombustible`
  MODIFY `idsurtidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodecombustible`
--
ALTER TABLE `tipodecombustible`
  MODIFY `idtipocombustible` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventagasolina`
--
ALTER TABLE `ventagasolina`
  MODIFY `idgasolinera` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idciudad`) REFERENCES `gasolinera` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gasolinera`
--
ALTER TABLE `gasolinera`
  ADD CONSTRAINT `gasolinera_ibfk_1` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `gasolinera_ibfk_2` FOREIGN KEY (`idgasolinera`) REFERENCES `ventagasolina` (`idgasolinera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idtipopago`) REFERENCES `tipopago` (`idtipopago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipodecombustible`
--
ALTER TABLE `tipodecombustible`
  ADD CONSTRAINT `tipodecombustible_ibfk_1` FOREIGN KEY (`idtipocombustible`) REFERENCES `ventagasolina` (`idtipodecombustible`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD CONSTRAINT `tipopago_ibfk_1` FOREIGN KEY (`idtipopago`) REFERENCES `pago` (`idtipopago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventagasolina`
--
ALTER TABLE `ventagasolina`
  ADD CONSTRAINT `ventagasolina_ibfk_1` FOREIGN KEY (`idgasolinera`) REFERENCES `gasolinera` (`idgasolinera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventagasolina_ibfk_2` FOREIGN KEY (`idsurtidor`) REFERENCES `surtidordecombustible` (`idsurtidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventagasolina_ibfk_3` FOREIGN KEY (`idtipodecombustible`) REFERENCES `tipodecombustible` (`idtipocombustible`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventagasolina_ibfk_4` FOREIGN KEY (`idfactura`) REFERENCES `pago` (`idfactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;