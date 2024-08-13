-- SCRIPT DE CRECACIÓN DE TABLAS ASIGNADAS

-- Elaborado por: Brayan Gutiérrez Ramírez
-- Grado y Grupo:  9° A 
-- Programa Educativo: Ingeniería de Desarrollo y Gestión de Software 
-- Fecha elaboración:  13 de Agosto de 2024

-- Tabla: Cirugías
CREATE TABLE `tbb_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Paciente_ID` int unsigned NOT NULL,
  `Espacio_Medico_ID` int unsigned NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `Nivel_Urgencia` enum('Bajo','Medio','Alto') NOT NULL,
  `Horario` datetime NOT NULL,
  `Observaciones` text NOT NULL,
  `Valoracion_Medica` text NOT NULL,
  `Estatus` enum('Programada','En curso','Completada','Cancelada') NOT NULL,
  `Consumible` varchar(200) NOT NULL,
  `Fecha_Registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_paciente_idx` (`Paciente_ID`),
  KEY `fk_espacio_idx` (`Espacio_Medico_ID`),
  CONSTRAINT `fk_espacios_2` FOREIGN KEY (`Espacio_Medico_ID`) REFERENCES `tbc_espacios` (`ID`),
  CONSTRAINT `fk_paciente` FOREIGN KEY (`Paciente_ID`) REFERENCES `tbb_pacientes` (`Persona_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- Tabla: Cirugías Personal Médico
CREATE TABLE `tbd_cirugias_personal_medico` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Personal_Medico_ID` int unsigned NOT NULL,
  `Cirugia_ID` int unsigned NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_personal_medico_cirugia_idx` (`Personal_Medico_ID`),
  KEY `fk_cirugia_1_idx` (`Cirugia_ID`),
  CONSTRAINT `fk_cirugia_1` FOREIGN KEY (`Cirugia_ID`) REFERENCES `tbb_cirugias` (`ID`),
  CONSTRAINT `fk_personal_medico_cirugia` FOREIGN KEY (`Personal_Medico_ID`) REFERENCES `tbb_personal_medico` (`Persona_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci