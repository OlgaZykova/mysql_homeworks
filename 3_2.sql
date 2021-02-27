/*������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ 
 * ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10. 
 * ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.*/
CREATE DATABASE IF NOT EXISTS lesson5;
USE lesson5;
DROP TABLE IF EXISTS users;
-- ������� ������� users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birthday_at DATE,
  created_at Varchar(100),
  updated_at Varchar(100)
);

/*���������� �������*/
INSERT INTO users (name, birthday_at,created_at,updated_at) VALUES
  ('Mary', '1990-10-05','20.10.2017 18:10','20.10.2017 8:10'),
  ('Valery', '1984-11-12','14.10.2009 8:10','02.09.1999 8:10'),
  ('Alexander', '1985-05-20', '20.10.2017 8:10','20.10.2017 8:10'),
  ('Jack', '1988-02-14','16.07.2015 8:10','20.01.2017 12:23'),
  ('Peter', '1998-01-12','20.10.2017 8:10','20.10.2017 8:10');
-- ������� ��� ��������� �������
SELECT * FROM users;
-- ������� �������, ������� ����� ��������� ���� � ������ �������
ALTER TABLE users ADD created Datetime;
ALTER TABLE users ADD updated Datetime;
-- �������� ����� �������
UPDATE users SET created = str_to_date(created_at,'%d.%m.%Y %k:%i'),updated= str_to_date(updated_at,'%d.%m.%Y %l:%i');
-- ������� ��� ������������ �������� � �����, ������� ��������� �� �������� � NULL
UPDATE users SET created_at =NULL;
UPDATE users SET updated_at =NULL;
ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users  MODIFY COLUMN  updated_at DATETIME;
-- ��������� ���������� �������� ��� � ������ �������
UPDATE users SET updated_at= updated;
UPDATE users SET created_at= created;
-- ������ ��������� �������
ALTER TABLE users DROP COLUMN updated;
ALTER TABLE users DROP COLUMN created;
SELECT * FROM users;



