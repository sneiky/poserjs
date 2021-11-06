DROP USER IF EXISTS 'poserjs_user'@'localhost';
--
DROP DATABASE IF EXISTS poserjs_db;
--
FLUSH PRIVILEGES;
--
CREATE USER 'poserjs_user'@'localhost'
IDENTIFIED BY 'poserjs_pass';
--
CREATE DATABASE poserjs_db;
--
GRANT ALL PRIVILEGES ON poserjs_db.*
TO 'poserjs_user'@'localhost';
--
USE poserjs_db;
--
CREATE TABLE formulas (
formula_id INT(11) NOT NULL AUTO_INCREMENT,
formula_name TEXT,
formula_tex TEXT,
theme_id INT(11),
PRIMARY KEY (formula_id)
);
--
CREATE TABLE themes (
theme_id INT(11) NOT NULL AUTO_INCREMENT,
theme_name TEXT,
theme_icon TEXT,
PRIMARY KEY (theme_id)
);
--
ALTER TABLE formulas
ADD FOREIGN KEY (theme_id)
REFERENCES themes(theme_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
--
INSERT INTO themes VALUES ("0","Механика","svg/me.svg");
INSERT INTO themes VALUES ("0","Молекулярная физика","svg/mo.svg");
INSERT INTO themes VALUES ("0","Термодинамика","svg/te.svg");
INSERT INTO themes VALUES ("0","Электродинамика","svg/el.svg");
INSERT INTO themes VALUES ("0","Оптика","svg/op.svg");
INSERT INTO themes VALUES ("0","Теория относительности","svg/to.svg");
INSERT INTO themes VALUES ("0","Квантовая, атомная и ядерная физика","svg/kv.svg");
--
INSERT INTO formulas VALUES ("0","энергия связи атомных ядер","| E_{св} | = | \\Delta{M} | \\cdot | c^2 | &nbsp;","7");
--
