/*-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?*/
USE vk;

SELECT * FROM likes;
-- сделаем данные менее случайными
UPDATE likes SET creator_id=3 WHERE creator_id<15;
-- удивительно, но у меня работает :)
SELECT if( (SELECT count(*) FROM likes 
 WHERE creator_id IN  (SELECT user_id FROM profiles p2 WHERE p2.gender='f'))
  >
  (SELECT count(*) FROM likes 
 WHERE creator_id IN 
  (SELECT user_id FROM profiles p2 WHERE p2.gender='m')),'f','m') AS gender;