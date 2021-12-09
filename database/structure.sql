CREATE DATABASE 'CleanfyBD';
USE CleanfyBD;

CREATE TABLE `users` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `firstname` TEXT NOT NULL,
   `lastname` TEXT NOT NULL,
   `email` VARCHAR(255) NOT NULL,
   `category` VARCHAR(255) NOT NULL,
   `image` CHAR NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `marca` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `magistral` VARCHAR(255) NOT NULL,
   `windex` VARCHAR(255) NOT NULL,
   `glade` VARCHAR(255) NOT NULL,
   `pledge` VARCHAR(255) NOT NULL,
   `procenex` VARCHAR(255) NOT NULL,
   `windex` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `category_productos` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `baño` VARCHAR(255) NOT NULL,
   `cocina` VARCHAR(255) NOT NULL,
   `exterior` VARCHAR(255) NOT NULL,
   `interior` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` TEXT NOT NULL,
   `price` VARCHAR(255) NOT NULL,
   `discount` VARCHAR(255) NOT NULL,
   `image` CHAR NOT NULL,
   `category` VARCHAR(255) NOT NULL,
   `marca` VARCHAR(255) NOT NULL,
   `users_id` INT,
   PRIMARY KEY (`id`)
);


ALTER TABLE `products` ADD CONSTRAINT `FK_961879fe-ee76-405d-838b-d47ee95601ef` FOREIGN KEY (`users_id`) REFERENCES `users`(`id`)  ;

ALTER TABLE `products` ADD CONSTRAINT `FK_bcc44070-36c4-40c9-9ce9-0b46a980bed0` FOREIGN KEY (`category`) REFERENCES `category_productos`(`id`)  ;

ALTER TABLE `products` ADD CONSTRAINT `FK_4d8df753-f018-4eaa-a023-c1fe183a43b9` FOREIGN KEY (`marca`) REFERENCES `marca`(`id`)  ;


