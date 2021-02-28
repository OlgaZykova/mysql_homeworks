/*-- 4. ���������� ���������� ������ ������� �������� 10 ����� ������� �������������. */
/*����������� ����, �� �� � ���� ������� ������������� ������ ���� �����*/
/*�������� owner_id>0 ����� ��� ���� ����� ������ �� 
 * ����������� ����������, item_type_id=3  ��� �������� ������������*/

SELECT owner_id,count(*) FROM likes
 WHERE owner_id >0 AND item_type_id = 3
 AND owner_id IN (SELECT p3.user_id FROM (SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10) AS p3)
 GROUP BY owner_id;


