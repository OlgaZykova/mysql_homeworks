/*-- 5. ����� 10 �������������, ������� ��������� ���������� ���������� �
-- ������������� ���������� ����
-- (�������� ���������� ���������� ���������� ��������������).*/
/*��������� ��������� �������� - ������ ���� ����� ���������,������ ���� ������ ������, ������ ����� ������*/


SELECT CONCAT(first_name,' ',last_name) AS user_name, id FROM users
 WHERE id IN (
 	/*����� ���������� id 30 ������, ������� �������� ������ ���� ���������
 	 * 30, � �� 10 ��� ���� ����� � ���������� 3� �������� ������� ���� ���-��*/
 	SELECT m3.from_user_id FROM 
	 (SELECT count(*) AS total_user_messages,from_user_id 
 	   FROM messages GROUP BY from_user_id
  	    ORDER BY total_user_messages LIMIT 20) AS m3)
  	  /*����� ���������� id 30 ������, ������� ������ ���� ������� ���-����*/
 AND id IN (
 	SELECT l3.creator_id FROM 
	 (SELECT count(*) AS total_user_likes,creator_id 
 	   FROM likes GROUP BY creator_id
  	    ORDER BY total_user_likes LIMIT 20) AS l3
 )
 /*����� ���������� id �������������, ������� ������ ���� �������� ������*/
AND id IN (
	SELECT p3.creator_id FROM 
	 (SELECT count(*) AS total_user_posts,creator_id 
 	   FROM likes GROUP BY creator_id
  	    ORDER BY total_user_posts LIMIT 20) AS p3
)
 LIMIT 10;
