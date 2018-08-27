USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_no VARCHAR(11) DEFAULT '',
    PRIMARY KEY (id),
    UNIQUE (username),
    UNIQUE (email)
);

CREATE TABLE category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  category VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (category)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    category INT UNSIGNED NOT NULL,
    description TEXT NOT NULL,
    date_posted VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE,
    FOREIGN KEY (category) REFERENCES category(id)
        ON DELETE CASCADE,
    UNIQUE (user_id, title)
);

SELECT * FROM users;
SELECT * FROM ads;
SELECT * FROM category;

DESCRIBE users;
DESCRIBE ads;
DESCRIBE category;