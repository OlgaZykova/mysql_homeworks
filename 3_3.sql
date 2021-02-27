/*В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0,
 *  если товар закончился и выше нуля, если на складе имеются запасы.
 *  Необходимо отсортировать записи таким образом, чтобы они выводились в порядке
 *  увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.*/
CREATE DATABASE IF NOT EXISTS lesson5;
USE lesson5;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- будем использовать временные таблицы для сортировки - решение громоздкое:(
DROP TABLE IF EXISTS tmp;
CREATE TEMPORARY TABLE IF NOT exists tmp(
  value int unsigned
);
DROP TABLE IF EXISTS tmp2;
CREATE TEMPORARY TABLE IF NOT exists tmp2(
  value int unsigned
);
-- заполним значениями таблицу storehouses_products, использовала filldb.info
INSERT INTO storehouses_products VALUES (1,4,7,0,'2017-06-04 06:59:38','2013-11-28 17:38:26'),(2,8,10,619,'2014-11-16 10:15:46','2017-06-17 02:05:56'),(3,9,2,910,'2019-07-11 07:34:09','2018-07-17 14:08:30'),(4,7,5,372,'2015-11-02 01:56:19','2019-09-21 22:52:03'),(5,8,3,0,'2017-07-30 08:46:07','2011-07-04 09:15:23'),(6,4,10,346,'2018-08-02 22:31:07','2014-11-30 07:55:24'),(7,5,7,26,'2016-02-09 09:34:29','2015-03-20 07:33:20'),(8,7,3,851,'2018-12-28 15:22:17','2014-11-22 07:29:38'),(9,1,4,644,'2016-05-01 08:24:51','2014-10-22 06:15:25'),(10,2,10,0,'2013-11-04 10:15:53','2020-04-26 20:32:02'),(11,6,1,82,'2019-06-03 01:09:52','2015-10-03 16:26:19'),(12,8,4,271,'2013-10-12 18:57:05','2017-08-15 03:39:00'),(13,8,1,476,'2018-02-27 01:02:51','2019-05-02 06:09:18'),(14,7,7,945,'2013-12-14 03:00:03','2017-08-29 18:59:43'),(15,8,7,903,'2014-10-08 02:45:15','2019-09-01 03:18:26'),(16,10,9,516,'2020-06-07 11:13:21','2019-04-18 21:16:43'),(17,4,3,387,'2020-02-22 11:58:51','2019-11-28 21:51:48'),(18,3,5,241,'2018-11-03 18:36:03','2012-04-02 06:54:36'),(19,4,1,784,'2013-10-07 02:20:19','2016-12-17 19:53:57'),(20,10,1,592,'2013-12-03 20:12:54','2021-01-03 21:13:14');
-- сюда положим отсортированные больше нуля
INSERT INTO tmp (value) SELECT value FROM storehouses_products WHERE value>0 ORDER BY value;
INSERT INTO tmp2 (value) SELECT value FROM storehouses_products WHERE value=0;
-- добавим в первую отсортированную таблицу нули
INSERT INTO tmp (value) SELECT value FROM tmp2;

-- посмотрим что получилось
SELECT * FROM tmp;

