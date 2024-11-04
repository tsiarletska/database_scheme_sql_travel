DROP DATABASE IF EXISTS `travels`;
CREATE DATABASE `travels`;
USE `travels`;

SET NAMES utf8mb4; 
SET character_set_client = utf8mb4;

CREATE TABLE `manager` (
    `manager_id` INT NOT NULL, 
    `name` VARCHAR (50) NOT NULL, 
    `surname` VARCHAR (75) NOT NULL, 
    `position` VARCHAR (25) NOT NULL, 
    `work_phone` VARCHAR (25),
    `work_email` VARCHAR (50) NOT NULL,
    PRIMARY KEY (`manager_id`),
    UNIQUE KEY (`manager_id`)
);


CREATE TABLE `tour` (
    `tour_id` INT NOT NULL, 
    `tour_name` VARCHAR(100) NOT NULL, 
    `country` VARCHAR(100), 
    `n_days` INT NOT NULL, 
    `transport` VARCHAR(25) NOT NULL,
    `season` VARCHAR(10) NOT NULL, 
    `hotel` VARCHAR(15),
    `manager_id` INT NOT NULL, 
    PRIMARY KEY (`tour_id`),
    FOREIGN KEY (`manager_id`) REFERENCES  `manager`(`manager_id`),
    UNIQUE KEY (`tour_id`)
);

CREATE TABLE `client` (
    `client_id` INT NOT NULL, 
    `name` VARCHAR(50) NOT NULL, 
    `surname` VARCHAR(75) NOT NULL, 
    `phone` VARCHAR(25), 
    `email` VARCHAR(50), 
    `birthday` DATE,
    `manager_id` INT NOT NULL,
    PRIMARY KEY (`client_id`),
    FOREIGN KEY (`manager_id`) REFERENCES `manager`(`manager_id`),
    UNIQUE KEY (`client_id`)
);

CREATE TABLE `order` (
    `order_id` INT NOT NULL,
    `date` DATE NOT NULL, 
    `n_item` INT NOT NULL, 
    `sum` FLOAT NOT NULL, 
    `client_id` INT NOT NULL,
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`),
    UNIQUE KEY (`order_id`)
);

INSERT INTO `manager` (`manager_id`, `name`, `surname`, `position`, `work_phone`, `work_email` ) VALUES
(1, 'Liam', 'Smith', 'Touragent', '123456789', 'liam.smith@example.com'),
(2, 'Emma', 'Johnson', 'Touragent', '987654321', 'emma.johnson@example.com'),
(3, 'Noah', 'Brown', 'Senior Touragent', '456123789', 'noah.brown@example.com'),
(4, 'Olivia', 'Jones', 'Touragent', '789456123', 'olivia.jones@example.com'),
(5, 'William', 'Garcia',  'Touragent', '321654987', 'william.garcia@example.com'),
(6, 'Ava', 'Martinez',  'Senior Touragent', '654789321', 'ava.martinez@example.com'),
(7, 'James', 'Davis', 'Junior Touragent', '963852741', 'james.davis@example.com'),
(8, 'Sophia', 'Rodriguez','Junior Touragent', '852963741', 'sophia.rodriguez@example.com'),
(9, 'Benjamin', 'Wilson', 'Junior Touragent', '741852963', 'benjamin.wilson@example.com'),
(10, 'Isabella', 'Lopez', 'Junior Touragent', '369258147', 'isabella.lopez@example.com');


INSERT INTO `tour` (`tour_id`, `tour_name`, `country`, `n_days`, `transport`, `season`, `hotel`) VALUES
(1, 'European Highlights', 'France', 7, 'Bus', 'Summer', '4-star'),
(2, 'Alpine Adventure', 'Switzerland', 5, 'Train', 'Winter', '3-star'),
(3, 'Mediterranean Cruise', 'Italy', 10, 'Cruise', 'Spring', '5-star'),
(4, 'Scenic Scandinavia', 'Norway', 6, 'Bus', 'Autumn', '4-star'),
(5, 'Historical Wonders', 'Greece', 8, 'Plane', 'Summer', '3-star'),
(6, 'Northern Lights Experience', 'Iceland', 5, 'Plane', 'Winter', '4-star'),
(7, 'Balkan Tour', 'Croatia', 6, 'Bus', 'Autumn', '3-star'),
(8, 'Castles of Germany', 'Germany', 7, 'Train', 'Spring', '4-star'),
(9, 'Romantic Paris', 'France', 4, 'Train', 'Winter', '5-star'),
(10, 'Charming Villages', 'Netherlands', 5, 'Bus', 'Spring', '3-star'),
(11, 'Iberian Explorer', 'Spain', 9, 'Bus', 'Summer', '4-star'),
(12, 'Ancient Ruins', 'Italy', 7, 'Bus', 'Autumn', '5-star'),
(13, 'Coastal Delights', 'Portugal', 8, 'Plane', 'Summer', '4-star'),
(14, 'Nordic Capitals', 'Denmark', 6, 'Train', 'Spring', '3-star'),
(15, 'Belgian Chocolates & Beer', 'Belgium', 4, 'Bus', 'Winter', '4-star'),
(16, 'Baltic Journey', 'Estonia', 5, 'Plane', 'Autumn', '3-star'),
(17, 'Swiss Peaks', 'Switzerland', 5, 'Train', 'Summer', '5-star'),
(18, 'Chateaux & Wine', 'France', 6, 'Bus', 'Autumn', '4-star'),
(19, 'Austrian Alps', 'Austria', 7, 'Train', 'Winter', '4-star'),
(20, 'Sunny Spain', 'Spain', 10, 'Plane', 'Summer', '5-star'),
(21, 'Danube Delights', 'Hungary', 6, 'Cruise', 'Spring', '3-star'),
(22, 'Italian Art & History', 'Italy', 8, 'Bus', 'Autumn', '4-star'),
(23, 'Dutch Delights', 'Netherlands', 4, 'Train', 'Spring', '4-star'),
(24, 'Polish Heritage', 'Poland', 5, 'Bus', 'Winter', '3-star'),
(25, 'Czech Castles', 'Czech Republic', 7, 'Train', 'Autumn', '4-star'),
(26, 'Hungarian Rhapsody', 'Hungary', 6, 'Bus', 'Summer', '4-star'),
(27, 'Romanian Legends', 'Romania', 6, 'Plane', 'Spring', '3-star'),
(28, 'Bulgarian Treasures', 'Bulgaria', 5, 'Bus', 'Autumn', '3-star'),
(29, 'Irish Coast', 'Ireland', 8, 'Bus', 'Summer', '4-star'),
(30, 'Vienna & Beyond', 'Austria', 5, 'Train', 'Spring', '5-star');

INSERT INTO `client` (`client_id`, `name`, `surname`, `phone`, `email`, `birthday`, `manager_id`) VALUES
(1, 'John', 'Doe', '123456789', 'john.doe@example.com', '1990-01-01', 1),
(2, 'Jane', 'Doe', '987654321', 'jane.doe@example.com', '1992-02-15', 2),
(3, 'Alice', 'Smith', '456789123', 'alice.smith@example.com', '1985-03-20', 3),
(4, 'Bob', 'Johnson', '789456123', 'bob.johnson@example.com', '1988-04-10', 4),
(5, 'Charlie', 'Brown', '321654987', 'charlie.brown@example.com', '1979-05-18', 5),
(6, 'Diana', 'Evans', '654789321', 'diana.evans@example.com', '1994-06-25', 6),
(7, 'Edward', 'Green', '963852741', 'edward.green@example.com', '1987-07-12', 7),
(8, 'Fiona', 'White', '852963741', 'fiona.white@example.com', '1995-08-02', 8),
(9, 'George', 'Miller', '741852963', 'george.miller@example.com', '1991-09-30', 9),
(10, 'Hannah', 'Wilson', '369258147', 'hannah.wilson@example.com', '1983-10-14', 10),
(11, 'Isaac', 'Taylor', '258147369', 'isaac.taylor@example.com', '1986-11-05', 1),
(12, 'Julia', 'Anderson', '147258369', 'julia.anderson@example.com', '1982-12-23', 1),
(13, 'Kevin', 'Thomas', '987654123', 'kevin.thomas@example.com', '1993-01-17', 2),
(14, 'Laura', 'Moore', '321654789', 'laura.moore@example.com', '1977-02-26', 3),
(15, 'Michael', 'Martin', '123789456', 'michael.martin@example.com', '1984-03-22', 4),
(16, 'Natalie', 'Thompson', '789123456', 'natalie.thompson@example.com', '1990-04-11', 5),
(17, 'Oliver', 'Garcia', '456321789', 'oliver.garcia@example.com', '1981-05-29', 6),
(18, 'Paula', 'Martinez', '654123789', 'paula.martinez@example.com', '1989-06-06', 7),
(19, 'Quincy', 'Robinson', '741258963', 'quincy.robinson@example.com', '1995-07-19', 8),
(20, 'Rachel', 'Clark', '963741852', 'rachel.clark@example.com', '1988-08-24', 9),
(21, 'Sam', 'Rodriguez', '852741963', 'sam.rodriguez@example.com', '1992-09-02', 10),
(22, 'Tina', 'Lewis', '741963852', 'tina.lewis@example.com', '1975-10-15', 9),
(23, 'Ursula', 'Walker', '258963147', 'ursula.walker@example.com', '1980-11-10', 1),
(24, 'Victor', 'Hall', '963258741', 'victor.hall@example.com', '1978-12-21', 2),
(25, 'Wendy', 'Allen', '369741258', 'wendy.allen@example.com', '1986-01-09', 3),
(26, 'Xander', 'Young', '741369258', 'xander.young@example.com', '1985-02-14', 4),
(27, 'Yvonne', 'King', '852147369', 'yvonne.king@example.com', '1989-03-05', 5),
(28, 'Zack', 'Scott', '147369258', 'zack.scott@example.com', '1990-04-20', 6),
(29, 'Anna', 'Bennett', '369258741', 'anna.bennett@example.com', '1994-05-30', 7),
(30, 'Brian', 'Parker', '258369147', 'brian.parker@example.com', '1987-06-25', 8),
(31, 'Clara', 'Collins', '147852963', 'clara.collins@example.com', '1983-07-11', 9),
(32, 'David', 'Stewart', '789456321', 'david.stewart@example.com', '1992-08-16', 10),
(33, 'Ella', 'Morris', '456789123', 'ella.morris@example.com', '1991-09-29', 5),
(34, 'Frank', 'Rogers', '123456987', 'frank.rogers@example.com', '1979-10-18', 1),
(35, 'Grace', 'Reed', '987123456', 'grace.reed@example.com', '1985-11-22', 2),
(36, 'Henry', 'Cook', '963147852', 'henry.cook@example.com', '1984-12-08', 3),
(37, 'Ivy', 'Morgan', '852369741', 'ivy.morgan@example.com', '1990-01-02', 4),
(38, 'Jack', 'Bell', '369741852', 'jack.bell@example.com', '1976-02-21', 5),
(39, 'Lily', 'Murphy', '741852369', 'lily.murphy@example.com', '1982-03-15', 6),
(40, 'Martha', 'Baker', '852963741', 'martha.baker@example.com', '1997-11-23', 7);


INSERT INTO `order` (`order_id`, `date`, `n_item`, `sum`, `client_id`) VALUES
(1, '2024-01-15', 2, 1200.50, 1),
(2, '2024-02-20', 1, 500.00, 2),
(3, '2024-03-05', 3, 1600.75, 3),
(4, '2024-03-10', 2, 1150.40, 4),
(5, '2024-03-15', 1, 800.60, 5),
(6, '2024-04-01', 1, 950.00, 6),
(7, '2024-04-07', 2, 1400.25, 7),
(8, '2024-04-15', 1, 550.00, 8),
(9, '2024-04-20', 3, 2100.80, 9),
(10, '2024-05-01', 1, 720.00, 10),
(11, '2024-05-10', 2, 1250.00, 11),
(12, '2024-05-15', 1, 500.75, 12),
(13, '2024-05-20', 2, 1150.30, 13),
(14, '2024-06-01', 1, 730.60, 14),
(15, '2024-06-05', 3, 1600.20, 15),
(16, '2024-06-10', 1, 900.00, 16),
(17, '2024-06-20', 2, 1350.00, 17),
(18, '2024-07-01', 1, 510.30, 18),
(19, '2024-07-07', 2, 1000.00, 19),
(20, '2024-07-15', 1, 850.25, 20),
(21, '2024-08-01', 3, 1750.60, 21),
(22, '2024-08-10', 1, 650.40, 22),
(23, '2024-08-20', 2, 1300.00, 23),
(24, '2024-09-01', 1, 700.50, 24),
(25, '2024-09-10', 2, 1150.75, 25),
(26, '2024-09-20', 3, 1650.00, 26),
(27, '2024-10-01', 1, 750.25, 27),
(28, '2024-10-10', 2, 1100.50, 28),
(29, '2024-10-15', 1, 700.00, 29),
(30, '2024-10-25', 1, 700.20, 30);



