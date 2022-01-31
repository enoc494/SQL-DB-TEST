CREATE DATABASE `notas_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE notas_test;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que contiene a los usuarios, estos pueden gestionar a las notas';
CREATE TABLE `categorias` (
  `idcategorias` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  UNIQUE KEY `idcategorias_UNIQUE` (`idcategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categorias de las notas, cada categoria puede contener multiples notas';
CREATE TABLE `notas` (
  `idNotas` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `creado_en` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_en` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` text,
  `eliminable` tinyint NOT NULL,
  `ID-usuario` int NOT NULL,
  `ID-categoria` int NOT NULL,
  PRIMARY KEY (`idNotas`),
  UNIQUE KEY `idNotas_UNIQUE` (`idNotas`),
  CONSTRAINT `ID-categoria` FOREIGN KEY (`idNotas`) REFERENCES `categorias` (`idcategorias`),
  CONSTRAINT `ID-usuario` FOREIGN KEY (`idNotas`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de notas, estas pueden ser gestionadas por un único usuario y poseen una única categoría';

INSERT INTO `notas_test`.`categorias`
(`idcategorias`,
`nombre_categoria`)
VALUES
(1, "música"),
(2, "artes"),
(3, "alto desempeño"),
(4, "gamma alta"),
(5, "gamma media"),
(6, "gamma baja"),
(7, "merma"),
(8, "en descuento"),
(9, "sin existencias"),
(10, "obsoleto") ;
INSERT INTO `notas_test`.`usuarios`
(`idUsuarios`,
`nombre`,
`email`)
VALUES
( 1, "paco" ,"test@gmail"),
( 2, "charly" ,"test@gmail"),
( 3, "oz" ,"test@gmail"),
( 4, "jose" ,"test@gmail"),
( 5, "luis" ,"test@gmail"),
( 6, "paco" ,"test@gmail"),
( 7, "charly" ,"test@gmail"),
( 8, "oz" ,"test@gmail"),
( 9, "jose" ,"test@gmail"),
( 10, "luis" ,"test@gmail");
INSERT INTO `notas_test`.`notas`
(`idNotas`, `titulo`,
`creado_en`, `modificado_en`,
`descripcion`, `eliminable`,
`ID-usuario`, `ID-categoria`)
VALUES
(1, "Primer nota",CURRENT_TIMESTAMP , CURRENT_TIMESTAMP ,
"texto largooooo", 0, 1, 10),
(2, "Segunda nota",CURRENT_TIMESTAMP , CURRENT_TIMESTAMP ,
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id.", 0, 1, 1),
(3, "Segunda nota",CURRENT_TIMESTAMP , CURRENT_TIMESTAMP ,
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id.", 0, 2, 2),
(4, "Segunda nota",CURRENT_TIMESTAMP , CURRENT_TIMESTAMP ,
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id.", 0, 3, 3),
(5, "Tercer nota",CURRENT_TIMESTAMP , CURRENT_TIMESTAMP ,
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id.", 1, 4, 4),
(6, "Cuarta nota", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
"Lorem ipsum dolor sit amet, consectetur  elit. Aliquam id.", 1, 2, 8),
(7, "Cuarta nota", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
"Lorem ipsum dolor sit amet, consectetur  elit. Aliquam id.", 1, 2, 8),
(8, "Cuarta nota", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
"Lorem ipsum dolor sit amet, consectetur  elit. Aliquam id.", 1, 2, 7),
(9, "Cuarta nota", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
"Lorem ipsum dolor sit amet, consectetur  elit. Aliquam id.", 1, 7, 5),
(10, "Cuarta nota", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
"Lorem ipsum dolor sit amet, consectetur  elit. Aliquam id.", 1, 5, 8);

