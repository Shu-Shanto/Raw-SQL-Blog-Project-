-- Question 1: display all columns and all rows from the posts table
SELECT * 
FROM posts;


-- Question 2: show the post titles along with the corresponding author’s name
SELECT p.title, u.name AS author_name FROM posts p
JOIN users u ON p.author_id = u.id;


-- Question 3: Inserts a new row into the posts table for author_id = 2
INSERT INTO posts (title, content, author_id, created_at)
VALUES ('My new value for user 2', 'This is content for user 2', 2, NOW());


-- Question 4: change the title of the post with id = 1
UPDATE posts SET title = 'Updated First Post' WHERE id = 1;


-- Question 5: Find the number of posts written by each author
SELECT u.name AS author_name, COUNT(p.id) AS total_posts
FROM users u LEFT JOIN posts p ON u.id = p.author_id
GROUP BY u.name;


-- Question 6: display the newest posts first
SELECT * FROM posts ORDER BY created_at DESC;


-- Question 7: display the newest two (02) posts
SELECT * FROM posts ORDER BY created_at DESC LIMIT 2;


-- Question 8: show only those posts that have comments
SELECT DISTINCT p.* FROM posts p JOIN comments c ON p.id = c.post_id;


-- Question 9: display multiple tags of a single post as comma-separated values
SELECT p.id, p.title, GROUP_CONCAT(t.name ORDER BY t.name SEPARATOR ', ') AS tags FROM posts p
LEFT JOIN post_tags pt ON p.id = pt.post_id LEFT JOIN tags t ON pt.tag_id = t.id
GROUP BY p.id, p.title;
