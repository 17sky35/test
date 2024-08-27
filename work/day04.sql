-- 숫자함수

-- ABS()
-- 절대값을 반환한다.
SELECT -10, ABS(-10) FROM DUAL;

-- ROUND()
-- 반올림
SELECT ROUND(1234.567,1), ROUND(1234.567,-1) ,ROUND(1234.567) FROM DUAL;

-- FLOOR()
-- 주어진 숫자보다 작거나 같은 정수중 최대값을 반환한다.
SELECT FLOOR (2), FLOOR(2.1) FROM DUAL;

-- TRUNC()
-- 버림
SELECT TRUNC(1234.567,1), TRUNC(1234.567,-1) ,TRUNC(1234.567) FROM DUAL;

-- CEIL()
-- 올림
SELECT CEIL(2), CEIL(2.1) FROM DUAL;

-- MOD()
-- 나누기 후 나머지를 반환

SELECT MOD(1,4),MOD(2,3), MOD(3,3), MOD(4,3), MOD(0,3) FROM DUAL;

-- POWER()
-- 주어진 숫자의 지정된 수만큼 제곱한다.
SELECT POWER(2,1), POWER(2,2), POWER(2,3), POWER(2,0) FROM DUAL;

--
SELECT EMPLOYEE_ID,MOD(EMPLOYEE_ID,2) 
FROM EMPLOYEES;

SELECT EMPLOYEE_ID ,FIRST_NAME 
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID,2) = 0
ORDER BY EMPLOYEE_ID; 

SELECT FIRST_NAME , SALARY , RPAD('■',CEIL(SALARY/1000),'■')
FROM EMPLOYEES;

-- 날짜함수

-- 날짜 + 날짜는 안됨
-- 날짜끼리의 연산은 안됨
-- SYSDATE : 현재 날짜를 반환

-- ADD_MONTHS()
-- 특정날짜에 개월수를 더한 날을 반환한다.
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL; 

-- MONTHS_BETWEEN()
-- 두 날짜 사이의 개월수를 반환
SELECT SYSDATE,HIRE_DATE ,  TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEES;

-- NEXT_DAY()
-- 주어진 날짜 다음에 나타나는 지정일(1:일요일 ~ 7:토요일)
SELECT SYSDATE, NEXT_DAY(SYSDATE,1) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'일요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'일') FROM DUAL;

SELECT FIRST_NAME , HIRE_DATE , ADD_MONTHS(SYSDATE, 6) 
FROM EMPLOYEES;

SELECT FIRST_NAME , ADD_MONTHS(HIRE_DATE,42) 
FROM EMPLOYEES
WHERE EMPLOYEE_ID =120;

SELECT FIRST_NAME, HIRE_DATE , TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEES
ORDER BY HIRE_DATE ;

SELECT FIRST_NAME ,HIRE_DATE , TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE),1)
FROM EMPLOYEES
WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= 200
ORDER BY HIRE_DATE;

-- 형변환 함수
-- TO_CHAR()
-- 날짜를 형식에 맞춰 문자열로 변환
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD'),
TO_CHAR(SYSDATE,'YYYY-MM-DD DAY'),
TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'),
SYSDATE 
FROM DUAL;

	-- 날짜 포맷형식
	-- SCC, CC : 세기
	-- YYYY, YY : 년도
	-- mm : 월
	-- DD : 일
	-- DAY : 요일
	-- MON : 월명(JAN)
	-- MONTH : 월명(JANUARY)
	-- HH, HH24 : 시간
	-- MI : 분
	-- SS : 초

SELECT TO_CHAR(1234567,'9,999,999') FROM DUAL;
SELECT TO_CHAR(1234567,'L9,999,999') FROM DUAL;
SELECT TO_CHAR(12,'0999') FROM DUAL;

SELECT TO_DATE('2024.08.27') FROM DUAL; 
SELECT TO_DATE('08.27.2024','MM,DD,YYYY') FROM DUAL;
SELECT TO_DATE('2024.08','YYYY,MM') FROM DUAL; -- 일 입력하지않으면 1일로 자동으로 나온다
SELECT TO_DATE('11','DD') FROM DUAL; -- 해당 년도 해당 월로 자동으로 나온다

SELECT EMPLOYEE_ID ,FIRST_NAME,SALARY,COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

SELECT EMPLOYEE_ID ,FIRST_NAME,SALARY,NVL(COMMISSION_PCT,0)
FROM EMPLOYEES;

SELECT EMPLOYEE_ID ,FIRST_NAME,SALARY,NVL2(COMMISSION_PCT,1,0)
FROM EMPLOYEES;

SELECT RANK () OVER(ORDER BY SALARY DESC), FIRST_NAME ,SALARY 
FROM EMPLOYEES;

SELECT DENSE_RANK () OVER(ORDER BY SALARY DESC), FIRST_NAME ,SALARY 
FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES;
SELECT MIN(SALARY) FROM EMPLOYEES;
SELECT MAX(SALARY) FROM EMPLOYEES;
SELECT AVG(SALARY) FROM EMPLOYEES;
SELECT SUM(SALARY) FROM EMPLOYEES;

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

SELECT AVG(SALARY),MAX(SALARY),MIN(SALARY)
FROM EMPLOYEES 
WHERE JOB_ID = 'SA_REP';

SELECT COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY),2)
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 80;

SELECT DEPARTMENT_ID ,AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
SELECT DEPARTMENT_ID ,JOB_ID ,COUNT(*)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ,JOB_ID 
ORDER BY DEPARTMENT_ID ;

SELECT JOB_ID ,COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT JOB_ID ,SUM(SALARY)
FROM EMPLOYEES 
GROUP BY JOB_ID;

SELECT DEPARTMENT_ID ,MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID ,SUM(SALARY)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
ORDER BY SUM(SALARY) DESC;

CREATE TABLE 월별매출 (
    상품ID VARCHAR2(5),
    월 VARCHAR2(10),
    회사 VARCHAR2(10),
    매출액 INTEGER );
    
INSERT INTO  월별매출 VALUES ('P001', '2019.10', '삼성', 15000);
INSERT INTO  월별매출 VALUES ('P001', '2019.11', '삼성', 25000);
INSERT INTO  월별매출 VALUES ('P002', '2019.10', 'LG', 10000);
INSERT INTO  월별매출 VALUES ('P002', '2019.11', 'LG', 20000);
INSERT INTO  월별매출 VALUES ('P003', '2019.10', '애플', 15000);
INSERT INTO  월별매출 VALUES ('P003', '2019.11', '애플', 10000);

SELECT *FROM 월별매출;

SELECT 상품ID, 월 , SUM(매출액)
FROM 월별매출
GROUP BY ROLLUP(상품ID,월);

SELECT 상품ID, 월, SUM(매출액)
FROM 월별매출
GROUP BY CUBE(상품ID, 월);

SELECT 상품ID, 월, SUM(매출액)
FROM 월별매출
GROUP BY GROUPING SETS(상품ID, 월);

SELECT DEPARTMENT_ID ,MAX(SALARY),MAX(SALARY),COUNT(*)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING SUM(SALARY) >=8000;

SELECT DEPARTMENT_ID ,SUM(SALARY),ROUND(AVG(SALARY),1),COUNT(*) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >=20;

SELECT DEPARTMENT_ID ,JOB_ID ,COUNT(*)
FROM EMPLOYEES
--WHERE JOB_ID LIKE '%MAN'; -- WHERE은 GROUP BY 보다 먼저
GROUP BY DEPARTMENT_ID,JOB_ID
HAVING JOB_ID LIKE '%MAN';

SELECT DEPARTMENT_ID ,TRUNC(AVG(SALARY),1)
FROM EMPLOYEES 
WHERE DEPARTMENT_ID <=50
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY) <10000;

SELECT DEPARTMENT_ID ,SUM(SALARY),ROUND(AVG(SALARY),1),COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING SUM(SALARY) >=30000;

CREATE TABLE TEST001(
ID VARCHAR2(20) PRIMARY KEY,
PW VARCHAR2(10),
AGE NUMBER
);

SELECT * FROM TEST001 ;


SELECT * FROM ALL_INDEXES WHERE TABLE_NAME = 'EMPLOYEES';

SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME ='Michael' AND JOB_ID ='MK_MAN';

SELECT EMPLOYEE_ID ,FIRST_NAME ,JOB_ID ,SALARY 
FROM EMPLOYEES 
WHERE SALARY >13000;

-- 두 쿼리문 합치기

SELECT EMPLOYEE_ID ,FIRST_NAME ,JOB_ID ,SALARY 
FROM EMPLOYEES 
WHERE SALARY >(SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME ='Michael' AND JOB_ID ='MK_MAN');

SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM EMPLOYEES 
WHERE SALARY =(SELECT SALARY 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 150);

SELECT FIRST_NAME ,SALARY 
FROM EMPLOYEES 
WHERE SALARY >=(
SELECT AVG(SALARY)
FROM EMPLOYEES
);

SELECT EMPLOYEE_ID ,FIRST_NAME ,JOB_ID ,SALARY 
FROM EMPLOYEES 
WHERE JOB_ID = (
SELECT JOB_ID 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 111) AND SALARY > (
SELECT SALARY 
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 159);







