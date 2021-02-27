/*����� � ������� users ���� created_at � updated_at ��������� ��������������. 
 * ��������� �� �������� ����� � ��������.*/
CREATE DATABASE IF NOT EXISTS lesson5;
USE lesson5;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birthday_at DATE,
  created_at DATETIME,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

/*���������� ����� ������� ����� ����� created_at,updated_at*/
INSERT INTO users (name, birthday_at) VALUES
  ('Mary', '1990-10-05'),
  ('Valery', '1984-11-12'),
  ('Alexander', '1985-05-20'),
  ('Jack', '1988-02-14'),
  ('Peter', '1998-01-12');
-- ������� ��� ��������� �������
SELECT * FROM users;
-- ���������� ����� created_at,updated_at
UPDATE users SET created_at = NOW();
UPDATE users SET created_at = NOW();
-- ������� ��� ����������� ����
SELECT * FROM users;



