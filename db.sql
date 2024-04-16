CREATE DATABASE IF NOT EXISTS phonebook /*!40100 DEFAULT CHARACTER SET utf8 */;

use phonebook;

CREATE TABLE IF NOT EXISTS ciudades (
  ciud_id int(11) NOT NULL AUTO_INCREMENT,
  ciud_nombre varchar(100) NOT NULL,
  PRIMARY KEY (ciud_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS personas (
    -- create dir_tel, dir_tipo_tel, dir nombre, dir_direccion, dir_ciud_id
    dir_tel varchar(10) NOT NULL,
    dir_tipo_tel varchar(10) NOT NULL,
    dir_nombre varchar(100) NOT NULL,
    dir_direccion varchar(100) NOT NULL,
    dir_ciud_id int(11) NOT NULL,
    PRIMARY KEY (dir_tel),
    FOREIGN KEY (dir_ciud_id) REFERENCES ciudades(ciud_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ciudades (ciud_nombre) VALUES
('Bogota'),
('Medellin'),
('Cali'),
('Barranquilla'),
('Cartagena');

INSERT INTO personas (dir_tel, dir_tipo_tel, dir_nombre, dir_direccion, dir_ciud_id) VALUES
('1234567890', 'Fijo', 'Juan Perez', 'Calle 1 # 2-3', 1),
('1234567891', 'Celular', 'Pedro Perez', 'Calle 2 # 3-4', 2),
('1234567892', 'Fijo', 'Maria Perez', 'Calle 3 # 4-5', 3),
('1234567893', 'Celular', 'Luis Perez', 'Calle 4 # 5-6', 4),
('1234567894', 'Fijo', 'Ana Perez', 'Calle 5 # 6-7', 5);
