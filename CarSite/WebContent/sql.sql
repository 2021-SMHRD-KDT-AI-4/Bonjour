CREATE TABLE CAR_MEMBER(
	ID VARCHAR2(500) PRIMARY KEY,
	PW VARCHAR2(500) NOT NULL,
	ADDRESS VARCHAR2(500)NOT NULL,
	TEL VARCHAR2(500) NOT NULL
)


SELECT*FROM CAR_MEMBER;
	


INSERT INTO CAR_INFO VALUES('1','���','G70(DH)','3.3 GDI','�����','2016','9810','10','3342','282','35','FR','5','18','0');
INSERT INTO CAR_INFO VALUES('2','���','�� �� K7','1.6 ���ָ�','Ʈ����','2016','5810','10','3342','282','35','FR','5','18','0');
INSERT INTO CAR_INFO VALUES('3','���','K7','���ָ� 2','����Ʈ','2016','8810','10','3342','282','35','FR','5','18','0');
INSERT INTO CAR_INFO VALUES('4','���','�� �� K7','1.6 ���ָ�','Ʈ����','2016','7810','10','3342','282','35','FR','5','18','0');
INSERT INTO CAR_INFO VALUES('5','���','K7','���ָ� 2','�����','2016','6810','10','3342','282','35','FR','5','18','0');

SELECT*FROM CAR_INFO;

SELECT * FROM CAR_INFO WHERE car_num in (SELECT car_num FROM CAR_FAVORITE where id='1');