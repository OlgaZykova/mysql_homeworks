/*-- 2. Создать все необходимые внешние ключи и диаграмму отношений.*/
 /*- приложила .png со схемой, на скришоте не влезало*/
-- для таблицы profiles

-- сначала скорректируем данные для ключей - чтобы содержались реальные ссылки
UPDATE profiles SET photo_id = (SELECT id FROM media ORDER BY rand() LIMIT 1);
-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL,
  ADD CONSTRAINT profiles_status_id_fk
    FOREIGN KEY (status_id) REFERENCES user_statuses(id)
    ON DELETE RESTRICT;
   
-- для таблицы media
ALTER TABLE media
  ADD CONSTRAINT media_media_type_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
     ON DELETE restrict,
  ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) references users(id)
     ON DELETE CASCADE;

-- для communities_users

ALTER TABLE communities_users 
  ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT communities_users_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities (id)
     ON DELETE CASCADE;
    
-- Для messages
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users(id)
      ON DELETE RESTRICT,
  ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users(id)
      ON DELETE RESTRICT;

-- для friendship_statuses
ALTER TABLE friendships 
  ADD CONSTRAINT friendships_user_id_fk
   FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  ADD CONSTRAINT friendships_friend_id_fk
   FOREIGN KEY (friend_id) REFERENCES users(id)
    ON DELETE CASCADE,
  ADD CONSTRAINT friendships_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id)
     ON DELETE restrict;
-- для Posts
ALTER TABLE posts
  ADD CONSTRAINT posts_creator_id_fk
   FOREIGN KEY (creator_id) REFERENCES users(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id)
     ON DELETE SET NULL;
    
-- для likes
ALTER TABLE likes
  ADD CONSTRAINT likes_creator_id_fk
   FOREIGN KEY (creator_id) REFERENCES users(id)
    ON DELETE RESTRICT,
  ADD CONSTRAINT likes_item_type_id_fk
   FOREIGN KEY (item_type_id) REFERENCES item_types(id)
    ON DELETE cascade;