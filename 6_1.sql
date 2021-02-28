/*1. Создать и заполнить таблицы лайков и постов */

/*В предыдущей версии БД, дамп которой я отправляла в прошлом ДЗ таблицы лайков и постов уже были заполнены
 * Проверим это
 * Минусы в owner_id таблицы posts это часть логики 
 * - указание того где создается пост - коммунити или стена пользователя*/
USE vk;
SELECT * FROM posts LIMIT 10;
SELECT * FROM likes LIMIT 10;

/*Но для реализации логики проставления лайка пользователю (такую возможность я не закладывала ранее, а
 * для реализации задания 4 она потребуется) мне потребовалось немного скорректировать таблицу item_types,
 * содержащую сущности, которые можно лайкнуть*/
/*Дополнение по логике - в таблице likes в случае если лайк ставится пользователю атрибут item_id необходимо заполнять =0*/
/*Использовала эту команду*/
 -- INSERT INTO item_types (name,created_at,updated_at) values ('user',NOW(),NOW());
/*проверка, что теперь все нужные для лайканья сущности есть в таблице*/
SELECT * FROM item_types;
/*добавим в таблицу с пользователями столбец - флаг того, удален пользователь или нет
 * для restrict'а в удалениях*/
-- ALTER TABLE users ADD COLUMN is_deleted boolean default 0;

/*Далее закомменченные функции - то что пришлось выполнить для подготовки таблиц к установлению внешних ключей*/

/*UPDATE profiles SET photo_id = (SELECT id FROM media ORDER BY rand() LIMIT 1);
-- ALTER TABLE profiles RENAME COLUMN status TO status_id;
-- ALTER TABLE profiles CHANGE status_id status_id INT UNSIGNED NOT NULL;
-- ALTER TABLE item_types CHANGE id id SERIAL NOT NULL;
-- ALTER TABLE likes CHANGE item_type_id item_type_id bigint unsigned NOT NULL;
