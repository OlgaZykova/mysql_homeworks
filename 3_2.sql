/*Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы 
 * типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/
CREATE DATABASE IF NOT EXISTS lesson5;
USE lesson5;
DROP TABLE IF EXISTS users;
-- создаем таблицу users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birthday_at DATE,
  created_at Varchar(100),
  updated_at Varchar(100)
);

/*заполнение таблицы*/
INSERT INTO users (name, birthday_at,created_at,updated_at) VALUES
  ('Mary', '1990-10-05','20.10.2017 18:10','20.10.2017 8:10'),
  ('Valery', '1984-11-12','14.10.2009 8:10','02.09.1999 8:10'),
  ('Alexander', '1985-05-20', '20.10.2017 8:10','20.10.2017 8:10'),
  ('Jack', '1988-02-14','16.07.2015 8:10','20.01.2017 12:23'),
  ('Peter', '1998-01-12','20.10.2017 8:10','20.10.2017 8:10');
-- Смотрим как заполнена таблица
SELECT * FROM users;
-- добавим столбцы, которые будут содержать дату с нужном формате
ALTER TABLE users ADD created Datetime;
ALTER TABLE users ADD updated Datetime;
-- заполним новые столбцы
UPDATE users SET created = str_to_date(created_at,'%d.%m.%Y %k:%i'),updated= str_to_date(updated_at,'%d.%m.%Y %l:%i');
-- изменим тип существующих столбцов с датой, сначала установив их значения в NULL
UPDATE users SET created_at =NULL;
UPDATE users SET updated_at =NULL;
ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users  MODIFY COLUMN  updated_at DATETIME;
-- скопируем правильные значения дат в старые столбцы
UPDATE users SET updated_at= updated;
UPDATE users SET created_at= created;
-- удалим временные столбцы
ALTER TABLE users DROP COLUMN updated;
ALTER TABLE users DROP COLUMN created;
SELECT * FROM users;



