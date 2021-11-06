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
INSERT INTO formulas VALUES ("0","КПД","| &#951 | =\\frac{ | A_п | }{ | A | }","1");
INSERT INTO formulas VALUES ("0","КПД","| &#951 | =\\frac{ | N_п | }{ | N | }","1");
INSERT INTO formulas VALUES ("0","зависимость координаты колеблющегося тела от времени","| x | = | A | \\cdot | \\sin | ( | \\omega | \\cdot | t | + | &phi;_0 | ) &nbsp;","1");
INSERT INTO formulas VALUES ("0","зависимость проекции скорости колеблющегося тела от времени","| &upsilon;_x | = | &upsilon;_m | \\cdot | \\cos | ( | \\omega | \\cdot | t | + | &phi;_0 | ) &nbsp;","1");
INSERT INTO formulas VALUES ("0","зависимость проекции ускорения колеблющегося тела от времени","| a_x | = | -a_m | \\cdot | \\sin | ( | \\omega | \\cdot | t | + | &phi;_0 | ) &nbsp;","1");
INSERT INTO formulas VALUES ("0","циклическая частота","| \\omega | = | 2 | \\cdot | \\pi | \\cdot | &nu; | =\\frac{ | 2 | \\cdot | \\pi | }{ | T | }","1");
INSERT INTO formulas VALUES ("0","связь между периодом и частотой колебаний","| T | =\\frac{ | 1 | }{ | T | }","1");
INSERT INTO formulas VALUES ("0","связь между периодом и частотой колебаний","| &nu; | =\\frac{ | 1 | }{ | T | }","1");
INSERT INTO formulas VALUES ("0","максимальная скорость колеблющегося тела","| &upsilon;_m | = | \\omega | \\cdot | A | &nbsp;","1");
INSERT INTO formulas VALUES ("0","максимальное ускорение колеблющегося тела","| a_m | = | (-1) | \\cdot | \\omega^2 | \\cdot | A | &nbsp;","1");
INSERT INTO formulas VALUES ("0","период колебаний пружинного маятника","| T | = | 2 | \\cdot | \\pi | \\sqrt{\\frac{ | m | }{ | k | } } &nbsp;","1");
INSERT INTO formulas VALUES ("0","период колебаний математического маятника","| T | = | 2 | \\cdot | \\pi | \\sqrt{\\frac{ | l | }{ | g | }} &nbsp;","1");
INSERT INTO formulas VALUES ("0","полная энергия колеблющегося на пружине тела","| &nbsp; | \\frac{ | k | \\cdot | A^2 | }{ | 2 | } = \\frac{ | m | \\cdot | &upsilon;_x^2 | }{ | 2 | } + \\frac{ | k | \\cdot | x^2 | }{ | 2 | } = \\frac{ | m | \\cdot | &upsilon;_m^2 | }{ | 2 | }","1");
INSERT INTO formulas VALUES ("0","длина волны","| \\lambda | = | &upsilon; | \\cdot | T | &nbsp;","1");
INSERT INTO formulas VALUES ("0","количество вещества","| \\nu | =\\frac{ | N | }{ | N_A | } = \\frac{ | m | }{ | M | }","2");
INSERT INTO formulas VALUES ("0","молярная масса","| M | = | m_o | \\cdot | N_A | &nbsp;","2");
INSERT INTO formulas VALUES ("0","основное уравнение МКТ идеального газа, записанное через квадрат скорости движения молекул","| p | = \\frac{ | 1 | }{ | 3 | } \\cdot | n | \\cdot | m_o | \\cdot | (\\overline{&upsilon;})^2 | &nbsp;","2");
INSERT INTO formulas VALUES ("0","основное уравнение МКТ идеального газа, записанное через среднюю кинетическую энергию поступательного движения молекул","| p | = \\frac{ | 2 | }{ | 3 | } \\cdot | n | \\cdot | \\overline{E} | &nbsp;","2");
INSERT INTO formulas VALUES ("0","зависимость давления газа от температуры и концентрации его молекул","| p | = | n | \\cdot | k | \\cdot | t | &nbsp;","2");
INSERT INTO formulas VALUES ("0","зависимость средней кинетической энергии поступательного движения молекул от температуры","| \\overline{E} | = \\frac{ | 3 | }{ | 2 | } \\cdot | k | \\cdot | T | &nbsp;","2");
INSERT INTO formulas VALUES ("0","зависимость средней квадратичной скорости движения молекул от температуры","| &upsilon; | = \\sqrt{ \\frac{ | 3 | \\cdot | R | \\cdot | T | }{ | M | } } &nbsp;","2");
INSERT INTO formulas VALUES ("0","уравнение Клайперона","| &nbsp; | \\frac{ | p | \\cdot | V | }{ | T | }= | const |&nbsp;","2");
INSERT INTO formulas VALUES ("0","уравнение Менделеева-Клайперона","| p | \\cdot | V | = \\frac{ | m | }{ | M | }\\cdot | R | \\cdot | T | &nbsp;","2");
INSERT INTO formulas VALUES ("0","закон Бойля-Мариота","| p | \\cdot | v | = | const | при | T | = | const | &nbsp;","2");
INSERT INTO formulas VALUES ("0","закон Гей-Люссака","| &nbsp; | \\frac{ | V | }{ | T | }= | const | | при | p | = | const | &nbsp;","2");
INSERT INTO formulas VALUES ("0","закон Шарля","| &nbsp; | \\frac{ | p | }{ | T | }= | const | при | V | = | const | &nbsp;","2");
INSERT INTO formulas VALUES ("0","внутренняя энергия идеального газа","| U | = \\frac{ | i | }{ | 2 | } \\cdot \\frac{ | m | }{ | M | } \\cdot | R | \\cdot | T | &nbsp;","3");
INSERT INTO formulas VALUES ("0","колличество теплоты, поглощаемое или выделяемое телом при изменении его температуры","| Q | = | c | \\cdot | m | ( | t_2 | - | t_1 | ) &nbsp;","3");
INSERT INTO formulas VALUES ("0","теплоемкость тела","| C | = | c | \\cdot | m | &nbsp;","3");
INSERT INTO formulas VALUES ("0","колличество теплоты, необходимое для превращения в пар жидкости, взятой при температуре кипения","| Q_п | = | r | \\cdot | m | &nbsp;","3");
INSERT INTO formulas VALUES ("0","колличество теплоты, необходимое для плавления кристаллического вещества, взятого при температуре плавления","| Q_{пл} | = | \\lambda | \\cdot | m | &nbsp;","3");
INSERT INTO formulas VALUES ("0","колличество теплоты, выделяемое при полном сгорании данной массы топлива","| Q_{сг} | = | (-1) | \\cdot | q | \\cdot | m | &nbsp;","3");
INSERT INTO formulas VALUES ("0","работа, совершенная газом","| A' | = | p | \\cdot | \\Delta V | &nbsp;","3");
INSERT INTO formulas VALUES ("0","уравнение первого начала термодинамики","| Q | = | \\Delta U | + | A' | &nbsp;","3");
INSERT INTO formulas VALUES ("0","уравнение теплового баланса","| \\sum_{i=1}^n | &nbsp; | Q_i | = | 0 | &nbsp;","3");
INSERT INTO formulas VALUES ("0","КПД идеальной тепловой машины","| &#951 | =\\frac{ | T_1 | - | T_2 | }{ | T-1 | }","3");
INSERT INTO formulas VALUES ("0","КПД теплового двигателя","| &#951 | = | &#951 | =\\frac{ | Q_1 | - | Q_2 | }{ | Q_1 | }","3");
INSERT INTO formulas VALUES ("0","закон Кулона","| F | = | k | \\frac{ \\vert | q_1 | \\vert \\cdot \\vert | q_2 | \\vert }{ | &epsilon; | \\cdot | r^2 | }","4");
INSERT INTO formulas VALUES ("0","коэффициент пропорциональности","| k | =\\frac{ | 1 | }{ | 4 | \\cdot | \\pi | \\cdot | &epsilon;_0 | } = | 9 | \\cdot | 10^9 | \\frac{ | &Iota; | \\cdot | \\iota | }{ | \\hat{E} | \\cdot | ё^2 | }","4");
INSERT INTO formulas VALUES ("0","напряженность электростатического поля","| \\vec{E} | =\\frac{ | \\vec{F} | }{ | q | }","4");
INSERT INTO formulas VALUES ("0","модуль напряженности электростатического поля точечного заряда","| E | =\\frac{\\vert | q | \\vert}{ | &epsilon; | \\cdot | r^2 | }","4");
INSERT INTO formulas VALUES ("0","модуль напряженности электростатического поля, заряженного поля","| E | = | k | \\cdot \\frac{  \\vert | q_ш | \\vert  }{ | &epsilon; | \\cdot ( | R | + | r | )^2 }","4");
INSERT INTO formulas VALUES ("0","принцип суперпозиции электрических полей","| \\vec{E} | = | \\sum_{i = 1}^n | &nbsp; | \\vec{E_i} | &nbsp;","4");
INSERT INTO formulas VALUES ("0","потенциал электростатического поля","| &phi; | = \\frac{ | W_p | }{ | q | }","4");
INSERT INTO formulas VALUES ("0","потенциал электростатического поля точечного заряда","| &phi; | = | k | \\cdot \\frac{ | q | }{ | &epsilon; | \\cdot | r | }","4");
INSERT INTO formulas VALUES ("0","потенциал электростатического поля заряженного шара","| &phi; | = | k | \\cdot \\frac{ | q_ш | }{ | &epsilon; | \\cdot ( | R | + | r | ) }","4");
INSERT INTO formulas VALUES ("0","потенциал однородного электростатичесого поля","| &phi; | = | E | \\cdot | d | &nbsp;","4");
INSERT INTO formulas VALUES ("0","потенциал электростатического поля системы зарядов","| &phi; | = | \\sum_{i = 1}^n | &nbsp; | &phi;_i | &nbsp;","4");
INSERT INTO formulas VALUES ("0","связь между модулем напряженности и напряжением для однородного электростатического поля","| E | =\\frac{ | U | }{ | d | }","4");
INSERT INTO formulas VALUES ("0","потенциальная энергия взаимоднйствия двух электрических зарядов","| W | = | k | \\cdot \\frac{ | q_1 | \\cdot | q_2 | }{ | r | }","4");
INSERT INTO formulas VALUES ("0","электроемкость конденсатора","| C | =\\frac{ | q | }{ | U | }","4");
INSERT INTO formulas VALUES ("0","электроемкость плоского конденсатора","| C | =\\frac{ | &epsilon;_0 | \\cdot | &epsilon; | \\cdot | S | }{ | d | }","4");
INSERT INTO formulas VALUES ("0","электроемкость паралельно соединенных конденсаторов","| C | = | \\sum_{i = 1}^n | &nbsp; | C_i | &nbsp;","4");
INSERT INTO formulas VALUES ("0","поверхностная плотность заряда","| &sigma; | = \\frac{ | q | }{ | S | }","4");
INSERT INTO formulas VALUES ("0","сила электрического тока","| I | = \\frac{ | q | }{ | t | }","4");
INSERT INTO formulas VALUES ("0","зависимость тока от заряда, концентрации, скорости, и площади поперечного сечения проводника","| I | = | q_0 | \\cdot | n | \\cdot | &upsilon; | \\cdot | S | &nbsp;","4");
INSERT INTO formulas VALUES ("0","модуль плотности электрического тока","| j | =\\frac{ | I | }{ | S | }","4");
INSERT INTO formulas VALUES ("0","закон Ома для участка цепи","| I | =\\frac{ | U | }{ | R | }","4");
INSERT INTO formulas VALUES ("0","зависимость сопротивления от рода вещества, длины и поперечного сечения проводника","| R | = | p | \\cdot \\frac{ | l | }{ | S | }","4");
INSERT INTO formulas VALUES ("0","зависимость сопротивления проводника от температуры","| R | = | R_0 | \\cdot ( | 1 | + | a | \\cdot | t | ) &nbsp;","4");
INSERT INTO formulas VALUES ("0","сопротивление последовательно соединенных резисторов","| R | = | \\sum_{i=1}^n | &nbsp; | R_i | &nbsp;","4");
INSERT INTO formulas VALUES ("0","закон Джоуля-Ленца","| Q | = | I^2 | \\cdot | R | \\cdot | t | &nbsp;","4");
INSERT INTO formulas VALUES ("0","ЭДС","| &Epsilon; | =\\frac{ | A_{cm} | }{ | q | }","4");
INSERT INTO formulas VALUES ("0","закон Ома для полной цепи","| I | =\\frac{ | E | }{ | R | + | r | }","4");
INSERT INTO formulas VALUES ("0","сила тока в неразветвленной части полной цепи с n паралельно соединенными одинаковыми элементами ЭДС","| I | =\\frac{ | E | }{ | R | +\\frac{ | r | }{ | n | }}","4");
INSERT INTO formulas VALUES ("0","закон Фарадея для электролиза","| m | = | k | \\cdot | I | \\cdot | T | &nbsp;","4");
INSERT INTO formulas VALUES ("0","закон Ампера","| F | = | I | \\cdot | B | \\cdot | \\Delta{l} | \\cdot | \\sin\\alpha | &nbsp;","4");
INSERT INTO formulas VALUES ("0","модуль силы Лоренца","| F | = \\vert | q | \\vert \\cdot | &upsilon; | \\cdot | B | \\cdot | \\sin\\alpha | &nbsp;","4");
INSERT INTO formulas VALUES ("0","импульс заряженной частицы, движущейся по окружности в магнитном поле","| m | \\cdot | &upsilon; | = | q | \\cdot | B | \\cdot | R | &nbsp;","4");
INSERT INTO formulas VALUES ("0","магнитный поток","| &Phi; | = | B | \\cdot | S | \\cdot | \\cos\\alpha | &nbsp;","4");
INSERT INTO formulas VALUES ("0","закон электромагнитной индукции","| &Epsilon;_i | = | (-1) | \\cdot \\frac{ | \\Delta{\\Phi} | }{ | \\Delta{t} | }","4");
INSERT INTO formulas VALUES ("0","магнитный поток через поверхность, ограниченную контуром","| \\Phi | = | L | \\cdot | I | &nbsp;","4");
INSERT INTO formulas VALUES ("0","максимальное значение ЭДС, возникающее в рамке, равномерно вращающейся в магнитном поле","| &Epsilon;_m | = | \\omega | \\cdot | \\Phi_m | &nbsp;","4");
INSERT INTO formulas VALUES ("0","ЭДС индукции в движущихся проводниках","| &Epsilon; | = | B | \\cdot | &upsilon; | \\cdot | l | \\cdot | \\sin\\alpha | &nbsp;","4");
INSERT INTO formulas VALUES ("0","электрический заряд, протекающий по замкнотому контуру, при изменении магнитного потока пронизывающего контур","| q | =\\frac{ | \\Delta \\Phi | }{ | R | }","4");
INSERT INTO formulas VALUES ("0","зависимость заряда на обкладках конденсатора в колебательном контуре от времени","| q | = | q_m | \\cdot | \\sin | ( | \\omega | \\cdot | t | + | &phi;_0 | )","4");
INSERT INTO formulas VALUES ("0","зависимость напряжения на обкладках конденсатора в колебательном контуре от времени","| u | = | U_m | \\cdot | \\sin | ( | \\omega | \\cdot | t | + | &phi;_0 | )","4");
INSERT INTO formulas VALUES ("0","зависимость силы тока в колебательном контуре от времени","| i | = | I_m | \\cdot | \\cos | ( | \\omega | \\cdot | t | + | &phi;_0 | )","4");
INSERT INTO formulas VALUES ("0","максимальное значение силы тока при электромагнитных колебаниях","| I_m | = | \\omega | \\cdot | q_m | &nbsp;","4");
INSERT INTO formulas VALUES ("0","период собственных колебаний колебательного круга (закон Томсона)","| T | = | 2 | \\cdot | \\pi | \\cdot \\sqrt{ | L | \\cdot | C | }","4");
INSERT INTO formulas VALUES ("0","энергия магнитного поля","| W_m | =\\frac{ | L | \\cdot | i^2 | }{ | 2 | }","4");
INSERT INTO formulas VALUES ("0","действующее значение силы переменного электрического тока","| I_{&sigma;} | =\\frac{ | I_m | }{\\sqrt{ | 2 | }}","4");
INSERT INTO formulas VALUES ("0","действующее значение силы переменного напряжения","| U_&sigma; | =\\frac{ | U_m | }{\\sqrt{ | 2 | }}","4");
INSERT INTO formulas VALUES ("0","индукционное сопротивление","| X_L | = | \\omega | \\cdot | L | &nbsp;","4");
INSERT INTO formulas VALUES ("0","емкостное сопротивление","| X_C | =\\frac{ | 1 | }{ | \\omega | \\cdot | C | }","4");
INSERT INTO formulas VALUES ("0","полное сопротивление цепи переменного тока","| Z | =\\sqrt{ | R^2 | + ( | X_L | - | X_C | )^2}","4");
INSERT INTO formulas VALUES ("0","закон Ома для участка цепи переменного тока","| I | =\\frac{ | U | }{ | Z | }","4");
INSERT INTO formulas VALUES ("0","закон преломления света","| &nbsp; | \\frac{ | \\sin\\alpha | }{ | \\sin\\beta | }=\\frac{ | n_2 | }{ | n_1 | }=\\frac{ | &upsilon;_1 | }{ | &upsilon;_2 | }","5");
INSERT INTO formulas VALUES ("0","абсолютный показатель преломления","| n | =\\frac{ | c | }{ | &upsilon; | }","5");
INSERT INTO formulas VALUES ("0","формула тонкой линзы","| &nbsp; | \\pm\\frac{ | 1 | }{ | F | }=\\pm\\frac{ | 1 | }{ | f | }\\pm\\frac{ | 1 | }{ | d | }","5");
INSERT INTO formulas VALUES ("0","оптическая сила линзы","| D | =\\frac{ | 1 | }{ | F | }","5");
INSERT INTO formulas VALUES ("0","линейное увеличение линзы","| \\Gamma | =\\frac{ | H | }{ | h | }=\\frac{ | f | }{ | d | }","5");
INSERT INTO formulas VALUES ("0","условие интерференционного минимума","| \\Delta | =( | 2 | \\cdot | k | + | 1 | )\\cdot\\frac{ | \\lambda | }{ | 2 | }","5");
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
