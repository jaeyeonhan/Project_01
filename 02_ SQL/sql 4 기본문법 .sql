SELECT first_name FROM customer;
SELECT first_name, last_name FROM customer;
SELECT * FROM customer;
SHOW COLUMNS FROM sakila.customer;
SELECT * FROM customer WHERE first_name = 'MARIA';
SELECT * FROM customer WHERE address_id = 200;
SELECT * FROM customer WHERE address_id < 200;
SELECT * FROM customer WHERE first_name = 'MARIA';
SELECT * FROM customer WHERE first_name < 'MARIA';
SELECT * FROM payment WHERE payment_date = '2005-07-09 13:24:07';
SELECT * FROM payment WHERE payment_date < '2005-07-09';
SELECT * FROM customer WHERE address_id BETWEEN 5 AND 10;
SELECT * FROM payment WHERE payment_date BETWEEN '2005-06-17' AND '2005-07-19';
SELECT * FROM customer WHERE first_name BETWEEN 'M' AND 'O';
SELECT * FROM customer WHERE first_name NOT BETWEEN 'M' AND 'O';
SELECT * FROM city WHERE city = 'Sunnyvale' AND country_id = 103;
SELECT * FROM payment WHERE payment_date >= '2005-06-01' AND payment_date <= '2005-07-05';
SELECT * FROM customer WHERE first_name = 'MARIA' OR first_name = 'LINDA';

-- IN은 OR과 같은 역활을 하지만 연산자 한개 작성하고 쉼표를 사용해서 조건을 나열한다
SELECT * FROM customer WHERE first_name IN ('MARIA', 'LINDA', 'NANCY'); 



SELECT * FROM city WHERE (country_id = 103 OR country_id = 86) AND city IN ('Cheju', 'Sunnyvale', 'Dallas');
SELECT * FROM address;
SELECT * FROM address WHERE address2 IS NULL;
SELECT * FROM address WHERE address2 IS NOT NULL;
SELECT * FROM address WHERE address2 = '';
SELECT * FROM customer ORDER BY first_name;
SELECT * FROM customer ORDER BY store_id, first_name;
SELECT * FROM customer ORDER BY first_name DESC;
SELECT * FROM customer ORDER BY customer_id DESC, first_name ASC;
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC LIMIT 10;
-- 특정 조건에 해당하는 데이터중 N개의 데이터만 보고 싶은 경우 - 첫 매개변수 다음 행부터 두번째 매개변수 (N)개의 행을 조회한다.
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 101, 10;
-- offset에 지정한 행 만큼 건너고 limit에 지정한 개수만큼 출력 조회한다.  offset 반드시 LIMIT 와 함께 사용한다. 
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 10 OFFSET 100;
-- LIKE;원하는 값을 일부 키워드만으로 조회 

-- 시작하는 
SELECT * FROM customer WHERE first_name LIKE 'A%';
-- 끝나는 
SELECT * FROM customer WHERE first_name LIKE '%A';
-- A include
SELECT * FROM customer WHERE first_name LIKE '%A%'; 
SELECT * FROM customer WHERE first_name LIKE '%RA'; 
-- a not inclue 
SELECT * FROM customer WHERE first_name NOT LIKE '%A%';
-- 특수 문자를 조회 할 경우 -  ESCAPE
WITH CTE (col_1) AS ( 
SELECT 'A%BC' UNION ALL 
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)

SELECT * FROM CTE WHERE col_1 LIKE '%';
WITH CTE (col_1) AS ( 
SELECT 'A%BC' UNION ALL 
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
-- # #. & ! / 도 사용할 수 있다. -> %%% = %가 들어간 데이터를 검색
SELECT * FROM CTE WHERE col_1 LIKE '%#%%' ESCAPE '#'; 

-- 문자열 길이 2
SELECT * FROM customer WHERE first_name LIKE 'A_'; 
-- 문자열 길이 3 A로 시작
SELECT * FROM customer WHERE first_name LIKE 'A__'; 
-- 문자열 길이 3 A로 끝남
SELECT * FROM customer WHERE first_name LIKE '__A';
-- 길이 5글자
SELECT * FROM customer WHERE first_name LIKE '_____'; 
-- A_R로 시작하고 몇글자인지 상관 없음
SELECT * FROM customer WHERE first_name LIKE 'A_R%';  
SELECT * FROM customer WHERE first_name LIKE '__R%';
SELECT * FROM customer WHERE first_name LIKE 'A%R_';
-- K로 시작하거나  N으로 끝나는 
SELECT * FROM customer WHERE first_name REGEXP '^K|N$'; 
SELECT * FROM customer WHERE first_name REGEXP 'K[L-N]';
SELECT * FROM customer WHERE first_name REGEXP 'K[^L-N]';
SELECT * FROM customer WHERE first_name LIKE 'S%' AND first_name REGEXP 'A[L-N]';
-- 총 7 글자이고 A 뒤에 L , N사이에 글자가 있고. 마지막 글자는 o
SELECT * FROM customer WHERE first_name LIKE '_______' AND first_name REGEXP 'A[L-N]' AND first_name REGEXP 'O$'; 
SELECT special_features FROM film GROUP BY special_features;
SELECT rating FROM film GROUP BY rating;
SELECt special_features, rating FROM film GROUP BY special_features, rating;
SELECT special_features, COUNT(*) AS Cnt FROM film GROUP BY special_features;
SELECT special_features, rating, COUNT(*) AS Cnt FROM film 
GROUP BY special_features, rating ORDER BY special_features, rating, Cnt DESC;
-- 그룸화 후 rating 열에서 G인 데이터만 필터링
SELECT special_features, rating FROM film GROUP BY special_features, rating HAVING rating = 'G'; 
SELECT special_features, COUNT(*) AS cnt FROM film GROUP BY special_features HAVING cnt > 70;
-- 그룹화 하거나 계산 작업 즉 count 할 수 없다.반드시 group by 절을 사용해야 한다.
SELECT distinct special_features, rating FROM film; 

