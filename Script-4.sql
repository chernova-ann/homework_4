USE vk;

SHOW TABLES;

SELECT * FROM users LIMIT 10;

UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

SELECT * FROM profiles LIMIT 10;

UPDATE profiles SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

UPDATE profiles SET gender = (CASE WHEN gender = 'M' THEN 'F' ELSE 'M' END);

SELECT * FROM messages LIMIT 10;

SELECT COUNT(*) FROM users;

UPDATE messages SET 
    from_user_id = FLOOR(1+RAND()*100),
    to_user_id = FLOOR(1+RAND()*100);

SELECT * FROM messages WHERE from_user_id = to_user_id;

SELECT * FROM  media LIMIT 10;

SELECT COUNT(*) FROM media_types;

TRUNCATE media_types;

INSERT INTO media_types(name) VALUES
   ('photo'),
   ('video'),
   ('audio');

SELECT * FROM  media_types LIMIT 10;

UPDATE media SET
   media_type_id = FLOOR(1 + RAND()*3),
   user_id = FLOOR(1 + RAND()*100);
  
UPDATE media SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

CREATE TEMPORARY TABLE exts (name VARCHAR(10));

INSERT INTO exts VALUES
   ('gif'),
   ('avi'),
   ('jpeg'),
   ('mp4');
  
UPDATE media SET filename = CONCAT (
   'https://dropbox.com/vk/',
   FLOOR(10000 + RAND()*20000),
   '.',
   (SELECT name FROM exts ORDER BY RAND() LIMIT 1));
  
ALTER TABLE media DROP COLUMN SIZE;

ALTER TABLE media ADD COLUMN file_size INT UNSIGNED NOT NULL AFTER filename;

UPDATE media SET file_size = FLOOR(10000 + RAND()*1000000);

SELECT * FROM  media LIMIT 10;

DESC media;

UPDATE media SET metadata = CONCAT ('{"owner":"',
    (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
    '"}');

ALTER TABLE media MODIFY COLUMN metadata JSON;

SELECT * FROM friendship LIMIT 10;

UPDATE friendship SET 
  user_id = FLOOR(1+RAND()*100),
  friend_id = FLOOR(1+RAND()*100);
 
SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name) VALUES
   ('Ruquested'),
   ('Confirmed'),
   ('Rejected');

UPDATE friendship SET 
   status_id = FLOOR(1+RAND()*3);
  
SELECT * FROM friendship LIMIT 10;

SELECT * FROM communities;

DELETE FROM communities WHERE id > 20;

SELECT * FROM communities_users;

UPDATE communities_users SET
    community_id = FLOOR(1+RAND()*20);

DESC messages;
ALTER TABLE messages MODIFY COLUMN communitie_id INT UNSIGNED;




   








 




