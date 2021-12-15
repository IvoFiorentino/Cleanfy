CREATE DATABASE 'CleanfyBD';
USE CleanfyBD;
CREATE TABLE `users` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `first_name` TEXT NOT NULL,
   `last_name` TEXT NOT NULL,
   `email` VARCHAR(255) NOT NULL,
   `gender` VARCHAR(255) NOT NULL,
   `image` CHAR NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `marca` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `marca` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `category_productos` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `sector` VARCHAR(255) NOT NULL,
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



insert into users (id, first_name, last_name, email, gender, image) values (1, 'Maris', 'Dwerryhouse', 'mdwerryhouse0@va.gov', 'Agender', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (2, 'Luis', 'Chesswas', 'lchesswas1@seesaa.net', 'Female', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (3, 'Denis', 'Cattonnet', 'dcattonnet2@time.com', 'Genderqueer', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (4, 'Silvana', 'Jewitt', 'sjewitt3@abc.net.au', 'Bigender', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (5, 'Blisse', 'Riddell', 'briddell4@spiegel.de', 'Agender', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (6, 'Amos', 'Sink', 'asink5@businessinsider.com', 'Polygender', 'http://dummyimage.com/100x100.png/dddddd/000000');
insert into users (id, first_name, last_name, email, gender, image) values (7, 'Blanca', 'McPhelimey', 'bmcphelimey6@etsy.com', 'Agender', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (8, 'Garnette', 'Caulcott', 'gcaulcott7@samsung.com', 'Male', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (9, 'Hamel', 'Flewin', 'hflewin8@umn.edu', 'Female', 'http://dummyimage.com/100x100.png/cc0000/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (10, 'Olivero', 'Shorte', 'oshorte9@webs.com', 'Female', 'http://dummyimage.com/100x100.png/dddddd/000000');
insert into users (id, first_name, last_name, email, gender, image) values (11, 'Dinah', 'Swannie', 'dswanniea@who.int', 'Non-binary', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (12, 'Carroll', 'Tosh', 'ctoshb@chron.com', 'Female', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (13, 'Grenville', 'Bamblett', 'gbamblettc@springer.com', 'Genderqueer', 'http://dummyimage.com/100x100.png/dddddd/000000');
insert into users (id, first_name, last_name, email, gender, image) values (14, 'Cindy', 'O''Leahy', 'coleahyd@europa.eu', 'Agender', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (15, 'Glynnis', 'Doe', 'gdoee@etsy.com', 'Non-binary', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (16, 'Rozella', 'Pendrid', 'rpendridf@tuttocitta.it', 'Non-binary', 'http://dummyimage.com/100x100.png/cc0000/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (17, 'Webb', 'Widmore', 'wwidmoreg@weather.com', 'Bigender', 'http://dummyimage.com/100x100.png/cc0000/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (18, 'Sharyl', 'Castellaccio', 'scastellaccioh@dmoz.org', 'Agender', 'http://dummyimage.com/100x100.png/cc0000/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (19, 'Ky', 'Mallon', 'kmalloni@illinois.edu', 'Polygender', 'http://dummyimage.com/100x100.png/cc0000/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (20, 'Clerissa', 'Gregol', 'cgregolj@loc.gov', 'Bigender', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (21, 'Juli', 'Ryles', 'jrylesk@facebook.com', 'Male', 'http://dummyimage.com/100x100.png/dddddd/000000');
insert into users (id, first_name, last_name, email, gender, image) values (22, 'Byrom', 'Nuttey', 'bnutteyl@bizjournals.com', 'Polygender', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (23, 'Lindsay', 'Ilyuchyov', 'lilyuchyovm@usa.gov', 'Male', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (24, 'Blondell', 'Serrell', 'bserrelln@forbes.com', 'Non-binary', 'http://dummyimage.com/100x100.png/ff4444/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (25, 'Paulie', 'Sang', 'psango@google.com', 'Genderfluid', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (26, 'Bell', 'Monnelly', 'bmonnellyp@nationalgeographic.com', 'Agender', 'http://dummyimage.com/100x100.png/dddddd/000000');
insert into users (id, first_name, last_name, email, gender, image) values (27, 'Morgana', 'Crowdson', 'mcrowdsonq@tinypic.com', 'Male', 'http://dummyimage.com/100x100.png/dddddd/000000');
insert into users (id, first_name, last_name, email, gender, image) values (28, 'Spense', 'McIsaac', 'smcisaacr@is.gd', 'Male', 'http://dummyimage.com/100x100.png/cc0000/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (29, 'Saunder', 'Ferneley', 'sferneleys@unesco.org', 'Female', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into users (id, first_name, last_name, email, gender, image) values (30, 'Andie', 'Puttick', 'aputtickt@merriam-webster.com', 'Agender', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');


insert into products (id, name, price, discount, image, marca) values (1, 'Steampan - Half Size Shallow', '$4.64', 52, 'http://dummyimage.com/100x100.png/dddddd/000000', 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla');
insert into products (id, name, price, discount, image, marca) values (2, 'Chicken - Soup Base', '$9.95', 61, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus');
insert into products (id, name, price, discount, image, marca) values (3, 'Creme De Cacao Mcguines', '$6.31', 69, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare');
insert into products (id, name, price, discount, image, marca) values (4, 'Oil - Pumpkinseed', '$6.92', 61, 'http://dummyimage.com/100x100.png/dddddd/000000', 'nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus');
insert into products (id, name, price, discount, image, marca) values (5, 'Cinnamon Rolls', '$6.16', 38, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec');
insert into products (id, name, price, discount, image, marca) values (6, 'Cheese - Oka', '$9.64', 63, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum');
insert into products (id, name, price, discount, image, marca) values (7, 'Nescafe - Frothy French Vanilla', '$7.25', 41, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'semper sapien a libero nam dui proin leo odio porttitor id consequat');
insert into products (id, name, price, discount, image, marca) values (8, 'Steampan - Foil', '$4.98', 27, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet');
insert into products (id, name, price, discount, image, marca) values (9, 'Beef - Tongue, Cooked', '$6.42', 37, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu');
insert into products (id, name, price, discount, image, marca) values (10, 'Plastic Arrow Stir Stick', '$5.05', 27, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus');
insert into products (id, name, price, discount, image, marca) values (11, 'Baking Soda', '$9.04', 68, 'http://dummyimage.com/100x100.png/dddddd/000000', 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes');
insert into products (id, name, price, discount, image, marca) values (12, 'Milk - Skim', '$8.16', 33, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor');
insert into products (id, name, price, discount, image, marca) values (13, 'Veal - Slab Bacon', '$3.96', 27, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at');
insert into products (id, name, price, discount, image, marca) values (14, 'Longos - Assorted Sandwich', '$5.15', 53, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis');
insert into products (id, name, price, discount, image, marca) values (15, 'Sugar - Brown, Individual', '$1.08', 27, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus');
insert into products (id, name, price, discount, image, marca) values (16, 'Table Cloth 90x90 White', '$3.45', 49, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque');
insert into products (id, name, price, discount, image, marca) values (17, 'Food Colouring - Orange', '$8.39', 69, 'http://dummyimage.com/100x100.png/dddddd/000000', 'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam');
insert into products (id, name, price, discount, image, marca) values (18, 'Coke - Diet, 355 Ml', '$8.12', 62, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque');
insert into products (id, name, price, discount, image, marca) values (19, 'Longan', '$5.94', 62, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum');
insert into products (id, name, price, discount, image, marca) values (20, 'Carbonated Water - Raspberry', '$5.25', 38, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'non velit nec nisi vulputate nonummy maecenas tincidunt lacus at');
insert into products (id, name, price, discount, image, marca) values (21, 'Chinese Foods - Chicken', '$9.38', 42, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'eget nunc donec quis orci eget orci vehicula condimentum curabitur');
insert into products (id, name, price, discount, image, marca) values (22, 'Papadam', '$8.36', 26, 'http://dummyimage.com/100x100.png/dddddd/000000', 'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed');
insert into products (id, name, price, discount, image, marca) values (23, 'Doilies - 8, Paper', '$4.68', 45, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales');
insert into products (id, name, price, discount, image, marca) values (24, 'Beer - Paulaner Hefeweisse', '$7.09', 32, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu');
insert into products (id, name, price, discount, image, marca) values (25, 'Tomatoes - Yellow Hot House', '$4.00', 22, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'in hac habitasse platea dictumst maecenas ut massa quis augue');
insert into products (id, name, price, discount, image, marca) values (26, 'Placemat - Scallop, White', '$0.39', 21, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante');
insert into products (id, name, price, discount, image, marca) values (27, 'Beans - Black Bean, Dry', '$4.14', 34, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum');
insert into products (id, name, price, discount, image, marca) values (28, 'Veal - Loin', '$9.64', 37, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut');
insert into products (id, name, price, discount, image, marca) values (29, 'Scallops - U - 10', '$2.97', 49, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'purus phasellus in felis donec semper sapien a libero nam dui proin leo');
insert into products (id, name, price, discount, image, marca) values (30, 'Sobe - Cranberry Grapefruit', '$8.98', 58, 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'in est risus auctor sed tristique in tempus sit amet sem');


insert into marca (id, marca) values (1, 'Genesis');
insert into marca (id, marca) values (2, '928');
insert into marca (id, marca) values (3, 'Tracer');
insert into marca (id, marca) values (4, 'Compass');
insert into marca (id, marca) values (5, '300E');
insert into marca (id, marca) values (6, 'Continental GTC');
insert into marca (id, marca) values (7, 'Santa Fe');
insert into marca (id, marca) values (8, 'Titan');
insert into marca (id, marca) values (9, 'I');
insert into marca (id, marca) values (10, 'F150');
insert into marca (id, marca) values (11, 'Jetta');
insert into marca (id, marca) values (12, 'Challenger');
insert into marca (id, marca) values (13, 'C8 Double 12 S');
insert into marca (id, marca) values (14, 'Grand Cherokee');
insert into marca (id, marca) values (15, 'LTD Crown Victoria');
insert into marca (id, marca) values (16, 'XT');
insert into marca (id, marca) values (17, 'Rally Wagon 3500');
insert into marca (id, marca) values (18, 'Z3');
insert into marca (id, marca) values (19, '8 Series');
insert into marca (id, marca) values (20, 'Intrepid');
insert into marca (id, marca) values (21, 'Spirit');
insert into marca (id, marca) values (22, 'SJ');
insert into marca (id, marca) values (23, 'LS');
insert into marca (id, marca) values (24, 'Bronco II');
insert into marca (id, marca) values (25, '900');
insert into marca (id, marca) values (26, 'Entourage');
insert into marca (id, marca) values (27, 'M3');
insert into marca (id, marca) values (28, 'BRZ');
insert into marca (id, marca) values (29, 'Frontier');
insert into marca (id, marca) values (30, 'E150');


insert into category_productos (id, sector) values (1, 'Avenue');
insert into category_productos (id, sector) values (2, 'Crossing');
insert into category_productos (id, sector) values (3, 'Center');
insert into category_productos (id, sector) values (4, 'Crossing');
insert into category_productos (id, sector) values (5, 'Street');
insert into category_productos (id, sector) values (6, 'Terrace');
insert into category_productos (id, sector) values (7, 'Crossing');
insert into category_productos (id, sector) values (8, 'Drive');
insert into category_productos (id, sector) values (9, 'Street');
insert into category_productos (id, sector) values (10, 'Point');
insert into category_productos (id, sector) values (11, 'Parkway');
insert into category_productos (id, sector) values (12, 'Alley');
insert into category_productos (id, sector) values (13, 'Avenue');
insert into category_productos (id, sector) values (14, 'Way');
insert into category_productos (id, sector) values (15, 'Junction');
insert into category_productos (id, sector) values (16, 'Pass');
insert into category_productos (id, sector) values (17, 'Plaza');
insert into category_productos (id, sector) values (18, 'Lane');
insert into category_productos (id, sector) values (19, 'Drive');
insert into category_productos (id, sector) values (20, 'Hill');
insert into category_productos (id, sector) values (21, 'Terrace');
insert into category_productos (id, sector) values (22, 'Trail');
insert into category_productos (id, sector) values (23, 'Center');
insert into category_productos (id, sector) values (24, 'Avenue');
insert into category_productos (id, sector) values (25, 'Place');
insert into category_productos (id, sector) values (26, 'Road');
insert into category_productos (id, sector) values (27, 'Street');
insert into category_productos (id, sector) values (28, 'Drive');
insert into category_productos (id, sector) values (29, 'Terrace');
insert into category_productos (id, sector) values (30, 'Street');