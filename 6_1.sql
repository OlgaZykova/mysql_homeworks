/*1. ������� � ��������� ������� ������ � ������ */

/*� ���������� ������ ��, ���� ������� � ���������� � ������� �� ������� ������ � ������ ��� ���� ���������
 * �������� ���
 * ������ � owner_id ������� posts ��� ����� ������ 
 * - �������� ���� ��� ��������� ���� - ��������� ��� ����� ������������*/
USE vk;
SELECT * FROM posts LIMIT 10;
SELECT * FROM likes LIMIT 10;

/*�� ��� ���������� ������ ������������ ����� ������������ (����� ����������� � �� ����������� �����, �
 * ��� ���������� ������� 4 ��� �����������) ��� ������������� ������� ��������������� ������� item_types,
 * ���������� ��������, ������� ����� ��������*/
/*���������� �� ������ - � ������� likes � ������ ���� ���� �������� ������������ ������� item_id ���������� ��������� =0*/
/*������������ ��� �������*/
 -- INSERT INTO item_types (name,created_at,updated_at) values ('user',NOW(),NOW());
/*��������, ��� ������ ��� ������ ��� �������� �������� ���� � �������*/
SELECT * FROM item_types;
/*������� � ������� � �������������� ������� - ���� ����, ������ ������������ ��� ���
 * ��� restrict'� � ���������*/
-- ALTER TABLE users ADD COLUMN is_deleted boolean default 0;

/*����� �������������� ������� - �� ��� �������� ��������� ��� ���������� ������ � ������������ ������� ������*/

/*UPDATE profiles SET photo_id = (SELECT id FROM media ORDER BY rand() LIMIT 1);
-- ALTER TABLE profiles RENAME COLUMN status TO status_id;
-- ALTER TABLE profiles CHANGE status_id status_id INT UNSIGNED NOT NULL;
-- ALTER TABLE item_types CHANGE id id SERIAL NOT NULL;
-- ALTER TABLE likes CHANGE item_type_id item_type_id bigint unsigned NOT NULL;
