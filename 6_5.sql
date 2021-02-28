/*-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в
-- использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).*/
/*Предлагаю следующие критерии - меньше всех пишет сообщений,меньше всех ставят лайков, меньше всего постов*/


SELECT CONCAT(first_name,' ',last_name) AS user_name, id FROM users
 WHERE id IN (
 	/*здесь определяем id 30 юзеров, которые написали меньше всех сообщений
 	 * 30, а не 10 для того чтобы в результате 3х фильтров остался хоть кто-то*/
 	SELECT m3.from_user_id FROM 
	 (SELECT count(*) AS total_user_messages,from_user_id 
 	   FROM messages GROUP BY from_user_id
  	    ORDER BY total_user_messages LIMIT 20) AS m3)
  	  /*далее определяем id 30 юзеров, которые меньше всех лайкали что-либо*/
 AND id IN (
 	SELECT l3.creator_id FROM 
	 (SELECT count(*) AS total_user_likes,creator_id 
 	   FROM likes GROUP BY creator_id
  	    ORDER BY total_user_likes LIMIT 20) AS l3
 )
 /*далее определяем id пользователей, которые меньше всех написали постов*/
AND id IN (
	SELECT p3.creator_id FROM 
	 (SELECT count(*) AS total_user_posts,creator_id 
 	   FROM likes GROUP BY creator_id
  	    ORDER BY total_user_posts LIMIT 20) AS p3
)
 LIMIT 10;
