/*-- 3. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?*/
USE vk;

SELECT * FROM likes;
-- ������� ������ ����� ����������
UPDATE likes SET creator_id=3 WHERE creator_id<15;
-- �����������, �� � ���� �������� :)
SELECT if( (SELECT count(*) FROM likes 
 WHERE creator_id IN  (SELECT user_id FROM profiles p2 WHERE p2.gender='f'))
  >
  (SELECT count(*) FROM likes 
 WHERE creator_id IN 
  (SELECT user_id FROM profiles p2 WHERE p2.gender='m')),'f','m') AS gender;