DROP TABLE IF EXISTS formula_theme;
DROP TABLE IF EXISTS themes;
DROP TABLE IF EXISTS formulas;

CREATE TABLE `themes` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(256)
      COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `formulas` (
  `formula_id` int(11) NOT NULL AUTO_INCREMENT,
  `formula_name` varchar(256)
      COLLATE utf8_unicode_ci DEFAULT NULL,
  `formula_tex` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`formula_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `formula_theme` (
  `formula_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `formula_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`formula_theme_id`),
  KEY `fk_formula_theme_formula` (`formula_id`),
  KEY `fk_formula_theme_theme` (`theme_id`),
  CONSTRAINT `fk_formula_theme_formula`
      FOREIGN KEY (`formula_id`)
      REFERENCES `formulas` (`formula_id`)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  CONSTRAINT `fk_formula_theme_theme`
      FOREIGN KEY (`theme_id`)
      REFERENCES `themes` (`theme_id`)
      ON DELETE CASCADE
      ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
