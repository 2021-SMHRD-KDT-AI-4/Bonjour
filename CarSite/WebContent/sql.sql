CREATE TABLE CAR_MEMBER(
	ID VARCHAR2(500) PRIMARY KEY,
	PW VARCHAR2(500) NOT NULL,
	ADDRESS VARCHAR2(500)NOT NULL,
	TEL VARCHAR2(500) NOT NULL
)

DROP table CAR_INFO

SELECT*FROM CAR_MEMBER;
	
CREATE TABLE CAR_INFO(
	CAR_NUM VARCHAR2(500),
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
	TIRE VARCHAR2(500),
	CAR_TYPE VARCHAR2(500),
	GEAR VARCHAR2(500),
	FUEL VARCHAR2(500),
	URL VARCHAR2(500)
)


INSERT INTO CAR_INFO VALUES('1','���','G70(DH)','3.3 GDI','�����','2016','9810','10','3342','282','35','FR','5','18','0','����','����','���ָ�');
INSERT INTO CAR_INFO VALUES('2','���','�� �� K7','1.6 ���ָ�','Ʈ����','2016','5810','10','2000','282','35','FR','5','18','215','������','����','���ָ�');
INSERT INTO CAR_INFO VALUES('3','���','�� �� K7','2,0 ���ָ�','���Ÿ�','2018','5810','10','2000','282','35','FR','5','18','235','������','����','���ָ�');
INSERT INTO CAR_INFO VALUES('4','���','���','���ָ� 2','����Ʈ','2016','1810','10','1999','282','35','FR','5','18','0','����','����','���ָ�');
INSERT INTO CAR_INFO VALUES('5','���','���','1.6 ���ָ�','Ʈ����','2017','1810','10','1999','282','35','FR','5','18','0','����','����','���ָ�');
INSERT INTO CAR_INFO VALUES('6','���','K7','���ָ� 2','�����','2016','6810','10','3342','282','35','FR','5','18','0','����','����','���ָ�');

SELECT*FROM CAR_INFO;
SELECT*FROM CAR_INFO2;

SELECT * FROM CAR_INFO WHERE car_num in (SELECT car_num FROM CAR_FAVORITE where id='1');

CREATE TABLE CAR_INFO2(
	CAR_NUM VARCHAR2(500),
	BRAND VARCHAR2(500),
	MODEL VARCHAR2(500),
	D_MODEL VARCHAR2(500),
	GRADE VARCHAR2(500),
	YEAR VARCHAR2(500),
	URL VARCHAR2(500)
)

INSERT INTO CAR_INFO2 VALUES('1','���','K5','���ָ� 2.0','����Ʈ','2010','https://www.kbchachacha.com/public/car/detail.kbc?carSeq=21715996');
INSERT INTO CAR_INFO2 VALUES('2','���','�� �� K7','2.2 ����','������Ƽ��','2016','https://www.kbchachacha.com/public/car/detail.kbc?carSeq=21236559');
INSERT INTO CAR_INFO2 VALUES('3','���','�� �� K7','2.4 GDI','������Ƽ��','2016','https://www.kbchachacha.com/public/car/detail.kbc?carSeq=21175742');
INSERT INTO CAR_INFO2 VALUES('4','���','�����','LX','�⺻��','2008','https://www.kbchachacha.com/public/car/detail.kbc?carSeq=20641226');
INSERT INTO CAR_INFO2 VALUES('5','���','�����','SLX','�����','2008','https://www.kbchachacha.com/public/car/detail.kbc?carSeq=21634400');

create sequence carsq_num start with 2000 increment by 1;

alter table GOODS_INFO MODIFY GOODS_NUM number;

INSERT INTO GOODS_INFO VALUES((carsq_num.nextval)/2,'1','12��1242','����','����','����','2ȸ');

SELECT * FROM CAR_INFO WHERE car_num in (SELECT car_num FROM CAR_FAVORITE where id='1');
