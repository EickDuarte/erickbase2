use universidad;

CREATE TABLE `estudiantes` (
  `id_estudiantes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_estudiantes`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

 CREATE TABLE `profesores` (
  `id_profesores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_profesores`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `profesores` (`nombre`, `apellido`, `correo`) 
VALUES 
  ('Laura', 'González', 'laura.gonzalez@mail.com'),
  ('Luis', 'Martín', 'luis.martin@mail.com'),
  ('Sofía', 'Rodríguez', 'sofia.rodriguez@mail.com'),
  ('Andrés', 'Fernández', 'andres.fernandez@mail.com'),
  ('Marta', 'Pérez', 'marta.perez@mail.com');

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesores`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cursos` (`nombre_curso`, `descripcion`, `id_profesor`) 
VALUES 
  ('Matemáticas I', 'Curso introductorio de álgebra y geometría', 1),
  ('Física Básica', 'Estudio de las leyes fundamentales de la física', 2),
  ('Literatura Universal', 'Exploración de los principales movimientos literarios y autores', 3),
  ('Química General', 'Fundamentos de la química orgánica e inorgánica', 4),
  ('Historia Contemporánea', 'Análisis de los eventos históricos más importantes del siglo XX', 5);
  
  CREATE TABLE `estudiantes_cursos` (
  `id_estudiantes` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`id_estudiantes`,`id_curso`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `estudiantes_cursos_ibfk_1` FOREIGN KEY (`id_estudiantes`) REFERENCES `estudiantes` (`id_estudiantes`),
  CONSTRAINT `estudiantes_cursos_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `estudiantes_cursos` (`id_estudiantes`, `id_curso`, `fecha_registro`) 
VALUES 
  (1, 13, '2024-11-20'), -- Estudiante 1, curso 1 (Matemáticas I)
  (2, 14, '2024-11-21'), -- Estudiante 2, curso 2 (Física Básica)
  (3, 15, '2024-11-22'), -- Estudiante 3, curso 3 (Literatura Universal)
  (4, 16, '2024-11-20'), -- Estudiante 4, curso 4 (Química General)
  (5, 17, '2024-11-23'); -- Estudiante 5, curso 5 (Historia Contemporánea)
  
select *from estudiantes_cursos;
select *from estudiantes;
select *from cursos;
select *from profesores;

select nombre, correo from profesores;
select nombre, apellido, correo from estudiantes where nombre = "juan";
select nombre, apellido, correo from estudiantes where nombre like "%j%";
select nombre, apellido, correo from estudiantes where nombre like "_____";
select *from estudiantes where fecha_nacimiento between "2000-05-15" and "2001-02-11"
