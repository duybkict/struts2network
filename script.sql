-- DROP DATABASE Struts2Project;
CREATE DATABASE Struts2Project;
USE Struts2Project;
-- DROP TABLE people
CREATE TABLE people (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(64) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
	password varchar(64) NOT NULL
);
-- DROP TABLE posts
CREATE TABLE posts (
	id int PRIMARY KEY AUTO_INCREMENT,
	person_id int NOT NULL REFERENCES people(id),
	content text NOT NULL,
	created datetime NOT NULL,
	modified datetime NULL
);
-- DROP TABLE follows
CREATE TABLE follows (
	id int PRIMARY KEY AUTO_INCREMENT,
	person_id int NOT NULL REFERENCES people(id),
	follower_id int NOT NULL REFERENCES people(id),
	CONSTRAINT un_follows UNIQUE (person_id, follower_id)
);

INSERT INTO people(name, email, password) VALUES ("Admin", "admin@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Stephen Eldridge", "stephen.eldridge@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Verity Arkwright", "verity.arkwright@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Vonda Eccleston", "vonda.eccleston@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Lamont Quincy ", "lamont.quincy @email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Dell Aiken", "dell.aiken@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Smith Bulle", "smith.bulle@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Charley Hill", "charley.hill@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Kaycee Shaw", "kaycee.shaw@email.com", "123456789");
INSERT INTO people(name, email, password) VALUES ("Carol Patterson", "carol.patterson@email.com", "123456789");

INSERT INTO posts(person_id, content, created) VALUES (1, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (1, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur commodo dignissim augue, ac sollicitudin metus ultricies quis.", NOW());
INSERT INTO posts(person_id, content, created) VALUES (1, "Etiam pharetra arcu mi, sed malesuada risus porta at. Mauris eu pretium metus. Sed in diam quis erat tincidunt viverra. Mauris placerat, nisi sed mattis convallis, purus lectus varius massa, vitae malesuada velit urna non neque. Pellentesque egestas ut metus quis tristique.", NOW());
INSERT INTO posts(person_id, content, created) VALUES (1, "Pellentesque sit amet eleifend lorem, quis tempor odio. Phasellus porttitor orci et tellus convallis cursus. Mauris vehicula pulvinar rutrum. In neque mauris, lobortis at pellentesque et, fringilla id nulla. Sed in arcu adipiscing, suscipit arcu vel, iaculis libero. Curabitur accumsan, urna at vulputate tempus, diam ligula luctus risus, eget tristique ligula mi molestie tortor. ", NOW());
INSERT INTO posts(person_id, content, created) VALUES (2, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (3, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (4, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (5, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (6, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (7, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (8, "This is my first post!", NOW());
INSERT INTO posts(person_id, content, created) VALUES (9, "This is my first post!", NOW());

SELECT * FROM people;
SELECT * FROM posts LIMIT 10 OFFSET 6;
SELECT COUNT(id) FROM posts;

SELECT * FROM posts ORDER BY created DESC;

SELECT * FROM people WHERE email = 'admin@email.com' AND password = '12345';
