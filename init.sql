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
INSERT INTO formulas VALUES ("0","условие интерференционного максимума","| \\Delta | = | k | \\cdot | \\lambda | &nbsp;","5");
INSERT INTO formulas VALUES ("0","условие максимумов дифракционной решетки","| d | \\cdot | \\sin&phi; | = | k | \\cdot | \\lambda | &nbsp;","5");
INSERT INTO formulas VALUES ("0","релятивиcтский закон сложения скоростей","| &upsilon; | =\\frac{ | &upsilon;_1 | + | &upsilon;_2 | }{ | 1 | +\\frac{ | &upsilon;_1 | \\cdot | &upsilon;_2 | }{ | c^2 | }}","6");
INSERT INTO formulas VALUES ("0","длина стержня в инерциальной системе, относительно которой он движется со скоростью","| l | = | l_0 | \\sqrt{ | 1 | -\\frac{ | &upsilon;^2 | }{ | c^2 | }}","6");
INSERT INTO formulas VALUES ("0","интервал времени между двумя событиями в точке, которя движется относительо инерциальной системы со скоростью","| &tau; | =\\frac{ | &tau;_0 | }{\\sqrt{ | 1 | -\\frac{ | &upsilon;^2 | }{ | c^2 | }}}","6");
INSERT INTO formulas VALUES ("0","зависимость массы тела от скорости","| m | =\\frac{ | m_0 | }{\\sqrt{ | 1 | -\\frac{ | &upsilon;^2 | }{ | c^2 | }}}","6");
INSERT INTO formulas VALUES ("0","связь между массой и энергией","| E | = | m | \\cdot | c^2 | &nbsp;","6");
INSERT INTO formulas VALUES ("0","энергия фотона","| E | = | h | \\cdot | v | &nbsp;","7");
INSERT INTO formulas VALUES ("0","импульс фотона","| p | = | m | \\cdot | c | =\\frac{ | h | \\cdot | v | }{ | c | }","7");
INSERT INTO formulas VALUES ("0","уравнение Энштейна для фотоэффекта","| h | \\cdot | v | = | A | +\\frac{ | m | \\cdot | v | \\cdot | &upsilon;^2 | }{ | 2 | }","7");
INSERT INTO formulas VALUES ("0","работа выхода","| A | = | h | \\cdot | &nu;_min | = | h | \\frac{ | c | }{ | \\lambda_{кр} | }","7");
INSERT INTO formulas VALUES ("0","условие прекращения фотоэффекта","| &nbsp; | \\frac{ | m | \\cdot | &nu;^2 | }{ | 2 | }= | e | \\cdot | U_з | &nbsp;","7");
INSERT INTO formulas VALUES ("0","2-й постулат Бора","| h | \\cdot | &nu; | = | E_п | - | E_m | &nbsp;","7");
INSERT INTO formulas VALUES ("0","длина волны де-Бройля","| \\lambda | =\\frac{ | h | }{ | m | \\cdot | &upsilon; | }","7");
INSERT INTO formulas VALUES ("0","закон радиоактивного распада","| N | = | N_0 | \\cdot | 2 | ^{-\\frac{ | t | }{ | T| }} &nbsp;","7");
INSERT INTO formulas VALUES ("0","дефект масс","| \\Delta | \\cdot | M | = | Zm_p | + | Nm_p | - | M_я | &nbsp;","7");
INSERT INTO formulas VALUES ("0","энергия связи атомных ядер","| E_{св} | = | \\Delta | \\cdot | M | \\cdot | c^2 | &nbsp;","7");
--
