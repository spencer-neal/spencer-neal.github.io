SWN Instagram Table

CREATE DATABASE swn_ig_clone;

USE swn_ig_clone;

Schema Design
Instagram Database
Tables:  Users, Photos, Comments, Likes, Hashtags, Followers/Followees

Users Table
User_ID
username
created_at

CREATE TABLE users 
	(user_id INT AUTO_INCREMENT PRIMARY KEY, 
	username VARCHAR(255) UNIQUE NOT NULL, 
	created_at TIMESTAMP DEFAULT NOW());

Photos Table
photo_id
image_url
user_id
created_date

CREATE TABLE photos
	(photo_id INT AUTO_INCREMENT PRIMARY KEY,
	image_url VARCHAR(255) NOT NULL,
       	user_id INT NOT NULL FOREIGN KEY (user_id) REFERENCES 	
	users(user_id),
	created_at TIMESTAMP DEFAULT NOW());

CREATE TABLE photos (
	    photo_id INT AUTO_INCREMENT PRIMARY KEY,
	    image_url VARCHAR(255) NOT NULL,
	    user_id INT NOT NULL,
	    created_at TIMESTAMP DEFAULT NOW(),
	    FOREIGN KEY(user_id) REFERENCES users(user_id)
	);
Comments Table
Comments_id
comment_text
user_id
photo_id
created_at
Create TABLE comments
	(comment_id AUTO_INCEMENT PRIMARY KEY,
	comment_text VARCHAR (255) NOT NULL,
	user_id INT NOT NULL FOREIGN KEY(user_id) REFERENCES 
	users(user_id),
	photo_id INT NOT NULL FOREIGN KEY(photo_id) REFERENCES 	
	photos(photo_id),
         	created_at TIMESTAMP DEFAULT NOW();

Create TABLE comments
	(comment_id INT AUTO_INCREMENT PRIMARY KEY,
	comment_text VARCHAR (255) NOT NULL,
	user_id INT NOT NULL,
	photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(photo_id) REFERENCES photos(photo_id));


Likes Table
user_id
photo_id
Created_at

CREATE TABLE likes
	(user_id INT NOT NULL FOREIGN KEY(user_id) REFERENCES 
	users(user_id),
	photo_id INT NOT NULL FOREIGN KEY(photo_id) REFERENCES 		
	photos(photo_id),
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (user_id, photo_id));

CREATE TABLE likes
(user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
FOREIGN KEY(user_id) REFERENCES users(user_id),
PRIMARY KEY (user_id, photo_id));


Followers/Followees Table
follower_id
followee_id
created_at
CREATE TABLE followers (
	follower_id INT NOT NULL FOREIGN KEY(follower_id) 
	REFERENCES users(user_id),
	followee_id INT NOT NULL FOREIGN KEY(followee_id 
	REFERNCES users.user_id,
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY(follower_id, followee_id ;

CREATE TABLE followers (
follower_id INT NOT NULL,
FOREIGN KEY(follower_id) REFERENCES users(user_id),
followee_id INT NOT NULL, 
FOREIGN KEY(followee_id) REFERENCES users(user_id),
created_at TIMESTAMP DEFAULT NOW(),
PRIMARY KEY(follower_id, followee_id));

Hashtags Table
hashtag_id
hash_tag
user_id

CREATE TABLE hashtags
	(hashtag_id INT AUTO_INCREMENT PRIMARY KEY, hash_tag 	
	VARCHAR (100), user_id FOREIGN KEY user_id REFERENCES 
	users(user_id); 

Note:  Hashtags will consist of two tables:  Tags and Photo_Tags

Tags Table:
CREATE TABLE tags(
	tag_id INT AUTO_INCREMENT PRIMARY KEY, 
	tag_name VARCHAR(255) UNIQUE,
	created_at TIMESTAMP DEFAULT NOW());


Photo_Tags Table

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(tag_id) REFERENCES tags(tag_id),
    PRIMARY KEY(photo_id, tag_id)
);














Challenge 01
Reward the Instagram users who have been around the longest.
Find the 5 oldest users

SELECT* FROM users ORDER BY created_at LIMIT 05;
+---------+------------------+---------------------+
| user_id  | username          | created_at            |
+---------+------------------+---------------------+
|      80 | Darby_Herzog     | 2016-05-06 00:14:21 |
|      67 | Emilio_Bernier52 | 2016-05-06 13:04:30 |
|      63 | Elenor88        	     | 2016-05-08 01:30:41 |
|      95 | Nicole71              | 2016-05-09 17:30:22 |
|      38 | Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
+---------+------------------+---------------------+

Challenge 02
What day of the week do most users register on?
We need to figure out when to schedule an ad campaign.

SELECT username AS 'User Name', DAYNAME(created_at) AS 'DAY', COUNT(*) AS 'Total' FROM users GROUP BY DAY ORDER BY Total DESC;
+-------------------+-----------+-------+
| User Name         | DAY       | Total |
+-------------------+-----------+-------+
| Kenton_Kirlin     | Thursday  |    16 |
| Andre_Purdy85     | Sunday    |    16 |
| Gus93             | Friday    |    15 |
| Harley_Lind18     | Tuesday   |    14 |
| Kasandra_Homenick | Monday    |    14 |
| Aniya_Hackett     | Wednesday |    13 |
| Arely_Bogan63     | Saturday  |    12 |
+—————————+-----------+-------+

SELECT username AS 'User Name', DAYNAME(created_at) AS 'DAY', COUNT(*) AS 'Total' FROM users GROUP BY DAY ORDER BY Total DESC LIMIT 2;
+---------------+----------+-------+
| User Name     | DAY      | Total |
+---------------+----------+-------+
| Kenton_Kirlin | Thursday |    16 |
| Andre_Purdy85 | Sunday   |    16 |
+———————+----------+-------+

Challenge 03
We want to target our inactive users with an e-mail campaign.
Find the users who have never posted a photo.

 SELECT username,image_url FROM users LEFT JOIN photos ON users.user_id = photos.user_id WHERE image_url is NULL;
+---------------------+-----------+
| username            | image_url |
+---------------------+-----------+
| Aniya_Hackett       | NULL      |
| Bartholome.Bernhard | NULL      |
| Bethany20           | NULL      |
| Darby_Herzog        | NULL      |
| David.Osinski47     | NULL      |
| Duane60             | NULL      |
| Esmeralda.Mraz57    | NULL      |
| Esther.Zulauf61     | NULL      |
| Franco_Keebler64    | NULL      |
| Hulda.Macejkovic    | NULL      |
| Jaclyn81            | NULL      |
| Janelle.Nikolaus81  | NULL      |
| Jessyca_West        | NULL      |
| Julien_Schmidt      | NULL      |
| Kasandra_Homenick   | NULL      |
| Leslie67            | NULL      |
| Linnea59            | NULL      |
| Maxwell.Halvorson   | NULL      |
| Mckenna17           | NULL      |
| Mike.Auer39         | NULL      |
| Morgan.Kassulke     | NULL      |
| Nia_Haag            | NULL      |
| Ollie_Ledner37      | NULL      |
| Pearl7              | NULL      |
| Rocio33             | NULL      |
| Tierra.Trantow      | NULL      |
+---------------------+-----------+


Challenge 04 
We are running a new contest to see who can get the most likes on a single photo.

Who won?

 SELECT username, photos.photo_id, photos.image_url, COUNT(*) AS 'Total' FROM photos INNER JOIN likes ON likes.photo_id = photos.user_id INNER JOIN users ON ph
otos.user_id = users.user_id GROUP BY photo_id ORDER BY Total DESC LIMIT 1;
+----------+----------+---------------------+-------+
| username | photo_id | image_url           | Total |
+----------+----------+---------------------+-------+
| Kaley9   |       93 | https://jensen.name |    41 |
+----------+----------+---------------------+-------+
1 row in set (0.00 sec)

Challenge 05
Our investors want to know  . . .
How many times does the average user post.

Total number of photos / total number of users
 SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS 'Average Times Users Post Photos';
+---------------------------------+
| Average Times Users Post Photos |
+---------------------------------+
|                          2.5700 |
+————————————————+




Challenge 06
A Brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags?

 SELECT tags.tag_name, COUNT(*) AS 'Total' FROM photo_tags JOIN tags ON photo_tags.tag_id = tags.tag_id GROUP BY tags.tag_id ORDER BY Total DESC LIMIT 5;
+----------+-------+
| tag_name | Total |
+----------+-------+
| smile    |    59 |
| beach    |    42 |
| party    |    39 |
| fun      |    38 |
| concert  |    24 |
+—————+-------+

Challenge 07
We have a problem with bots on our site.
Find users who have liked every single photo on the site

Users and likes and photos
SELECT * FROM users INNER JOIN likes ON users.id = likes.user_id;

SELECT * FROM users INNER JOIN likes ON users.user_id = likes.user_id GROUP BY likes.user_id;

SELECT username, users.user_id FROM users INNER JOIN likes ON users.user_id = likes.user_id GROUP BY likes.user_id;

SELECT username, users.user_id, COUNT(*) AS 'Total' FROM users INNER JOIN likes ON users.user_id = likes.user_id GROUP BY likes.user_id;

 SELECT username, COUNT(*) AS 'Total' FROM users INNER JOIN likes ON users.user_id = likes.user_id GROUP BY likes.user_id;

SELECT username, COUNT(*) AS 'Number of Likes' FROM users INNER JOIN likes ON users.user_id = likes.user_id GROUP BY likes.user_id;

| Jaclyn81           |             257 |
| Rocio33            |             257 |
| Maxwell.Halvorson  |             257 |
| Ollie_Ledner37     |             257 |
| Mckenna17          |             257 |
| Duane60            |             257 |
| Julien_Schmidt     |             257 |
| Mike.Auer39        |             257 |
| Nia_Haag           |             257 |
| Leslie67           |             257 |
| Janelle.Nikolaus81 |             257 |
| Bethany20          |             257 |
+——————————+-----------------+

SELECT username, COUNT(*) AS 'Number_of_Likes' FROM users INNER JOIN likes ON users.user_id = likes.user_id GROUP BY likes.user_id HAVING Number_of_Likes = (S
ELECT COUNT(*) FROM photos);
+--------------------+-----------------+
| username           | Number_of_Likes |
+--------------------+-----------------+
| Aniya_Hackett      |             257 |
| Jaclyn81           |             257 |
| Rocio33            |             257 |
| Maxwell.Halvorson  |             257 |
| Ollie_Ledner37     |             257 |
| Mckenna17          |             257 |
| Duane60            |             257 |
| Julien_Schmidt     |             257 |
| Mike.Auer39        |             257 |
| Nia_Haag           |             257 |
| Leslie67           |             257 |
| Janelle.Nikolaus81 |             257 |
| Bethany20          |             257 |
+--------------------+-----------------+