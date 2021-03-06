-- MySQL Script generated by MySQL Workbench
-- 01/16/17 21:17:39
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- Base de donnée pour un petit site marchand de modèle réduit
--
-- Cette base est loin d’être complète, la colonne “rc” de la table maquette est un booléen car une maquette peut être Radio Commandé (R.C) ou non,
-- ce qui implique de créer d’autre table pour toutes les pièces électroniques, thermique, télécommande etc….
-- la table commande est à etoffer.


-- -----------------------------------------------------
-- Schema modelisme
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modelisme` DEFAULT CHARACTER SET utf8 ;
USE `modelisme` ;

-- -----------------------------------------------------
-- Table `modelisme`.`cp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`cp` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`ville`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`ville` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'pour faciliter l’exercice, une ville à un code postal.',
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `cp_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ville_cp1_idx` (`cp_id` ASC),
  CONSTRAINT `fk_ville_cp1`
    FOREIGN KEY (`cp_id`)
    REFERENCES `modelisme`.`cp` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`pays` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `ville_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pays_ville_idx` (`ville_id` ASC),
  CONSTRAINT `fk_pays_ville`
    FOREIGN KEY (`ville_id`)
    REFERENCES `modelisme`.`ville` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`adresse` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `adresse` VARCHAR(45) NOT NULL,
  `adresse2` VARCHAR(45) NULL DEFAULT NULL,
  `adresse3` VARCHAR(45) NULL DEFAULT NULL,
  `pays_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adresse_pays1_idx` (`pays_id` ASC),
  CONSTRAINT `fk_adresse_pays1`
    FOREIGN KEY (`pays_id`)
    REFERENCES `modelisme`.`pays` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`acheteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`acheteur` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `adresse_id` INT(11) NOT NULL,
  `tel` VARCHAR(15) NOT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `pseudo` VARCHAR(20) NULL DEFAULT NULL,
  `pass` VARCHAR(20) NULL DEFAULT NULL,
  `valide` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acheteur_adresse1_idx` (`adresse_id` ASC),
  CONSTRAINT `fk_acheteur_adresse1`
    FOREIGN KEY (`adresse_id`)
    REFERENCES `modelisme`.`adresse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`categorie` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`commande` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'la primary key, sert de numero de commande, par défaut elle commencera à 1. Prevoir un TIME STAMP en date  pour la colonne dateCreation.',
  `dateCreation` DATE NOT NULL,
  `tva` FLOAT(8,2) NOT NULL,
  `acheteur_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_commande_acheteur1_idx` (`acheteur_id` ASC),
  CONSTRAINT `fk_commande_acheteur1`
    FOREIGN KEY (`acheteur_id`)
    REFERENCES `modelisme`.`acheteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`marque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`marque` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adresse_id` INT(11) NOT NULL,
  `tel` VARCHAR(15) NOT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `valide` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_marque_adresse1_idx` (`adresse_id` ASC),
  CONSTRAINT `fk_marque_adresse1`
    FOREIGN KEY (`adresse_id`)
    REFERENCES `modelisme`.`adresse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`produit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `marque_id` INT(11) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prix` FLOAT(8,2) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_produit_marque1_idx` (`marque_id` ASC),
  CONSTRAINT `fk_produit_marque1`
    FOREIGN KEY (`marque_id`)
    REFERENCES `modelisme`.`marque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 72
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`commander`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`commander` (
  `produit_id` INT(11) NOT NULL,
  `commande_id` INT(11) NOT NULL,
  PRIMARY KEY (`produit_id`, `commande_id`),
  INDEX `fk_produit_has_commande_commande1_idx` (`commande_id` ASC),
  INDEX `fk_produit_has_commande_produit1_idx` (`produit_id` ASC),
  CONSTRAINT `fk_produit_has_commande_commande1`
    FOREIGN KEY (`commande_id`)
    REFERENCES `modelisme`.`commande` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produit_has_commande_produit1`
    FOREIGN KEY (`produit_id`)
    REFERENCES `modelisme`.`produit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`taille`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`taille` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `echelle` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`figurine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`figurine` (
  `produit_id` INT(11) NOT NULL,
  `taille_id` INT(11) NOT NULL,
  PRIMARY KEY (`produit_id`),
  INDEX `fk_figurine_taille1_idx` (`taille_id` ASC),
  INDEX `fk_figurine_produit1_idx` (`produit_id` ASC),
  CONSTRAINT `fk_figurine_produit1`
    FOREIGN KEY (`produit_id`)
    REFERENCES `modelisme`.`produit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_figurine_taille1`
    FOREIGN KEY (`taille_id`)
    REFERENCES `modelisme`.`taille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`maquette`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`maquette` (
  `produit_id` INT(11) NOT NULL COMMENT 'table pour les maquettes, même rôle que outils. La colline « rc » est un booléen pour dire si oui on peu radio-commander la maquette ou non.',
  `rc` TINYINT(1) NOT NULL,
  `taille_id` INT(11) NOT NULL,
  PRIMARY KEY (`produit_id`),
  INDEX `fk_maquette_taille1_idx` (`taille_id` ASC),
  INDEX `fk_maquette_produit1_idx` (`produit_id` ASC),
  CONSTRAINT `fk_maquette_produit1`
    FOREIGN KEY (`produit_id`)
    REFERENCES `modelisme`.`produit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_maquette_taille1`
    FOREIGN KEY (`taille_id`)
    REFERENCES `modelisme`.`taille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`materiaux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`materiaux` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'la table matériaux n’a pas la même association avec les outils et les maquettes. Les maquettes SONT en plastique, et les outils sont UTILISER pour le plastique.',
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`maquette_has_materiaux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`maquette_has_materiaux` (
  `materiaux_id` INT(11) NOT NULL COMMENT 'table associative une maquette peu être en bois et en métal, et un matériaux à plusieurs maquettes.',
  `maquette_produit_id` INT(11) NOT NULL,
  PRIMARY KEY (`materiaux_id`, `maquette_produit_id`),
  INDEX `fk_maquette_has_materiaux_materiaux1_idx` (`materiaux_id` ASC),
  INDEX `fk_etre_maquette1_idx` (`maquette_produit_id` ASC),
  CONSTRAINT `fk_etre_maquette1`
    FOREIGN KEY (`maquette_produit_id`)
    REFERENCES `modelisme`.`maquette` (`produit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_maquette_has_materiaux_materiaux1`
    FOREIGN KEY (`materiaux_id`)
    REFERENCES `modelisme`.`materiaux` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`outils`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`outils` (
  `produit_id` INT(11) NOT NULL COMMENT 'la table produit permet de récupérer les outils dans la table produit grace aux jointures. Elle pourra dans l’avenir étoffer les outils (si ils ont une taille, etc… ',
  PRIMARY KEY (`produit_id`),
  INDEX `fk_outils_produit1_idx` (`produit_id` ASC),
  CONSTRAINT `fk_outils_produit1`
    FOREIGN KEY (`produit_id`)
    REFERENCES `modelisme`.`produit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`peinture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`peinture` (
  `produit_id` INT(11) NOT NULL,
  `ral` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`produit_id`),
  INDEX `fk_peinture_produit1_idx` (`produit_id` ASC),
  CONSTRAINT `fk_peinture_produit1`
    FOREIGN KEY (`produit_id`)
    REFERENCES `modelisme`.`produit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`produit_has_categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`produit_has_categorie` (
  `produit_id` INT(11) NOT NULL COMMENT 'table associative plusieurs un produit, peu avoir plusieurs catégorie, et une catégorie à plusieurs produit.',
  `categorie_id` INT(11) NOT NULL,
  PRIMARY KEY (`produit_id`, `categorie_id`),
  INDEX `fk_produit_has_categorie_categorie1_idx` (`categorie_id` ASC),
  INDEX `fk_produit_has_categorie_produit1_idx` (`produit_id` ASC),
  CONSTRAINT `fk_produit_has_categorie_categorie1`
    FOREIGN KEY (`categorie_id`)
    REFERENCES `modelisme`.`categorie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produit_has_categorie_produit1`
    FOREIGN KEY (`produit_id`)
    REFERENCES `modelisme`.`produit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`utiliser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`utiliser` (
  `materiaux_id` INT(11) NOT NULL COMMENT 'voir matériaux et maquette_has_materiaux.',
  `outils_produit_id` INT(11) NOT NULL,
  PRIMARY KEY (`materiaux_id`, `outils_produit_id`),
  INDEX `fk_materiaux_has_outils_materiaux1_idx` (`materiaux_id` ASC),
  INDEX `fk_utiliser_outils1_idx` (`outils_produit_id` ASC),
  CONSTRAINT `fk_utiliser_outils1`
    FOREIGN KEY (`outils_produit_id`)
    REFERENCES `modelisme`.`outils` (`produit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `utiliser_ibfk_1`
    FOREIGN KEY (`materiaux_id`)
    REFERENCES `modelisme`.`materiaux` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `modelisme`.`categorieCouleur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`categorieCouleur` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'table pour créer une catégorie pour les couleurs, elle n’a pas de foreign key pour faire des test d’insertions facilement.',
  `blanc` VARCHAR(45) NULL,
  `jaune` VARCHAR(45) NULL,
  `orange` VARCHAR(45) NULL,
  `rouge` VARCHAR(45) NULL,
  `violet` VARCHAR(45) NULL,
  `bleu` VARCHAR(45) NULL,
  `vert` VARCHAR(45) NULL,
  `gris` VARCHAR(45) NULL,
  `noir` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

USE `modelisme` ;

-- -----------------------------------------------------
-- Placeholder table for view `modelisme`.`vueGlobalProduit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelisme`.`vueGlobalProduit` (`nomMarque` INT, `nomProduit` INT, `prix` INT, `description` INT, `ral` INT, `rc` INT, `categorie` INT);

-- -----------------------------------------------------
-- View `modelisme`.`vueGlobalProduit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modelisme`.`vueGlobalProduit`;
USE `modelisme`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `modelisme`.`vueGlobalProduit` AS select `modelisme`.`marque`.`nom` AS `nomMarque`,`modelisme`.`produit`.`nom` AS `nomProduit`,`modelisme`.`produit`.`prix` AS `prix`,`modelisme`.`produit`.`description` AS `description`,`modelisme`.`peinture`.`ral` AS `ral`,`modelisme`.`maquette`.`rc` AS `rc`,`modelisme`.`categorie`.`nom` AS `categorie` from (((((`modelisme`.`produit` left join `modelisme`.`peinture` on((`modelisme`.`produit`.`id` = `modelisme`.`peinture`.`produit_id`))) join `modelisme`.`marque` on((`modelisme`.`marque`.`id` = `modelisme`.`produit`.`marque_id`))) left join `modelisme`.`maquette` on((`modelisme`.`produit`.`id` = `modelisme`.`maquette`.`produit_id`))) join `modelisme`.`produit_has_categorie` on((`modelisme`.`produit`.`id` = `modelisme`.`produit_has_categorie`.`produit_id`))) join `modelisme`.`categorie` on((`modelisme`.`produit_has_categorie`.`categorie_id` = `modelisme`.`categorie`.`id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
