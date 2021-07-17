
USE `blog_user`;
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`(
`role_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(64),

    -- auditable
    `created_date`       timestamp   default current_timestamp(),
    `last_modified_by`   varchar(32) default 'system',
    `last_modified_date` timestamp   default current_timestamp(),
    `record_status`      int         default 1
);
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
`user_id` INT PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(64),
`email` VARCHAR(128),
`password` VARCHAR(512),
`display_name` VARCHAR(128),
    -- auditable
    `created_date`       timestamp   default current_timestamp(),
    `last_modified_by`   varchar(32) default 'system',
    `last_modified_date` timestamp   default current_timestamp(),
    `record_status`      int         default 1
);

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`(
`user_fk` INT,
`role_fk` INT,
PRIMARY KEY(`user_fk`,`role_fk`),
CONSTRAINT user_role_fk FOREIGN KEY(`user_fk`) REFERENCES user(`user_id`),
CONSTRAINT role_user_fk FOREIGN KEY (`role_fk`) REFERENCES role(`role_id`),
    -- auditable
    `created_date`       timestamp   default current_timestamp(),
    `last_modified_by`   varchar(32) default 'system',
    `last_modified_date` timestamp   default current_timestamp(),
    `record_status`      int         default 1
);