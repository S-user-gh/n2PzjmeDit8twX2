CREATE DATABASE start_app;
USE start_app;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  CONSTRAINT `user_primary_key` PRIMARY KEY (`user_id`),
  CONSTRAINT `user_unique_key` UNIQUE (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) DEFAULT NULL,
  CONSTRAINT `role_primary_key` PRIMARY KEY (`role_id`),
  CONSTRAINT `role_unique_key` UNIQUE (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  CONSTRAINT `user_roles_primary_key` PRIMARY KEY (`id`),
  CONSTRAINT `user_roles_unique_key` UNIQUE (`user_id`,`role_id`),
  CONSTRAINT `user_roles_foreign_key_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_roles_foreign_key_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO roles (`role`) values ('ADMIN');
INSERT INTO roles (`role`) values ('USER');