/*-- 4. ѕодсчитать количество лайков которые получили 10 самых молодых пользователей. */
/*результатов мало, тк не у всех молодых пользователей вообще есть лайки*/
/*ѕроверка owner_id>0 нужна дл€ того чтобы убрать из 
 * результатов сообщества, item_type_id=3  дл€ сущности пользователь*/

SELECT owner_id,count(*) FROM likes
 WHERE owner_id >0 AND item_type_id = 3
 AND owner_id IN (SELECT p3.user_id FROM (SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10) AS p3)
 GROUP BY owner_id;


