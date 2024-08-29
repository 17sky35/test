SELECT EMPLOYEE_ID ,FIRST_NAME,SALARY FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN('10','30') AND SALARY > 1500;

SELECT FIRST_NAME,JOB_ID FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL;

SELECT FIRST_NAME,JOB_ID,SALARY FROM EMPLOYEES 
WHERE JOB_ID IN ('IT_PROG','SA_MAN') AND SALARY NOT IN(1000,3000,5000);

-- TBL_STUDENT 
-- 학번, 이름, 전공, 성별, 생일
-- BAN_CHAR 체크 제약조건 위배
--INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
--VALUES (0,'홍길동','컴퓨터공학과','A','1980-01-02');

-- BAN_DATA 체크 제약조건 위배
--INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
--VALUES (0,'홍길동','컴퓨터공학과','M','1979-01-02');


INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES (0,'홍길동','컴퓨터공학과','M','1980-01-02');

INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES (1,'박디비','컴퓨터공학과','W','1990-02-06');

SELECT * FROM TBL_STUDENT;

--DEFAULT 값 사용해보기
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,BIRTH)
VALUES (2,'홍길동','컴퓨터공학과','1994-08-26');

--INSERT 할때 컬럼명을 생략하면 DEFAULT 값을 넣을 수 없다.
INSERT INTO TBL_STUDENT 
VALUES (3,'이자바','컴퓨터공학과','M','1994-08-26');
-- FLOWER 테이블에 데이터 넣기
-- F_NAME,F_COLOR,lPRICE

INSERT INTO FLOWER VALUES ('장미꽃','빨간색',3000);
INSERT INTO FLOWER VALUES ('해바라기','노란색',2000);
INSERT INTO FLOWER VALUES ('튤립','흰색',4000);

SELECT * FROM FLOWER ;

-- POT테이블 추가
-- P_NUMBER, P,COLOR, P_SHAPE, F_NAME
-- 화분테이블에 데이터를 추가할 때 꽃 테이블에 있는 꽃만 추가할 수 있다.
INSERT INTO POT VALUES (202408260001,'검은색','사각형','장미꽃');

SELECT * FROM POT;

CREATE TABLE FLOWER2(
	F_NAME2 VARCHAR2(200) PRIMARY KEY,
	F_COLOR2 VARCHAR2(100),
	F_PRICE2 NUMBER
);

INSERT INTO FLOWER2 (F_NAME2,F_COLOR2,F_PRICE2)
SELECT F_NAME, F_COLOR,F_PRICE
FROM FLOWER
WHERE F_PRICE >=3000;


SELECT * FROM FLOWER2;

-- 여러 테이블에 한번에 데이터를 추가하는것도 가능

INSERT ALL
INTO FLOWER VALUES('할미꽃','보라색',5000)
INTO FLOWER2 VALUES ('백함','흰색',7000)
SELECT * FROM DUAL;

UPDATE FLOWER2 
SET F_NAME2 = '백합'
WHERE F_NAME2 = '백함';

SELECT * FROM FLOWER ;
SELECT * FROM FLOWER2 ;

SELECT SYSDATE FROM DUAL;

-- PK와 FK로 연결된 테이블에서 외래키로 참조되고있는 데이터는
-- 부모테이블에서 삭제가 불가능하다.
DELETE FROM POT
WHERE F_NAME = '장미꽃';

DELETE FROM FLOWER
WHERE F_NAME = '장미꽃';

SELECT * FROM POT;
SELECT * FROM FLOWER;

DELETE FROM TBL_STUDENT 
WHERE NAME = '홍길동';


SELECT * FROM TBL_STUDENT;

UPDATE TBL_STUDENT SET
NAME = '홍길동'
GENDER = 'M'
WHERE ID = 1;

-- 회원과 관련된 기능
-- 로그인 -> SELECT
-- 회원가입 -> INSERT
-- 회원정보수정 -> UPDATE
-- 회원탈퇴 -> DELETE

-- 상품과 관련된 기능
-- 검색 -> SELECT
-- 상품추가 -> INSERT 
-- 재고수정(100->99) -> UPDATE
-- 상품삭제 -> DELETE

--사원테이블에서 급여를 많이 받는 순서대로 사번, 이름, 급여 입사일순으로 출력하되, 급여가 같은경우 입사일이 빠른순
FROM 테이블명 WHERE 조건식 OREDR BY 컬럼명 정렬방향;
SELECT EMPLOYEE_ID,FIRST_NAME, SALARY,HIRE_DATE 
FROM EMPLOYEES 
ORDER BY SALARY DESC, HIRE_DATE ASC;
-- 컬럼의 순서를 알고 있다면 번호로 정렬할 수 있다.
-- ORDER BY '8' DESC, '6';

SELECT *FROM EMPLOYEES;

SELECT EMPLOYEE_ID ,FIRST_NAME ,DEPARTMENT_ID ,JOB_ID ,SALARY 
FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID , JOB_ID , SALARY DESC;

SELECT EMPLOYEE_ID , FIRST_NAME , SALARY , HIRE_DATE 
FROM EMPLOYEES
WHERE SALARY >=15000
ORDER BY HIRE_DATE;

-- 문자와 관련된 함수

-- ASCII()
-- 지정된 문자의 ASCII값을 반환한다.
SELECT ASCII('A') FROM DUAL;

-- CHR()
-- 지정된 숫자의 ASCII문자를 반환한다.
SELECT CHR(65) FROM DUAL;

-- RPAD(데이터, 고정길이, 문자)
-- 데이터를 왼쪽으로 몰아서 정렬 후 생긴 빈 공백에 특정 문자를 채워 반환
SELECT RPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;

-- LPAD(데이터, 고정길이, 문자)
-- 데이터를 오른쪽으로 몰아서 정렬 후 생긴 빈 공백에 특정 문자를 채워 반환
SELECT LPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;

-- TRIM()
-- 문자열의 공백문자들을 삭제한다.
SELECT TRIM('    TRIM       ') FROM DUAL;

-- RTRIM()
-- 문자열의 오른쪽 공백 제거
SELECT RTRIM('    TRIM       ') FROM DUAL;

-- LTRIM()
-- 문자열의 왼쪽 공백 제거
SELECT LTRIM('    TRIM       ') FROM DUAL;

-- INSTR()
-- 특정문자의 위치를 반환
SELECT INSTR('HELLOW','O') FROM DUAL;
--INSTR(데이터,찾을문자,검색시작위치,몇번째 나오는지)
SELECT INSTR('HELLOW','L',1,2) FROM DUAL;
--찾는 문자열이 없으면 0을 반환한다.
SELECT INSTR('HELLOW','Z') FROM DUAL;

-- INITCAP()
-- 첫 문자를 대문자로 변환하는 함수
SELECT INITCAP('good morning/hi,hellow') FROM dual;

-- LENGTH()
-- 주어진 문자열의 길이를 반환
SELECT LENGTH('JHON') FROM DUAL;

-- CONCAT()
-- 주어진 두 문자열을 연결
SELECT CONCAT('HELLOW ', 'WORLD') FROM DUAL;
-- SUBSTR()
-- 문자열의 시작 위치부터 길이만큼 자른 후 반환
-- 길이는 생략 가능하면, 생략 시 문자열의 끝까지 반환한다.
SELECT SUBSTR('HELLO ORACLE', 2), SUBSTR('HELLO ORACLE',7,5) FROM DUAL;

-- REPLCAE(데이터, 원래글자, 바꿀글자)
SELECT REPLACE ('GOOD MORNING','MORNING','EVENING') FROM DUAL;

-- UPPER()
-- 주어진 문자열을 전부 대문자로 바꾼다.
SELECT UPPER('good morning') FROM DUAL;

-- LOWER()
SELECT LOWER('GOOD MORNING') FROM DUAL; 

SELECT  REPLACE(FIRST_NAME ,'el','**') FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >=6;

SELECT REPLACE(' H E L L O ',' ','') FROM DUAL;

CREATE TABLE PRODUCT2(
	"NO" NUMBER PRIMARY KEY,
	NAME VARCHAR2(100) NOT NULL,
	PRICE NUMBER,
	P_DATE DATE
);

INSERT INTO PRODUCT2 VALUES (1000,'컴퓨터',100,SYSDATE);
INSERT INTO PRODUCT2 VALUES (1001,'세탁기',60,SYSDATE);
INSERT INTO PRODUCT2 VALUES (1002,'냉장고',200,SYSDATE);
INSERT INTO PRODUCT2 VALUES (1003,'에어컨',300,SYSDATE);
INSERT INTO PRODUCT2 VALUES (1004,'오디오',20,SYSDATE);

DROP TABLE PRODUCT2;

SELECT * FROM PRODUCT2;

UPDATE PRODUCT2 SET
PRICE = 150
WHERE "NO" = 1000;


DELETE FROM PRODUCT2 
WHERE NAME = '세탁기'; 

SELECT * FROM PRODUCT2 ORDER BY PRICE DESC;



