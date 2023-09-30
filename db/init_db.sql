-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema forum_database
-- -----------------------------------------------------
-- MySQL8 database for an online forum.

-- -----------------------------------------------------
-- Schema forum_database
--
-- MySQL8 database for an online forum.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forum_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `forum_database` ;

-- -----------------------------------------------------
-- Table `forum_database`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_database`.`users` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(320) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `post_count` INT NOT NULL DEFAULT 0,
  `vote_count` INT NOT NULL DEFAULT 0,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_database`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_database`.`posts` (
  `id` VARCHAR(36) NOT NULL,
  `users_id` VARCHAR(36) NOT NULL,
  `title` VARCHAR(128) NOT NULL,
  `text` LONGTEXT NULL,
  `vote_count` INT NOT NULL DEFAULT 0,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `forum_database`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_database`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_database`.`comments` (
  `id` VARCHAR(36) NOT NULL,
  `posts_id` VARCHAR(36) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `text` MEDIUMTEXT NOT NULL,
  `vote_count` INT NOT NULL DEFAULT 0,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_posts1_idx` (`posts_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `forum_database`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
