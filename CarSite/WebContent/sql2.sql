CREATE TABLE CAR_FAVORITE(
	ID VARCHAR2(500),
	CAR_NUM VARCHAR2(500),
	CONSTRAINT CAR_FAVORITE_ID_FK FOREIGN KEY(ID) REFERENCES  CAR_MEMBER(ID),
	CONSTRAINT CAR_FAVORITE_CAR_NUM_FK FOREIGN KEY(CAR_NUM) REFERENCES  CAR_INFO(CAR_NUM)
)

INSERT INTO CAR_MEMBER VALUES('1','1','1','1');

SELECT * FROM CAR_FAVORITE;

DELETE FROM CAR_FAVORITE;

SELECT*FROM CAR_INFO;

CREATE TABLE CAR_INFO(
	CAR_NUM VARCHAR2(500) PRIMARY KEY,
	BRAND VARCHAR2(500),
	MODEL VARCHAR2(500),
	D_MODEL VARCHAR2(500),
	GRADE VARCHAR2(500),
	YEAR VARCHAR2(500),
	CARPRICE VARCHAR2(500),
	FE VARCHAR2(500),
	CC VARCHAR2(500),
	MAXOUTPUT VARCHAR2(500),
	MAXTORQUE VARCHAR2(500),
	DRIVESYSTEM VARCHAR2(500),
	PEOPLE VARCHAR2(500),
	WHEEL VARCHAR2(500),
	TIRE VARCHAR2(500)
)
DROP TABLE CAR_INFO CASCADE CONSTRAINT;

INSERT INTO CAR_FAVORITE VALUES('1','1');

DELETE FROM CAR_FAVORITE WHERE id='1' AND car_num='1';

DELETE FROM CAR_INFO cascade;

rollback;

INSERT INTO CAR_INFO VALUES('1','���','G70(DH)','3.3 GDI','�����','2016','9810','10','3342','282','35','FR','5','18','1');
INSERT INTO CAR_INFO VALUES('2','���','�� �� K7','1.6 ���ָ�','Ʈ����','2016','5810','10','3342','282','35','FRFR','5','18','2');
INSERT INTO CAR_INFO VALUES('3','���','K7','���ָ� 2','����Ʈ','2016','8810','10','3342','282','35','FRFRFR','5','18','3');
INSERT INTO CAR_INFO VALUES('4','���','�� �� K7','1.6 ���ָ�','Ʈ����','2016','7810','10','3342','282','35','FRFRFRFR','5','18','4');
INSERT INTO CAR_INFO VALUES('5','���','K7','���ָ� 2','�����','2016','6810','10','3342','282','35','FRFRFRFRFR','5','18','5');
commit

SELECT * FROM car_info where brand='���' and model='K7' and d_model='���ָ� 2' and grade='����Ʈ' and year='2016';

SELECT DISTINCT MODEL FROM CAR_INFO where brand='����';



SELECT * FROM(SELECT car_num,brand,model,d_model,grade FROM CAR_INFO WHERE car_num='311') T1 INNER JOIN (SELECT * FROM CAR_GOODS WHERE car_num = '311') T2 ON (T1.car_num = T2.car_num);
