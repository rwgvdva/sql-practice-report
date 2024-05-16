CREATE TABLE IF NOT EXISTS Users(
user_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
username VARCHAR(255) NOT NULL UNIQUE,
email VARCHAR(255) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Boards(
board_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
description TEXT NULL
);

CREATE TABLE IF NOT EXISTS Posts(
post_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
content TEXT NOT NULL,
user_id BIGINT,
board_id BIGINT,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (board_id) REFERENCES Boards(board_id)
);

CREATE TABLE IF NOT EXISTS Comments(
comment_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
content TEXT NOT NULL,
user_id BIGINT,
post_id BIGINT,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE IF NOT EXISTS Tags(
tag_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Post_Tags(
post_id BIGINT,
tag_id BIGINT,
FOREIGN KEY (post_id) REFERENCES Posts(post_id),
FOREIGN KEY (tag_id) REFERENCES Tags(tag_id)
);