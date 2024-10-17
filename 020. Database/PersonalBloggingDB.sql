CREATE DATABASE PersonalBlogging;

USE PersonalBlogging;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    role boolean
);

CREATE TABLE Post (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_title VARCHAR(255) NOT NULL,
    post_sumary TEXT,
    post_content TEXT NOT NULL,
    post_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Comment (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_name VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    comment_date DATETIME NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);

CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PostToCategory (
    category_id INT,
    post_id INT,
    PRIMARY KEY (category_id, post_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);